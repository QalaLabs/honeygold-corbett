import sys
import os
import json
import re
import urllib3
try:
    sys.stdout.reconfigure(encoding='utf-8')
except Exception:
    pass
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

sys.path.append(r'C:\Users\aashi\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.13_qbz5n2kfra8p0\LocalCache\local-packages\Python313\site-packages')
import requests
import bs4

HEADERS = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
    'Accept-Language': 'en-US,en;q=0.9',
}

HOTELS = [
    {
        'id': 1,
        'name': 'Paatlidun Safari Lodge',
        'slug': 'paatlidun-safari-lodge',
        'url': 'https://www.paatlidun.com/',
        'zone': 'mohaan',
        'zone_label': 'Mohaan / Bakrakot, Corbett',
        'category': 'luxury',
        'tier_badge': '5-Star Ultra Luxury Wildlife Lodge',
        'price': 24000,
        'rooms': ['Bush Cottage', 'Luxury Cottage', 'Premium Cottage'],
        'default_amenities': ['Private Plunge Pool', 'Open-Air Star Bed', 'Arijana Wellness Spa', 'Kumaoni Fine Dining', 'Chahi Wildlife Library']
    },
    {
        'id': 2,
        'name': 'Saraca Resort Corbett (Lebua)',
        'slug': 'saraca-resort-corbett-lebua',
        'url': 'https://saraca.in/corbett/',
        'zone': 'mohaan',
        'zone_label': 'Mohaan / Bakrakot, Corbett',
        'category': 'luxury',
        'tier_badge': '5-Star Luxury Eco-Resort',
        'price': 16500,
        'rooms': ['Premium Room', 'Family Cottage', 'Premium Suite One Bedroom', 'Two Bedroom Forest View', 'Two Bedroom Pond View'],
        'default_amenities': ['Infinity Pool', 'Saraca Spa & Ayurveda', 'Horse Riding & Stables', 'Azrak Multi-Cuisine', 'Panoramic Pond View']
    },
    {
        'id': 3,
        'name': 'Namah Resort Corbett',
        'slug': 'namah-resort-corbett',
        'url': 'https://www.namah.in/',
        'zone': 'dhikuli',
        'zone_label': 'Dhikuli, Jim Corbett (Kosi Riverbank)',
        'category': 'luxury',
        'tier_badge': '5-Star Riverside Sanctuary',
        'price': 13500,
        'rooms': ['Superior', 'Premium'],
        'default_amenities': ['Kosi Riverfront', 'Pratha All-Day Dining', 'Boond Bar', 'Spa & Fitness Center', 'Grand Ballroom']
    },
    {
        'id': 4,
        'name': 'The Corbett Hideaway by Leisure',
        'slug': 'the-corbett-hideaway-by-leisure',
        'url': 'https://www.leisurehotels.co.in/the-corbett-hideaway/',
        'zone': 'dhikuli',
        'zone_label': 'Dhikuli, Jim Corbett',
        'category': 'premium',
        'tier_badge': '4-Star Heritage Forest Hideaway',
        'price': 11000,
        'rooms': ['Deluxe', 'Superior'],
        'default_amenities': ['Mango Orchard Setting', 'Kosi Riverside Sit-out', 'Outdoor Swimming Pool', 'The Den Wilderness Spa', 'Safari Desk']
    },
    {
        'id': 5,
        'name': 'The Riverview Retreat',
        'slug': 'the-riverview-retreat',
        'url': 'https://www.leisurehotels.co.in/the-riverview-retreat-corbett-resort/',
        'zone': 'dhikuli',
        'zone_label': 'Dhikuli, Jim Corbett (Kosi Riverfront)',
        'category': 'premium',
        'tier_badge': '4-Star Riverfront Retreat',
        'price': 9500,
        'rooms': ['Deluxe', 'Deluxe Cottage', 'Superior', 'Duplex', 'Suite', 'Premium'],
        'default_amenities': ['8-Acre Riverfront Lawns', 'Gurney House Restaurant', 'Jim’s Bar', 'Swimming Pool with Kids Pool', 'River Rafting Assistance']
    },
    {
        'id': 6,
        'name': 'Bellmont Caves Resort',
        'slug': 'bellmont-caves-resort',
        'url': 'https://bellmontcaves.com/',
        'zone': 'mohaan',
        'zone_label': 'Mohaan, Corbett',
        'category': 'mid',
        'tier_badge': 'Boutique Cave-Themed Resort',
        'price': 5500,
        'rooms': ['Deluxe', 'Executive'],
        'default_amenities': ['Unique Stone Cave Architecture', 'Valley View Decks', 'Campfire & Acoustic Evenings', 'Outdoor Pool', 'Multi-Cuisine Cafe']
    },
    {
        'id': 7,
        'name': 'ZANA Resort Jim Corbett',
        'slug': 'zana-resort-jim-corbett',
        'url': 'https://www.zanaresorts.com/zana-forest-resort-corbett/',
        'zone': 'mohaan',
        'zone_label': 'Mohaan / Kosi Valley',
        'category': 'luxury',
        'tier_badge': '5-Star Luxury Boutique Retreat',
        'price': 17000,
        'rooms': ['Classic', 'Riverview', 'Tiger Tales Suite', 'Luxury Cottage with Fireplace'],
        'default_amenities': ['Private Fireplaces', 'Bespoke River Dining', 'Heated Outdoor Pool', 'Curated Safari Botanist', 'Artisanal Bar']
    },
    {
        'id': 8,
        'name': 'Lemon Tree Premier Corbett',
        'slug': 'lemon-tree-premier-corbett',
        'url': 'https://www.lemontreehotels.com/lemon-tree-premier/jim-corbett/resort-corbett',
        'zone': 'mohaan',
        'zone_label': 'Mohaan, Corbett',
        'category': 'premium',
        'tier_badge': '4-Star Upscale Riverside Resort',
        'price': 10500,
        'rooms': ['Double'],
        'default_amenities': ['Citrus Cafe', 'Fresco Spa & Wellness', 'Outdoor Swimming Pool', 'Slak Bar', 'Riverside Walking Trails']
    },
    {
        'id': 9,
        'name': 'The Solluna Resort',
        'slug': 'the-solluna-resort',
        'url': 'https://www.sollunaresort.com/',
        'zone': 'marchula',
        'zone_label': 'Marchula Valley, Ramganga',
        'category': 'luxury',
        'tier_badge': '5-Star Eco-Luxury Resort',
        'price': 10500,
        'rooms': ['Superior', 'Deluxe', 'Premier'],
        'default_amenities': ['Ramganga Riverbed Setting', 'Open-Air Amphitheatre', 'Rain Dance & Star Gazing', 'Presidential Cottages', 'Natural Pebble Beach']
    },
    {
        'id': 10,
        'name': 'Club Mahindra Corbett',
        'slug': 'club-mahindra-corbett',
        'url': 'https://www.clubmahindra.com/our-resorts/club-mahindra-corbett-uttarakhand',
        'zone': 'mohaan',
        'zone_label': 'Mohaan, Corbett',
        'category': 'premium',
        'tier_badge': '4-Star Family Jungle Resort',
        'price': 8500,
        'rooms': ['Superior'],
        'default_amenities': ['Family Adventure Hub', 'Machan Multi-Cuisine', 'Swimming Pool', 'Indoor Play Arena', 'Guided Nature Walks']
    },
    {
        'id': 11,
        'name': 'La Pearle River Resort',
        'slug': 'la-pearle-river-resort',
        'url': 'https://lapearleriverresort.com/',
        'zone': 'dhikuli',
        'zone_label': 'Dhikuli, Jim Corbett',
        'category': 'mid',
        'tier_badge': '3-Star Riverfront Stay',
        'price': 4500,
        'rooms': ['Std'],
        'default_amenities': ['Direct Kosi Riverbank Access', 'Swimming Pool', 'Riverview Dining Lawn', 'Bonfire Pit', 'Safari Booking Desk']
    },
    {
        'id': 12,
        'name': 'Mango Bloom River Resort',
        'slug': 'mango-bloom-river-resort',
        'url': 'https://www.mangobloomresort.com/',
        'zone': 'mohaan',
        'zone_label': 'Mohaan, Corbett',
        'category': 'mid',
        'tier_badge': '3-Star River Retreat',
        'price': 4800,
        'rooms': ['Std'],
        'default_amenities': ['Shaded Mango Grove Lawns', 'Mountain Stream Frontage', 'Outdoor Pool', 'Adventure Obstacle Course', 'Riverside Tea Terrace']
    },
    {
        'id': 13,
        'name': 'Excel Resort Corbett',
        'slug': 'excel-resort-corbett',
        'url': 'http://excelresortcorbett.com/',
        'zone': 'mohaan',
        'zone_label': 'Mohaan / Ramnagar',
        'category': 'budget',
        'tier_badge': 'Economy Forest Stay',
        'price': 3500,
        'rooms': ['Std'],
        'default_amenities': ['Economical AC Cottages', 'Lush Garden Sitting', 'Outdoor Swimming Pool', 'Group Safari Planning', 'In-House Dining']
    },
    {
        'id': 14,
        'name': 'Corbett River Creek Resort & Spa',
        'slug': 'corbett-river-creek-resort-spa',
        'url': 'https://www.corbettrivercreek.com/',
        'zone': 'marchula',
        'zone_label': 'Marchula, Ramganga',
        'category': 'premium',
        'tier_badge': '4-Star Riverview Lodge & Spa',
        'price': 9000,
        'rooms': ['Creek', 'Premium', 'Creek Luxury'],
        'default_amenities': ['Ramganga Creek Confluence', 'Glass-Front River Suites', 'Ayurvedic Wellness Spa', 'Infinity Pool', 'Angling Assistance']
    },
    {
        'id': 15,
        'name': 'Corbett The Baagh Spa & Resort',
        'slug': 'corbett-the-baagh-spa-resort',
        'url': 'https://www.corbettthebaagh.com/',
        'zone': 'kyari-patkot',
        'zone_label': 'Patkot Valley, Corbett',
        'category': 'luxury',
        'tier_badge': '5-Star Mountain & Valley Resort',
        'price': 13500,
        'rooms': ['Jungle Cat', 'Spotted Cat', 'Leopard Cat', 'Leopard Suite'],
        'default_amenities': ['360° Himalayan Mountain Views', 'Cat-Themed Luxury Suites', 'Infinity Swimming Pool', 'Aranyam Wellness Spa', 'Organic Kitchen Garden']
    },
    {
        'id': 16,
        'name': 'Bela Monde Riverside Resort',
        'slug': 'bela-monde-riverside-resort',
        'url': 'https://belamonde.in/bela-monde-riverside-resort-corbett/',
        'zone': 'dhikuli',
        'zone_label': 'Dhikuli, Jim Corbett',
        'category': 'premium',
        'tier_badge': '4-Star Boutique Riverside Resort',
        'price': 7500,
        'rooms': ['Std', 'Deluxe'],
        'default_amenities': ['Direct Kosi Riverbed Access', 'Riverside Balcony Rooms', 'Sparkling Swimming Pool', 'Evening Live Music', 'Barbecue & Bonfire']
    },
    {
        'id': 17,
        'name': 'Tarangi Resort & Spa',
        'slug': 'tarangi-resort-spa',
        'url': 'https://www.tarangiresort.com/',
        'zone': 'dhikuli',
        'zone_label': 'Dhikuli, Jim Corbett',
        'category': 'luxury',
        'tier_badge': '5-Star Riverview Spa & Villa Resort',
        'price': 15500,
        'rooms': ['Sarang', 'Luxury Cottage', 'River View Cottage', 'Jal Pool Villa', 'Whispering 4 Bedroom'],
        'default_amenities': ['Private Jal Pool Villas', 'Sanskriti Ayurvedic Spa', 'Riverfront Infinity Pool', 'Panorama All-Day Dining', 'Riverside Wedding Lawns']
    },
    {
        'id': 18,
        'name': 'Tarangi Ramganga Resort',
        'slug': 'tarangi-ramganga-resort',
        'url': 'https://www.tarangiramgangaresort.com/',
        'zone': 'marchula',
        'zone_label': 'Marchula Valley, Ramganga',
        'category': 'premium',
        'tier_badge': '4-Star Riverside Wilderness Resort',
        'price': 9200,
        'rooms': ['Deluxe Cottage', 'Super Dlx Cottage', 'Ramganga Suite', 'Pine Cottage', 'Duplex Cottage', 'River Facing Family Cottage'],
        'default_amenities': ['Ramganga River Mahseer Angling', 'Helipad on Premise', 'Riverside Cottage Duplexes', 'Outdoor Pool', 'Riverside Dining Gazebos']
    },
    {
        'id': 19,
        'name': 'Alaya Resort',
        'slug': 'alaya-resort',
        'url': 'https://www.alayaresorts.com/',
        'zone': 'kyari-patkot',
        'zone_label': 'Kyari Village, Corbett',
        'category': 'mid',
        'tier_badge': 'Eco-Heritage Village Resort',
        'price': 5200,
        'rooms': ['Double'],
        'default_amenities': ['Kyari Heritage Village Setting', 'Dense Sal Forest Canopy', 'Cycling & Nature Trails', 'Eco-Swimming Pool', 'Organic Farm Dining']
    },
    {
        'id': 20,
        'name': 'Country Inn Riverside Resort',
        'slug': 'country-inn-riverside-resort',
        'url': 'https://www.countryinnhotels.com/jim-corbett-resort/',
        'zone': 'dhikuli',
        'zone_label': 'Dhikuli, Jim Corbett',
        'category': 'premium',
        'tier_badge': '4-Star Luxury Cottage Resort',
        'price': 9800,
        'rooms': ['Jungle View', 'Jims Cottage', 'Cottage with Terrace', 'Cottage with Garden', 'Cottage with Plunge Pool'],
        'default_amenities': ['Private Plunge Pool Cottages', 'Botanical Gardens & Mango Trees', 'Kosi River Beach Sit-Out', 'Revive Spa & Pool', 'Aqua Bar & Buffet']
    },
    {
        'id': 21,
        'name': 'The Golden Tusk',
        'slug': 'the-golden-tusk',
        'url': 'https://thegoldentusk.com/',
        'zone': 'dhela',
        'zone_label': 'Dhela (Near Jhirna & Dhela Gates)',
        'category': 'luxury',
        'tier_badge': '5-Star Forest & Safari Resort',
        'price': 13500,
        'rooms': ['Garden Suite', 'Nature View / Luxury Tents', 'Pool View Suite', 'Corbett Suite', 'Villa', 'Villa Grande', 'Tusk Suite', 'Tiger Suite (4 Pax)'],
        'default_amenities': ['5 Mins from Jhirna & Dhela Gates', 'Luxury Glamping Safari Tents', 'Golden Pebble Spa', 'Two Swimming Pools', 'Adventure Activity Zone']
    },
    {
        'id': 22,
        'name': 'jüSTa Lazy Haven Corbett',
        'slug': 'justa-lazy-haven-corbett',
        'url': 'https://www.justahotels.com/justa-lazy-haven-corbett/',
        'zone': 'ramnagar',
        'zone_label': 'Chhoi / Ramnagar',
        'category': 'premium',
        'tier_badge': '4-Star Boutique Art Resort',
        'price': 7200,
        'rooms': ['Superior with Balcony', 'Deluxe with Balcony'],
        'default_amenities': ['Signature Art Collection', 'Spacious Private Balconies', 'Outdoor Swimming Pool', 'Sabor Gourmet Restaurant', 'Manicured Mountain Lawns']
    },
    {
        'id': 23,
        'name': 'Shervani Pebbles & Pines',
        'slug': 'shervani-pebbles-pines',
        'url': 'https://www.shervanihotels.com/shervani-pebbles-and-pines-corbett/',
        'zone': 'dhikuli',
        'zone_label': 'Dhikuli, Jim Corbett',
        'category': 'premium',
        'tier_badge': '4-Star Premium Jacuzzi Resort',
        'price': 8200,
        'rooms': ['Deluxe Garden View', 'Premium Garden', 'Superior with Jacuzzi'],
        'default_amenities': ['Private Outdoor Jacuzzis', 'Bijrani Gate Proximity', 'Forest Spa Therapies', 'Swimming Pool with Sun Deck', 'Lush Tropical Gardens']
    },
    {
        'id': 24,
        'name': 'Sterling Corbett',
        'slug': 'sterling-corbett',
        'url': 'https://www.sterlingholidays.com/resorts-hotels/corbett',
        'zone': 'marchula',
        'zone_label': 'Marchula Valley, Ramganga',
        'category': 'premium',
        'tier_badge': '4-Star Hillside Riverside Resort',
        'price': 7800,
        'rooms': ['Classic', 'Premier'],
        'default_amenities': ['Panoramic Ramganga River Views', 'Hillside Stargazing Telescope', 'Multi-Cuisine Air-Deck Restaurant', 'Infinity Swimming Pool', 'Jungle Treks']
    },
    {
        'id': 25,
        'name': 'Silvanza Resort',
        'slug': 'silvanza-resort',
        'url': 'https://silvanzaresort.com/',
        'zone': 'mohaan',
        'zone_label': 'Mohaan, Corbett',
        'category': 'mid',
        'tier_badge': '3-Star Eco-Forest Stay',
        'price': 4200,
        'rooms': ['Origin', 'Breeze'],
        'default_amenities': ['Peaceful Mohaan Woods', 'Origin & Breeze Cottages', 'Personal Verandas & Garden Swings', 'Swimming Pool', 'Campfire Evenings']
    },
    {
        'id': 26,
        'name': 'Sterling Corbett Quinta',
        'slug': 'sterling-corbett-quinta',
        'url': 'https://www.sterlingholidays.com/resorts-hotels/corbett-quinta',
        'zone': 'dhikuli',
        'zone_label': 'Dhikuli, Jim Corbett',
        'category': 'premium',
        'tier_badge': '4-Star Contemporary Safari Stay',
        'price': 7500,
        'rooms': ['Classic', 'Premier'],
        'default_amenities': ['Prime Dhikuli Safari Strip', 'Rapid Safari Jeep Dispatch', 'Outdoor Swimming Pool', 'Contemporary Buffet Dining', 'Lush Forest Lawns']
    },
    {
        'id': 27,
        'name': 'Aura by Xperience Corbett',
        'slug': 'aura-by-xperience-corbett',
        'url': 'https://www.auracorbett.com/',
        'zone': 'semalkhaliya',
        'zone_label': 'Semalkhaliya, Bailparao',
        'category': 'premium',
        'tier_badge': '4-Star Plunge Pool & Mud Cottages',
        'price': 8900,
        'rooms': ['Deluxe Cottage', 'Mud Cottage', 'Premium', 'Elegant Plunge Pool', 'Family Villa 4 Pax'],
        'default_amenities': ['Private Plunge Pool Villas', 'Authentic Mud Architecture', '4-Pax Family Villas', 'Swimming Pool & Sun Loungers', 'Rustic Organic Dining']
    },
    {
        'id': 28,
        'name': 'The Cloyster Resort & Spa',
        'slug': 'the-cloyster-resort-spa',
        'url': 'https://thecloysterresort.com/',
        'zone': 'mohaan',
        'zone_label': 'Mohaan / Dhikuli Border',
        'category': 'premium',
        'tier_badge': '4-Star Hill Facing Luxury Resort',
        'price': 8200,
        'rooms': ['Deluxe Garden View', 'Premium Jungle View', 'Luxury Hill Facing', 'Pool View'],
        'default_amenities': ['Dramatic Kumaon Cliff Backdrop', 'Hill-Facing Private Balconies', 'Swimming Pool', 'Cloyster Spa Sanctuary', 'Multi-Cuisine Restaurant']
    },
    {
        'id': 29,
        'name': 'Anantum Gateway Resorts & Spa',
        'slug': 'anantum-gateway-resorts-spa',
        'url': 'https://anantumgatewayresorts.com/',
        'zone': 'semalkhaliya',
        'zone_label': 'Semalkhaliya, Bailparao',
        'category': 'luxury',
        'tier_badge': '5-Star Luxury Destination Resort',
        'price': 12000,
        'rooms': ['Deluxe', 'Executive', 'Plunge Pool Cottage'],
        'default_amenities': ['Private Plunge Pool Cottages', 'Grand Destination Wedding Lawns', 'Luxury Spa & Sauna', 'Adventure Theme Park', 'Multiple Dining Pavilions']
    },
    {
        'id': 30,
        'name': 'Dhikala Forest Rest House',
        'slug': 'dhikala-forest-rest-house',
        'url': 'https://www.corbettnationalpark.in/dhikala-forest-lodge.htm',
        'zone': 'dhikala',
        'zone_label': 'Dhikala Core Wildlife Zone',
        'category': 'core',
        'tier_badge': 'Government Core FRH (Deep Jungle)',
        'price': 5000,
        'rooms': ['Dhikala Forest Cabin', 'Hutment', 'New Forest Rest House Room'],
        'default_amenities': ['Inside Core Tiger Reserve', 'Ramganga Reservoir Panorama', 'Deep Jungle Safari Hub', 'Solar-Fenced Wilderness Compound', 'Authentic Colonial Heritage Lodge']
    }
]

print(f'Configured {len(HOTELS)} hotels for live scraping.')

def clean_text(text):
    if not text:
        return ''
    text = re.sub(r'\s+', ' ', text)
    text = re.sub(r'[\r\n\t]', ' ', text)
    # Remove common junk
    text = re.sub(r'©.*', '', text)
    text = re.sub(r'Cookie Policy.*', '', text, flags=re.IGNORECASE)
    return text.strip()

def scrape_hotel(hotel):
    url = hotel['url']
    name = hotel['name']
    hid = hotel['id']
    print(f"Scraping [{hid}/30] {name} ({url})...")
    
    scraped = {
        'id': hotel['id'],
        'name': name,
        'slug': hotel['slug'],
        'url': url,
        'zone': hotel['zone'],
        'zone_label': hotel['zone_label'],
        'category': hotel['category'],
        'tier_badge': hotel['tier_badge'],
        'price': hotel['price'],
        'rooms': hotel['rooms'],
        'amenities': hotel['default_amenities'],
        'scraped_title': '',
        'scraped_description': '',
        'scraped_paragraphs': [],
        'scraped_image': '',
        'success': False
    }

    try:
        r = requests.get(url, headers=HEADERS, timeout=12, verify=False)
        if r.status_code in [200, 201, 301, 302]:
            soup = bs4.BeautifulSoup(r.text, 'html.parser')
            
            # Title
            if soup.title and soup.title.string:
                scraped['scraped_title'] = clean_text(soup.title.string)
            
            # Meta description
            meta_desc = (
                soup.find('meta', attrs={'name': 'description'}) or 
                soup.find('meta', attrs={'property': 'og:description'}) or
                soup.find('meta', attrs={'name': 'twitter:description'})
            )
            if meta_desc and meta_desc.get('content'):
                scraped['scraped_description'] = clean_text(meta_desc['content'])

            # OG Image
            og_img = soup.find('meta', attrs={'property': 'og:image'})
            if og_img and og_img.get('content') and og_img['content'].startswith('http'):
                scraped['scraped_image'] = og_img['content']

            # Check JSON-LD
            for script in soup.find_all('script', type='application/ld+json'):
                try:
                    data = json.loads(script.string)
                    if isinstance(data, dict):
                        if 'description' in data and not scraped['scraped_description']:
                            scraped['scraped_description'] = clean_text(data['description'])
                    elif isinstance(data, list):
                        for item in data:
                            if isinstance(item, dict) and 'description' in item and not scraped['scraped_description']:
                                scraped['scraped_description'] = clean_text(item['description'])
                except Exception:
                    pass

            # Extract body paragraphs
            paragraphs = []
            for p in soup.find_all(['p', 'div', 'span'], class_=lambda c: c and any(x in str(c).lower() for x in ['about', 'overview', 'desc', 'content', 'intro'])):
                txt = clean_text(p.get_text())
                if len(txt) > 80 and txt not in paragraphs:
                    paragraphs.append(txt)
            
            if not paragraphs:
                for p in soup.find_all('p'):
                    txt = clean_text(p.get_text())
                    if len(txt) > 80 and not any(junk in txt.lower() for junk in ['javascript', 'cookie', 'copyright', 'all rights reserved']):
                        if txt not in paragraphs:
                            paragraphs.append(txt)

            scraped['scraped_paragraphs'] = paragraphs[:5]
            scraped['success'] = True
            stitle = scraped['scraped_title'][:60]
            print(f"  [OK] Success! Title: {stitle}...")
            if scraped['scraped_description']:
                sdesc = scraped['scraped_description'][:80]
                print(f"  [OK] Meta Desc: {sdesc}...")
            elif scraped['scraped_paragraphs']:
                spara = scraped['scraped_paragraphs'][0][:80]
                print(f"  [OK] Para Desc: {spara}...")
        else:
            print(f"  [FAIL] HTTP {r.status_code}")
    except Exception as e:
        print(f"  [FAIL] Scrape failed: {e}")

    return scraped

results = []
for h in HOTELS:
    res = scrape_hotel(h)
    results.append(res)

with open('database/scraped_hotels_raw.json', 'w', encoding='utf-8') as f:
    json.dump(results, f, indent=2, ensure_ascii=False)

print(f'\nScraping complete! Raw data saved to database/scraped_hotels_raw.json. Total: {len(results)}')
