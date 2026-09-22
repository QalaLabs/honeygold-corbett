import json
import sqlite3
import re
import os

print("Starting synchronization of Scraped Hotel Data across all systems...")

# 1. Load Enriched Hotel Data
with open('database/scraped_hotels_final.json', 'r', encoding='utf-8') as f:
    hotels = json.load(f)

print(f"Loaded {len(hotels)} hotels from database/scraped_hotels_final.json")

# 2. Update SQLite Database (corbett.db)
db_path = 'database/corbett.db'
conn = sqlite3.connect(db_path)
cur = conn.cursor()

# Check if official_website column exists in hotels
cur.execute("PRAGMA table_info(hotels)")
columns = [row[1] for row in cur.fetchall()]
if 'official_website' not in columns:
    print("Adding official_website column to hotels table...")
    cur.execute("ALTER TABLE hotels ADD COLUMN official_website VARCHAR(500)")

# Update each hotel in DB
for h in hotels:
    amenities_str = ",".join([a['label'] for a in h['amenities_list']])
    cur.execute("""
        UPDATE hotels 
        SET description = ?,
            amenities = ?,
            official_website = ?,
            rating = ?,
            reviews_count = ?,
            starting_price = ?,
            tier_badge = ?,
            category = ?,
            zone = ?,
            zone_label = ?
        WHERE id = ?
    """, (
        h['description'],
        amenities_str,
        h['official_website'],
        h['rating'],
        h['reviews_count'],
        h['price'],
        h['tier_badge'],
        h['category'],
        h['zone'],
        h['zone_label'],
        h['id']
    ))

conn.commit()
print("Successfully updated database/corbett.db!")

# 3. Update SQL Dump (database/corbett_schema_and_data.sql)
# Re-generate clean SQL dump from sqlite
with open('database/corbett_schema_and_data.sql', 'w', encoding='utf-8') as f:
    f.write("-- ==========================================================\n")
    f.write("-- Honeygold Corbett Domestic Tourism Database\n")
    f.write("-- Comprehensive Schema for Resorts, Room Categories, Safaris & Inquiries\n")
    f.write("-- Compatible with SQLite, MySQL, and PostgreSQL\n")
    f.write("-- ==========================================================\n\n")
    for line in conn.iterdump():
        f.write(f"{line}\n")
print("Successfully updated database/corbett_schema_and_data.sql!")
conn.close()

# 4. Update assets/js/corbett-data.js
# Load existing corbett-data.js and replace window.CORBETT_INITIAL_DB.hotels
with open('assets/js/corbett-data.js', 'r', encoding='utf-8') as f:
    js_content = f.read()

# Build updated hotels array for corbett-data.js
js_hotels = []
for h in hotels:
    js_hotels.append({
        "id": h['id'],
        "name": h['name'],
        "slug": h['slug'],
        "zone": h['zone'],
        "zone_label": h['zone_label'],
        "category": h['category'],
        "tier_badge": h['tier_badge'],
        "price": float(h['price']),
        "rating": float(h['rating']),
        "reviews": int(h['reviews_count']),
        "official_website": h['official_website'],
        "image": h['image'],
        "amenities": h['amenities_filter'],
        "amenities_list": [a['label'] for a in h['amenities_list']],
        "description": h['description'],
        "rooms": h['rooms']
    })

# Format cleanly using exact string slicing
hotels_marker_start = "hotels: ["
rooms_marker = "rooms: ["

idx_start = js_content.find(hotels_marker_start)
idx_rooms = js_content.find(rooms_marker)

if idx_start != -1 and idx_rooms != -1:
    js_prefix = js_content[:idx_start]
    js_suffix = js_content[idx_rooms:]
    formatted_hotels = "hotels: " + json.dumps(js_hotels, indent=4) + ",\n    "
    js_content = js_prefix + formatted_hotels + js_suffix
    with open('assets/js/corbett-data.js', 'w', encoding='utf-8') as f:
        f.write(js_content)
    print("Successfully updated assets/js/corbett-data.js via string slice!")
else:
    print("Warning: Could not find markers in corbett-data.js")

# 5. Update assets/js/booking.js window.CORBETT_HOTEL_ROOMS
with open('assets/js/booking.js', 'r', encoding='utf-8') as f:
    booking_js = f.read()

room_map = {}
for h in hotels:
    room_map[h['name']] = h['rooms']

b_start_marker = "window.CORBETT_HOTEL_ROOMS = {"
b_end_marker = "};"

b_idx1 = booking_js.find(b_start_marker)
if b_idx1 != -1:
    b_idx2 = booking_js.find(b_end_marker, b_idx1)
    if b_idx2 != -1:
        new_rooms_block = "window.CORBETT_HOTEL_ROOMS = " + json.dumps(room_map, indent=4)
        booking_js = booking_js[:b_idx1] + new_rooms_block + booking_js[b_idx2:]
        with open('assets/js/booking.js', 'w', encoding='utf-8') as f:
            f.write(booking_js)
        print("Successfully synchronized assets/js/booking.js with exact room categories!")

# 6. Generate HTML Cards and Update hotel.html
cards_html = []
for idx, h in enumerate(hotels, 1):
    room_chips = []
    for r in h['rooms']:
        room_chips.append(
            f'<a href="#stay-booking" class="hotel-room-chip" data-hotel="{h["name"]}" data-room="{r}" '
            f'style="background: #f4f6f8; color: #212529; font-size: 12px; font-weight: 600; padding: 3px 10px; border-radius: 14px; border: 1px solid #e0e4e8; text-decoration: none;">{r}</a>'
        )
    chips_html = "\n                                                ".join(room_chips)

    amenities_spans = []
    for a in h['amenities_list']:
        amenities_spans.append(f'<span><i class="{a["icon"]}"></i> {a["label"]}</span>')
    amenities_html = "\n                                            ".join(amenities_spans)

    card = f"""                            <!-- Hotel {idx}: {h['name']} -->
                            <div class="hotel-card d-flex flex-column flex-md-row bg-white" style="border-radius: 12px; overflow: hidden; box-shadow: 0px 4px 20px rgba(0,0,0,0.06);" data-zone="{h['zone']}" data-category="{h['category']}" data-amenities="{h['amenities_filter']}" data-price="{h['price']}">
                                <div class="hotel-image" style="flex: 1; min-height: 250px; position: relative; overflow: hidden;">
                                    <img src="{h['image']}" onerror="this.onerror=null;this.src='assets/img/inner-page/hotel/01.jpg';" alt="{h['name']}" class="hotel-img-zoom" style="object-fit: cover; width: 100%; height: 100%; min-height: 260px;">
                                </div>
                                <div class="hotel-info p-4" style="flex: 1.3; display: flex; flex-direction: column; justify-content: space-between;">
                                    <div>
                                        <div class="d-flex flex-wrap align-items-center justify-content-between gap-2 mb-2">
                                            <div class="d-flex flex-wrap gap-2">
                                                <span class="badge-corbett-area"><i class="fa-solid fa-location-dot"></i> {h['zone_label']}</span>
                                                <span class="badge-resort-tier"><i class="fa-solid fa-crown"></i> {h['tier_badge']}</span>
                                            </div>
                                            <div class="d-flex align-items-center gap-2">
                                                <span class="badge-rating" style="background: #fff8eb; color: #d97706; padding: 3px 8px; border-radius: 6px; font-size: 12px; font-weight: 700;">
                                                    <i class="fa-solid fa-star text-warning"></i> {h['rating']} <small style="color: #666; font-weight: 500;">({h['reviews_count']} reviews)</small>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-wrap align-items-center justify-content-between gap-2 mb-1">
                                            <h4 style="font-weight: 800; color: #151515; margin: 0;">{h['name']}</h4>
                                            <a href="{h['official_website']}" target="_blank" rel="noopener noreferrer" style="color: #63AB45; font-size: 12.5px; font-weight: 700; text-decoration: none; display: inline-flex; align-items: center; gap: 5px; white-space: nowrap;">
                                                <i class="fa-solid fa-globe"></i> Official Site <i class="fa-solid fa-arrow-up-right-from-square" style="font-size: 10px;"></i>
                                            </a>
                                        </div>
                                        <p style="color: #696969; font-size: 13.5px; line-height: 1.6; margin-bottom: 10px;">
                                            {h['description']}
                                        </p>
                                        <div class="mt-2 mb-2">
                                            <span style="font-size: 11px; font-weight: 800; color: #444; text-transform: uppercase; letter-spacing: 0.5px; display: block; margin-bottom: 4px;">RM Categories:</span>
                                            <div class="d-flex flex-wrap gap-1">
                                                {chips_html}
                                            </div>
                                        </div>
                                        <div class="amenities d-flex flex-wrap gap-3 mt-2" style="color: #63AB45; font-size: 12px; font-weight: 600;">
                                            {amenities_html}
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mt-3 pt-3" style="border-top: 1px solid #f0f0f0;">
                                        <div>
                                            <span style="font-size: 11px; color: #888; display: block;">Starting from</span>
                                            <span style="font-size: 18px; font-weight: 800; color: #151515;">₹{h['price']:,} <span style="font-weight: 400; font-size: 12px; color: #696969;">/ night</span></span>
                                        </div>
                                        <button type="button" class="theme-btn book-stay-btn" data-hotel="{h['name']}" style="padding: 7px 16px; font-size: 12px; border: none; cursor: pointer;">Book Stay</button>
                                    </div>
                                </div>
                            </div>"""
    cards_html.append(card)

all_cards_string = "\n\n".join(cards_html)

# Read hotel.html
with open('hotel.html', 'r', encoding='utf-8') as f:
    hotel_html = f.read()

# Marker replacement:
# start marker: <div class="hotel-list-wrapper d-flex flex-column gap-4" id="hotel-list">
# end marker: <!-- Empty State message -->
start_marker = '<div class="hotel-list-wrapper d-flex flex-column gap-4" id="hotel-list">'
end_marker = '<!-- Empty State message -->'

start_idx = hotel_html.find(start_marker)
end_idx = hotel_html.find(end_marker)

if start_idx == -1 or end_idx == -1:
    print(f"Error: Markers not found! start_idx={start_idx}, end_idx={end_idx}")
else:
    # Everything before hotel-list opening tag plus the opening tag
    before = hotel_html[:start_idx + len(start_marker)] + "\n\n"
    # Everything from end_marker onwards
    after = "\n                        </div>\n\n                        " + hotel_html[end_idx:]
    
    new_hotel_html = before + all_cards_string + after
    with open('hotel.html', 'w', encoding='utf-8') as f:
        f.write(new_hotel_html)
    print("Successfully updated hotel.html with all 30 enriched hotel cards!")

print("\nALL SYSTEMS SYNCHRONIZED SUCCESSFULLY!")
