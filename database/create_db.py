import os
import sqlite3
import json

# Ensure database directory exists
db_dir = os.path.dirname(os.path.abspath(__file__))
os.makedirs(db_dir, exist_ok=True)
db_path = os.path.join(db_dir, "corbett.db")
sql_path = os.path.join(db_dir, "corbett_schema_and_data.sql")

# Remove existing db if present to build clean
if os.path.exists(db_path):
    os.remove(db_path)

conn = sqlite3.connect(db_path)
cur = conn.cursor()

# 1. Create Tables DDL
schema_ddl = """
-- ==========================================================
-- Honeygold Corbett Domestic Tourism Database
-- Comprehensive Schema for Resorts, Room Categories, Safaris & Inquiries
-- Compatible with SQLite, MySQL, and PostgreSQL
-- ==========================================================

DROP TABLE IF EXISTS inquiries_tickets;
DROP TABLE IF EXISTS room_categories;
DROP TABLE IF EXISTS hotels;
DROP TABLE IF EXISTS safari_zones;
DROP TABLE IF EXISTS activities;
DROP TABLE IF EXISTS site_content;

CREATE TABLE hotels (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    zone VARCHAR(100) NOT NULL,
    zone_label VARCHAR(150) NOT NULL,
    category VARCHAR(100) NOT NULL,
    tier_badge VARCHAR(150) NOT NULL,
    starting_price DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    rating DECIMAL(3, 1) DEFAULT 4.5,
    reviews_count INT DEFAULT 45,
    main_image VARCHAR(500) NOT NULL,
    amenities TEXT,
    description TEXT,
    is_featured BOOLEAN DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE room_categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    hotel_id INT NOT NULL,
    category_name VARCHAR(150) NOT NULL,
    description TEXT,
    pax_capacity VARCHAR(50) DEFAULT '2 Adults + 1 Child',
    base_price DECIMAL(10, 2) DEFAULT 0.00,
    image_url VARCHAR(500),
    sort_order INT DEFAULT 1,
    FOREIGN KEY (hotel_id) REFERENCES hotels (id) ON DELETE CASCADE
);

CREATE TABLE safari_zones (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    zone_name VARCHAR(150) NOT NULL,
    gate_name VARCHAR(150) NOT NULL,
    zone_type VARCHAR(50) DEFAULT 'Core',
    morning_timings VARCHAR(100) DEFAULT '06:00 AM - 09:30 AM',
    evening_timings VARCHAR(100) DEFAULT '02:30 PM - 06:00 PM',
    gypsy_price DECIMAL(10, 2) DEFAULT 4500.00,
    canter_price DECIMAL(10, 2) DEFAULT 1800.00,
    max_vehicles INT DEFAULT 30,
    best_season VARCHAR(150) DEFAULT 'Nov - June',
    description TEXT
);

CREATE TABLE activities (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(150) NOT NULL,
    category VARCHAR(100) NOT NULL,
    duration VARCHAR(50) DEFAULT '3 Hours',
    price_per_person DECIMAL(10, 2) DEFAULT 0.00,
    description TEXT,
    image_url VARCHAR(500)
);

CREATE TABLE inquiries_tickets (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ticket_number VARCHAR(50) UNIQUE NOT NULL,
    guest_name VARCHAR(150) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    email VARCHAR(150),
    check_in_date DATE,
    guests_count VARCHAR(50) DEFAULT '2 Adults',
    service_type VARCHAR(150) DEFAULT 'Hotel Lodge Stay',
    hotel_name VARCHAR(255),
    room_category VARCHAR(150),
    special_requests TEXT,
    status VARCHAR(50) DEFAULT 'New',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE site_content (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    section_key VARCHAR(100) UNIQUE NOT NULL,
    page_name VARCHAR(50) NOT NULL,
    title VARCHAR(255) NOT NULL,
    subtitle VARCHAR(255),
    content TEXT,
    image_url VARCHAR(500),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_hotels_zone ON hotels(zone);
CREATE INDEX idx_hotels_category ON hotels(category);
CREATE INDEX idx_rooms_hotel ON room_categories(hotel_id);
CREATE INDEX idx_tickets_number ON inquiries_tickets(ticket_number);
"""

cur.executescript(schema_ddl)

# 2. Hotels Data Definition (All 30 Properties)
hotels_data = [
    {
        "name": "Paatlidun Safari Lodge",
        "slug": "paatlidun-safari-lodge",
        "zone": "mohaan",
        "zone_label": "Mohaan / Bakrakot, Corbett",
        "category": "5-star",
        "tier_badge": "5-Star Luxury Wildlife Lodge",
        "price": 24000,
        "rating": 4.9,
        "reviews": 128,
        "image": "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80",
        "amenities": "pool,riverfront,spa,plunge_pool",
        "description": "Nestled on the edge of Corbett park along the Kumaon foothills, Paatlidun features private plunge pools, open-air star-beds on terraces, and handcrafted stone cottages steeped in rustic wildlife heritage.",
        "rooms": ["Bush Cottage", "Luxury Cottage", "Premium Cottage"]
    },
    {
        "name": "Saraca Resort Corbett (Lebua)",
        "slug": "saraca-resort-corbett-lebua",
        "zone": "mohaan",
        "zone_label": "Mohaan / Bakrakot, Corbett",
        "category": "5-star",
        "tier_badge": "5-Star Luxury Eco-Resort",
        "price": 18500,
        "rating": 4.8,
        "reviews": 142,
        "image": "https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&q=80",
        "amenities": "pool,spa,balcony",
        "description": "Spread across 9 acres of dense green foliage adjacent to the reserve forest, Saraca offers luxurious suites with panoramic views of landscaped ponds and thick woodland.",
        "rooms": ["Premium Room", "Family Cottage", "Premium Suite One Bedroom", "Two Bedroom Forest View", "Two Bedroom Pond View"]
    },
    {
        "name": "Namah Resort Corbett",
        "slug": "namah-resort-corbett",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett",
        "category": "5-star",
        "tier_badge": "5-Star Riverside Sanctuary",
        "price": 14500,
        "rating": 4.8,
        "reviews": 210,
        "image": "https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=800&q=80",
        "amenities": "pool,riverfront,spa,balcony",
        "description": "Surrounded by natural beauty and lush greenery, Namah sits directly along the tranquil Kosi riverbanks with grand riverview balconies and expansive ballroom facilities.",
        "rooms": ["Superior", "Premium"]
    },
    {
        "name": "The Corbett Hideaway by Leisure",
        "slug": "the-corbett-hideaway-by-leisure",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett",
        "category": "4-star",
        "tier_badge": "4-Star Heritage Forest Hideaway",
        "price": 11000,
        "rating": 4.7,
        "reviews": 95,
        "image": "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800&q=80",
        "amenities": "pool,riverfront,spa",
        "description": "A charming hideaway nestled inside mango orchards along the Kosi river. Provides authentic thatched roofs, warm timber cottages, and intimate jungle hospitality.",
        "rooms": ["Deluxe", "Superior"]
    },
    {
        "name": "The Riverview Retreat",
        "slug": "the-riverview-retreat",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett",
        "category": "4-star",
        "tier_badge": "4-Star Riverfront Retreat",
        "price": 9500,
        "rating": 4.8,
        "reviews": 320,
        "image": "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=80",
        "amenities": "pool,riverfront,spa,balcony",
        "description": "Sprawled over 8 acres along the banks of River Kosi, this retreat features sloping tiled roofs, cool stone floors, and private garden sit-outs ideal for large families.",
        "rooms": ["Deluxe", "Deluxe Cottage", "Superior", "Duplex", "Suite", "Premium"]
    },
    {
        "name": "Bellmont Caves Resort",
        "slug": "bellmont-caves-resort",
        "zone": "mohaan",
        "zone_label": "Mohaan, Corbett",
        "category": "mid-range",
        "tier_badge": "Boutique Cave-Themed Resort",
        "price": 6000,
        "rating": 4.4,
        "reviews": 68,
        "image": "https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&q=80",
        "amenities": "pool,balcony",
        "description": "A unique architectural stay carved with rustic cave motifs and stone textures, offering scenic valley views and thrilling campfire evenings.",
        "rooms": ["Deluxe", "Executive"]
    },
    {
        "name": "ZANA Resort Jim Corbett",
        "slug": "zana-resort-jim-corbett",
        "zone": "mohaan",
        "zone_label": "Mohaan / Kosi Valley",
        "category": "5-star",
        "tier_badge": "5-Star Luxury Boutique Retreat",
        "price": 17000,
        "rating": 4.9,
        "reviews": 84,
        "image": "https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800&q=80",
        "amenities": "pool,riverfront,spa,balcony",
        "description": "Curated luxury offering vintage architecture, private garden fireplaces, bespoke riverside picnic experiences, and spacious suites tailored for discerning wildlife travelers.",
        "rooms": ["Classic", "Riverview", "Tiger Tales Suite", "Luxury Cottage with Fireplace"]
    },
    {
        "name": "Lemon Tree Premier Corbett",
        "slug": "lemon-tree-premier-corbett",
        "zone": "mohaan",
        "zone_label": "Mohaan, Corbett",
        "category": "4-star",
        "tier_badge": "4-Star Upscale Riverside Resort",
        "price": 10500,
        "rating": 4.6,
        "reviews": 240,
        "image": "https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800&q=80",
        "amenities": "pool,riverfront,spa",
        "description": "Overlooking the meandering Kosi River, Lemon Tree Premier blends contemporary flair with scenic natural vistas, featuring outdoor lawns and wellness spas.",
        "rooms": ["Double"]
    },
    {
        "name": "The Solluna Resort",
        "slug": "the-solluna-resort",
        "zone": "marchula",
        "zone_label": "Marchula Valley, Ramganga",
        "category": "5-star",
        "tier_badge": "5-Star Eco-Luxury Resort",
        "price": 10500,
        "rating": 4.7,
        "reviews": 190,
        "image": "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800&q=80",
        "amenities": "pool,riverfront,spa,balcony",
        "description": "Situated in the scenic Marchula valley along the Ramganga riverbed, Solluna offers presidential and fragrance cottages, open-air amphitheatre, rain dance, and starry night dining.",
        "rooms": ["Superior", "Deluxe", "Premier"]
    },
    {
        "name": "Club Mahindra Corbett",
        "slug": "club-mahindra-corbett",
        "zone": "mohaan",
        "zone_label": "Mohaan, Corbett",
        "category": "4-star",
        "tier_badge": "4-Star Family Jungle Resort",
        "price": 8500,
        "rating": 4.6,
        "reviews": 310,
        "image": "https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=800&q=80",
        "amenities": "pool,spa,balcony",
        "description": "Designed for wholesome family getaways with manicured gardens, indoor recreational zones, guided jungle safaris, and comfortable cottage suites.",
        "rooms": ["Superior"]
    },
    {
        "name": "La Pearle River Resort",
        "slug": "la-pearle-river-resort",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett",
        "category": "mid-range",
        "tier_badge": "3-Star Riverfront Stay",
        "price": 4500,
        "rating": 4.3,
        "reviews": 115,
        "image": "https://images.unsplash.com/photo-1445019980597-93fa8acb246c?w=800&q=80",
        "amenities": "pool,riverfront",
        "description": "Perched on the rim of River Kosi in Dhikuli village, La Pearle offers budget-conscious travelers picturesque waterside views and tranquil green courtyards.",
        "rooms": ["Std"]
    },
    {
        "name": "Mango Bloom River Resort",
        "slug": "mango-bloom-river-resort",
        "zone": "mohaan",
        "zone_label": "Mohaan, Corbett",
        "category": "mid-range",
        "tier_badge": "3-Star River Retreat",
        "price": 4800,
        "rating": 4.2,
        "reviews": 90,
        "image": "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=800&q=80",
        "amenities": "pool,riverfront",
        "description": "Set amidst shady mango groves alongside shimmering mountain waters, Mango Bloom is ideal for nature walks, birdwatching, and riverside tea sessions.",
        "rooms": ["Std"]
    },
    {
        "name": "Excel Resort Corbett",
        "slug": "excel-resort-corbett",
        "zone": "mohaan",
        "zone_label": "Mohaan / Ramnagar",
        "category": "budget",
        "tier_badge": "Economy Forest Stay",
        "price": 3500,
        "rating": 4.0,
        "reviews": 55,
        "image": "https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=800&q=80",
        "amenities": "pool",
        "description": "Comfortable, economical rooms with prompt safari assistance, outdoor parking, and friendly service for backpackers and wildlife tour groups.",
        "rooms": ["Std"]
    },
    {
        "name": "Corbett River Creek Resort & Spa",
        "slug": "corbett-river-creek-resort-spa",
        "zone": "marchula",
        "zone_label": "Marchula, Ramganga",
        "category": "4-star",
        "tier_badge": "4-Star Riverview Lodge & Spa",
        "price": 9000,
        "rating": 4.7,
        "reviews": 165,
        "image": "https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800&q=80",
        "amenities": "pool,riverfront,spa,balcony",
        "description": "Surrounded on three sides by dense Sal forest and the Ramganga creek, this scenic lodge features glass-front river cottages and rejuvenating spa therapies.",
        "rooms": ["Creek", "Premium", "Creek Luxury"]
    },
    {
        "name": "Corbett The Baagh Spa & Resort",
        "slug": "corbett-the-baagh-spa-resort",
        "zone": "kyari",
        "zone_label": "Patkot Valley, Corbett",
        "category": "5-star",
        "tier_badge": "5-Star Mountain & Valley Resort",
        "price": 13500,
        "rating": 4.8,
        "reviews": 178,
        "image": "https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800&q=80",
        "amenities": "pool,spa,balcony",
        "description": "Hidden away in the serene Patkot valley, The Baagh provides magnificent 360-degree Himalayan and jungle foothill views, cat-themed luxury suites, and an infinity pool.",
        "rooms": ["Jungle Cat", "Spotted Cat", "Leopard Cat", "Leopard Suite"]
    },
    {
        "name": "Bela Monde Riverside Resort",
        "slug": "bela-monde-riverside-resort",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett",
        "category": "4-star",
        "tier_badge": "4-Star Boutique Riverside Resort",
        "price": 8000,
        "rating": 4.5,
        "reviews": 88,
        "image": "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&q=80",
        "amenities": "pool,riverfront,balcony",
        "description": "Located directly on the Kosi riverbed in Dhikuli, Bela Monde offers spacious rooms with private riverside balconies, evening music, and campfire lawns.",
        "rooms": ["Std", "Deluxe"]
    },
    {
        "name": "Tarangi Resort & Spa",
        "slug": "tarangi-resort-spa",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett",
        "category": "5-star",
        "tier_badge": "5-Star Riverview Spa & Villa Resort",
        "price": 16000,
        "rating": 4.9,
        "reviews": 380,
        "image": "https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&q=80",
        "amenities": "pool,riverfront,spa,plunge_pool,balcony",
        "description": "One of Corbett's premier luxury addresses. Features riverside Sarang rooms, private Jal pool villas, an opulent Sanskriti spa, and grand lawns for destination weddings.",
        "rooms": ["Sarang", "Luxury Cottage", "River View Cottage", "Jal Pool Villa", "Whispering 4 Bedroom"]
    },
    {
        "name": "Tarangi Ramganga Resort",
        "slug": "tarangi-ramganga-resort",
        "zone": "marchula",
        "zone_label": "Marchula Valley, Ramganga",
        "category": "4-star",
        "tier_badge": "4-Star Riverside Wilderness Resort",
        "price": 9500,
        "rating": 4.7,
        "reviews": 130,
        "image": "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800&q=80",
        "amenities": "pool,riverfront,balcony",
        "description": "A historic property on the banks of River Ramganga, famed for Mahseer angling, riverside cottage duplexes, and quiet forest valley escapes.",
        "rooms": ["Deluxe Cottage", "Super Dlx Cottage", "Ramganga Suite", "Pine Cottage", "Duplex Cottage", "River Facing Family Cottage"]
    },
    {
        "name": "Alaya Resort",
        "slug": "alaya-resort",
        "zone": "kyari",
        "zone_label": "Kyari Village, Corbett",
        "category": "mid-range",
        "tier_badge": "Eco-Heritage Village Resort",
        "price": 5500,
        "rating": 4.4,
        "reviews": 75,
        "image": "https://images.unsplash.com/photo-1470770841072-f978cf4d019e?w=800&q=80",
        "amenities": "pool,balcony",
        "description": "Situated in scenic Kyari village amidst agricultural fields and dense Sal forest, Alaya delivers village-style serenity, organic cuisine, and cycling tours.",
        "rooms": ["Double"]
    },
    {
        "name": "Country Inn Riverside Resort",
        "slug": "country-inn-riverside-resort",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett",
        "category": "4-star",
        "tier_badge": "4-Star Luxury Cottage Resort",
        "price": 10000,
        "rating": 4.6,
        "reviews": 215,
        "image": "https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?w=800&q=80",
        "amenities": "pool,riverfront,spa,plunge_pool,balcony",
        "description": "Known for its sprawling botanical grounds, standalone Jim's cottages with terraces, and exclusive suites featuring private plunge pools overlooking river rocks.",
        "rooms": ["Jungle View", "Jims Cottage", "Cottage with Terrace", "Cottage with Garden", "Cottage with Plunge Pool"]
    },
    {
        "name": "The Golden Tusk",
        "slug": "the-golden-tusk",
        "zone": "dhela",
        "zone_label": "Dhela (Near Jhirna Gate)",
        "category": "5-star",
        "tier_badge": "5-Star Forest & Safari Resort",
        "price": 14000,
        "rating": 4.8,
        "reviews": 290,
        "image": "https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=800&q=80",
        "amenities": "pool,spa,balcony",
        "description": "Set along the Dhela River countryside just 5 minutes from Dhela and Jhirna safari gates. Boasts lavish suites, luxury safari tents, multi-cuisine dining, and swimming pools.",
        "rooms": ["Garden Suite", "Nature View / Luxury Tents", "Pool View Suite", "Corbett Suite", "Villa", "Villa Grande", "Tusk Suite", "Tiger Suite (4 Pax)"]
    },
    {
        "name": "jüSTa Lazy Haven Corbett",
        "slug": "justa-lazy-haven-corbett",
        "zone": "ramnagar",
        "zone_label": "Chhoi / Ramnagar",
        "category": "4-star",
        "tier_badge": "4-Star Boutique Art Resort",
        "price": 7500,
        "rating": 4.5,
        "reviews": 110,
        "image": "https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=800&q=80",
        "amenities": "pool,balcony",
        "description": "Art-inspired boutique stay nestled amongst lush flora. Each room opens into a spacious balcony overlooking forested hills and landscaped gardens.",
        "rooms": ["Superior with Balcony", "Deluxe with Balcony"]
    },
    {
        "name": "Shervani Pebbles & Pines",
        "slug": "shervani-pebbles-pines",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett",
        "category": "4-star",
        "tier_badge": "4-Star Premium Jacuzzi Resort",
        "price": 8500,
        "rating": 4.6,
        "reviews": 145,
        "image": "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80",
        "amenities": "pool,spa,jacuzzi,balcony",
        "description": "Boasts designer rooms equipped with private outdoor Jacuzzis, manicured lawns, and close proximity to the famous Bijrani safari gate.",
        "rooms": ["Deluxe Garden View", "Premium Garden", "Superior with Jacuzzi"]
    },
    {
        "name": "Sterling Corbett",
        "slug": "sterling-corbett",
        "zone": "marchula",
        "zone_label": "Marchula Valley, Ramganga",
        "category": "4-star",
        "tier_badge": "4-Star Hillside Riverside Resort",
        "price": 8000,
        "rating": 4.5,
        "reviews": 185,
        "image": "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=800&q=80",
        "amenities": "pool,riverfront,balcony",
        "description": "Perched on a hillside overlooking the sparkling Ramganga River. Features river-facing stargazing platforms, evening barbecue, and adventure trails.",
        "rooms": ["Classic", "Premier"]
    },
    {
        "name": "Silvanza Resort",
        "slug": "silvanza-resort",
        "zone": "mohaan",
        "zone_label": "Mohaan, Corbett",
        "category": "mid-range",
        "tier_badge": "3-Star Eco-Forest Stay",
        "price": 4200,
        "rating": 4.1,
        "reviews": 60,
        "image": "https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&q=80",
        "amenities": "pool,balcony",
        "description": "A tranquil haven tucked into the woods of Mohaan. Offers clean, modern Origin & Breeze cottages with personal verandas and garden swings.",
        "rooms": ["Origin", "Breeze"]
    },
    {
        "name": "Sterling Corbett Quinta",
        "slug": "sterling-corbett-quinta",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett",
        "category": "4-star",
        "tier_badge": "4-Star Contemporary Safari Stay",
        "price": 7800,
        "rating": 4.4,
        "reviews": 92,
        "image": "https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800&q=80",
        "amenities": "pool,balcony",
        "description": "Conveniently located along the main Dhikuli safari corridor. Features quick safari dispatch, cozy bedding, and multi-cuisine buffet spreads.",
        "rooms": ["Classic", "Premier"]
    },
    {
        "name": "Aura by Xperience Corbett",
        "slug": "aura-by-xperience-corbett",
        "zone": "semalkhaliya",
        "zone_label": "Semalkhaliya, Bailparao",
        "category": "4-star",
        "tier_badge": "4-Star Plunge Pool & Mud Cottages",
        "price": 9200,
        "rating": 4.7,
        "reviews": 105,
        "image": "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&q=80",
        "amenities": "pool,spa,plunge_pool,balcony",
        "description": "A boutique eco-retreat featuring rustic mud architecture, elegant private plunge pool villas, and large family accommodation blocks.",
        "rooms": ["Deluxe Cottage", "Mud Cottage", "Premium", "Elegant Plunge Pool", "Family Villa 4 Pax"]
    },
    {
        "name": "The Cloyster Resort & Spa",
        "slug": "the-cloyster-resort-spa",
        "zone": "mohaan",
        "zone_label": "Mohaan / Dhikuli Border",
        "category": "4-star",
        "tier_badge": "4-Star Hill Facing Luxury Resort",
        "price": 8200,
        "rating": 4.5,
        "reviews": 118,
        "image": "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=80",
        "amenities": "pool,spa,balcony",
        "description": "Framed by dramatic Kumaon mountain cliffs. Offers luxury hill-facing balconies, swimming pool, and easy access to both Sitabani and Bijrani safari zones.",
        "rooms": ["Deluxe Garden View", "Premium Jungle View", "Luxury Hill Facing", "Pool View"]
    },
    {
        "name": "Anantum Gateway Resorts & Spa",
        "slug": "anantum-gateway-resorts-spa",
        "zone": "semalkhaliya",
        "zone_label": "Semalkhaliya, Bailparao",
        "category": "5-star",
        "tier_badge": "5-Star Luxury Destination Resort",
        "price": 12500,
        "rating": 4.8,
        "reviews": 230,
        "image": "https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=800&q=80",
        "amenities": "pool,spa,plunge_pool,balcony",
        "description": "One of Corbett's largest luxury wedding and leisure properties, boasting private plunge pool cottages, grand banquets, adventure parks, and wellness spas.",
        "rooms": ["Deluxe", "Executive", "Plunge Pool Cottage"]
    },
    {
        "name": "Dhikala Forest Rest House",
        "slug": "dhikala-forest-rest-house",
        "zone": "dhikala",
        "zone_label": "Dhikala Core Wildlife Zone",
        "category": "core",
        "tier_badge": "Government Core FRH (Deep Jungle)",
        "price": 5000,
        "rating": 4.9,
        "reviews": 450,
        "image": "https://images.unsplash.com/photo-1470770841072-f978cf4d019e?w=800&q=80",
        "amenities": "riverfront,balcony",
        "description": "The crown jewel of Indian wildlife tourism. An authentic 100-year-old British colonial forest lodge located deep inside the core tiger reserve, overlooking the Ramganga reservoir.",
        "rooms": ["Dhikala Forest Cabin", "Hutment", "New Forest Rest House Room"]
    }
]

# Insert Hotels and Rooms
for h in hotels_data:
    cur.execute("""
        INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)
    """, (
        h["name"], h["slug"], h["zone"], h["zone_label"], h["category"],
        h["tier_badge"], h["price"], h["rating"], h["reviews"], h["image"],
        h["amenities"], h["description"]
    ))
    hotel_id = cur.lastrowid
    
    order = 1
    for r in h["rooms"]:
        cur.execute("""
            INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order)
            VALUES (?, ?, ?, '2 Adults + 1 Child', ?, ?)
        """, (hotel_id, r, f"{r} at {h['name']} with scenic jungle/valley views.", h["price"], order))
        order += 1

# 3. Safari Zones Data
safari_zones_data = [
    ("Dhikala Zone", "Dhangarhi Gate", "Core", "06:00 AM - 09:30 AM", "03:00 PM - 06:30 PM", 6500.00, 2200.00, 32, "15 Nov - 15 June", "The most famous core zone with panoramic Ramganga riverbed views and highest tiger density."),
    ("Bijrani Zone", "Amdanda Gate", "Core", "06:00 AM - 09:30 AM", "02:30 PM - 06:00 PM", 4500.00, 0.00, 30, "15 Oct - 30 June", "Magnificent sal forests and open grasslands known for royal Bengal tiger encounters."),
    ("Jhirna Zone", "Dhela Gate", "Buffer/Core", "06:00 AM - 09:30 AM", "02:30 PM - 06:00 PM", 4500.00, 0.00, 30, "Open Round the Year", "South boundary zone famous for sloth bears, wild elephants, and deer herds."),
    ("Dhela Zone", "Dhela Gate", "Eco-Tourism", "06:00 AM - 09:30 AM", "02:30 PM - 06:00 PM", 4200.00, 0.00, 15, "Open Round the Year", "Rich mixed forest and water bodies ideal for bird watching and tiger sightings."),
    ("Durga Devi Zone", "Durga Devi Gate", "Hilly Core", "06:00 AM - 09:30 AM", "02:30 PM - 06:00 PM", 4800.00, 0.00, 15, "15 Nov - 15 June", "Hilly terrain along Mandal River, paradise for birders and Mahseer fish watchers."),
    ("Sitabani Zone", "Ramnagar Gate", "Landscape", "06:00 AM - 09:30 AM", "02:30 PM - 06:00 PM", 4000.00, 0.00, 50, "Open Round the Year", "Mythological forest buffer zone associated with Ramayana, rich in avian species."),
    ("Garjiya Zone", "Garjiya Gate", "Core", "06:00 AM - 09:30 AM", "02:30 PM - 06:00 PM", 4600.00, 0.00, 30, "15 Oct - 30 June", "Scenic zone adjoining Bijrani, popular for rich grasslands and wildlife sightings."),
    ("Phato Zone", "Maldhan Gate", "Eco-Tourism", "06:00 AM - 09:30 AM", "02:30 PM - 06:00 PM", 4200.00, 0.00, 30, "Open Round the Year", "Newest eco-tourism zone with treehouses and pristine woodlands.")
]

for sz in safari_zones_data:
    cur.execute("""
        INSERT INTO safari_zones (zone_name, gate_name, zone_type, morning_timings, evening_timings, gypsy_price, canter_price, max_vehicles, best_season, description)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """, sz)

# 4. Activities Data
activities_data = [
    ("Jeep Safari Expedition", "Wildlife Safari", "3.5 Hours", 4500.00, "Authorized 4x4 Gypsy open safari across designated Corbett zones with experienced driver & forest guide.", "assets/img/home-1/tour/tour-1.jpg"),
    ("Canter Safari (Dhikala Core)", "Wildlife Safari", "5 Hours", 2200.00, "16-seater open safari bus exploring the deep grasslands of Dhikala Core Tiger Reserve.", "assets/img/home-1/tour/tour-2.jpg"),
    ("Kosi River Rafting & Body Surfing", "Water Adventure", "2.5 Hours", 1800.00, "Exciting Grade II & III whitewater rafting along scenic Kosi river rapids during monsoon/post-monsoon.", "assets/img/home-1/tour/tour-3.jpg"),
    ("Forest Canopy Trek & Birding", "Eco Tourism", "2 Hours", 950.00, "Guided walking safari across Sitabani and Kyari buffer forests identifying exotic Himalayan birds.", "assets/img/home-1/tour/tour-4.jpg"),
    ("Jungle Destination Wedding Coordination", "Luxury Events", "Multi-Day", 150000.00, "Comprehensive wedding management across Corbett riverside lawns, floral decor, banquet & permits.", "assets/img/home-1/tour/tour-5.jpg")
]

for act in activities_data:
    cur.execute("""
        INSERT INTO activities (name, category, duration, price_per_person, description, image_url)
        VALUES (?, ?, ?, ?, ?, ?)
    """, act)

# 5. Inquiries / Tickets Sample Data
inquiries_data = [
    ("HG-CORBETT-94821", "Vikramaditya Roy", "+91 98112 34567", "vikram.roy@example.com", "2026-10-18", "2 Adults", "Hotel Lodge Stay", "Paatlidun Safari Lodge", "Bush Cottage", "Please arrange early check-in and Bijrani afternoon safari permit.", "Confirmed"),
    ("HG-CORBETT-77291", "Priya Kulkarni", "+91 98201 88290", "priya.k@example.com", "2026-11-04", "3 Adults", "Hotel Lodge Stay", "Tarangi Resort & Spa", "Jal Pool Villa", "Anniversary celebration decor in room.", "New"),
    ("HG-CORBETT-63104", "Dr. Amitava Ghosh", "+91 94330 19283", "amitava.ghosh@hospital.org", "2026-11-20", "2 Adults", "Hotel Lodge Stay", "The Golden Tusk", "Pool View Suite", "Dhela zone morning jeep safari required.", "New"),
    ("HG-CORBETT-51928", "Rohit Malhotra", "+91 98710 44556", "rohit.m@delhi.com", "2026-12-10", "4+ Adults", "Hotel Lodge Stay", "Saraca Resort Corbett (Lebua)", "Two Bedroom Forest View", "Need 2 connecting rooms and airport cab transfer from Dehradun.", "Confirmed"),
    ("HG-CORBETT-43019", "Ananya Deshmukh", "+91 97654 32100", "ananya.d@gmail.com", "2026-12-28", "2 Adults", "Hotel Lodge Stay", "The Solluna Resort", "Premier", "New Year package booking with gala dinner.", "New")
]

for inq in inquiries_data:
    cur.execute("""
        INSERT INTO inquiries_tickets (ticket_number, guest_name, phone, email, check_in_date, guests_count, service_type, hotel_name, room_category, special_requests, status)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """, inq)

# 6. Site Content
content_data = [
    ("brand_header", "global", "Honeygold India - Corbett Initiative", "Domestic Tourism Initiative", "Book forest resorts, reserve safaris, and arrange wilderness destination weddings in Jim Corbett National Park.", "https://www.honeygoldindia.com/img/logo2.png"),
    ("hero_banner", "index", "Uncover the Wilderness of Jim Corbett", "India's Oldest & Most Prestigious Wildlife Sanctuary", "Experience nature in its rawest form. Book luxury forest resorts, adventure river safaris, and host unforgettable wilderness weddings in Corbett's magical ecosystem.", "assets/img/hero/hero-bg.jpg"),
    ("about_heritage", "about", "The Historic Journey of Hailey to Corbett", "Founded 1936 | Project Tiger 1973", "Established in 1936 as Hailey National Park, Jim Corbett National Park stands as India's oldest wildlife reserve. Renamed in honor of legendary hunter-turned-conservationist Jim Corbett, it remains the crown jewel of tiger conservation.", "assets/img/honeygold/about.jpg"),
    ("contact_srinagar", "global", "Srinagar Head Office", "Rather Complex, Top Floor, Near New Era School, RajBagh, Srinagar - 190008", "Ph: 0194-2310736, 2310270 | Mobile: +91 9419045656", ""),
    ("contact_delhi", "global", "New Delhi Corporate Office", "B1/36, Ashok Vihar Phase II, New Delhi - 110052", "Ph: 011-47145656 | Toll Free: 1800 891 7626", "")
]

for cd in content_data:
    cur.execute("""
        INSERT INTO site_content (section_key, page_name, title, subtitle, content, image_url)
        VALUES (?, ?, ?, ?, ?, ?)
    """, cd)

conn.commit()

# Now export full ANSI SQL dump
with open(sql_path, "w", encoding="utf-8") as f:
    f.write(schema_ddl)
    f.write("\n-- ==========================================================\n")
    f.write("-- DML DATA SEED STATEMENTS\n")
    f.write("-- ==========================================================\n\n")
    
    # Export Hotels
    f.write("-- HOTELS TABLE SEED (30 Properties)\n")
    for row in cur.execute("SELECT name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured FROM hotels").fetchall():
        name, slug, zone, zone_label, cat, tier, price, rating, reviews, img, amen, desc, feat = row
        name_esc = name.replace("'", "''")
        tier_esc = tier.replace("'", "''")
        desc_esc = desc.replace("'", "''")
        f.write(f"INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('{name_esc}', '{slug}', '{zone}', '{zone_label}', '{cat}', '{tier_esc}', {price}, {rating}, {reviews}, '{img}', '{amen}', '{desc_esc}', {feat});\n")
    
    f.write("\n-- ROOM CATEGORIES TABLE SEED\n")
    for row in cur.execute("SELECT hotel_id, category_name, description, pax_capacity, base_price, sort_order FROM room_categories").fetchall():
        hid, cname, desc, pax, price, order = row
        cname_esc = cname.replace("'", "''")
        desc_esc = desc.replace("'", "''")
        f.write(f"INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES ({hid}, '{cname_esc}', '{desc_esc}', '{pax}', {price}, {order});\n")
        
    f.write("\n-- SAFARI ZONES TABLE SEED\n")
    for row in cur.execute("SELECT zone_name, gate_name, zone_type, morning_timings, evening_timings, gypsy_price, canter_price, max_vehicles, best_season, description FROM safari_zones").fetchall():
        zn, gn, zt, mt, et, gp, cp, mv, bs, desc = row
        desc_esc = desc.replace("'", "''")
        f.write(f"INSERT INTO safari_zones (zone_name, gate_name, zone_type, morning_timings, evening_timings, gypsy_price, canter_price, max_vehicles, best_season, description) VALUES ('{zn}', '{gn}', '{zt}', '{mt}', '{et}', {gp}, {cp}, {mv}, '{bs}', '{desc_esc}');\n")

    f.write("\n-- ACTIVITIES TABLE SEED\n")
    for row in cur.execute("SELECT name, category, duration, price_per_person, description, image_url FROM activities").fetchall():
        aname, acat, adur, aprice, adesc, aimg = row
        adesc_esc = adesc.replace("'", "''")
        f.write(f"INSERT INTO activities (name, category, duration, price_per_person, description, image_url) VALUES ('{aname}', '{acat}', '{adur}', {aprice}, '{adesc_esc}', '{aimg}');\n")

    f.write("\n-- INQUIRIES & TICKETS TABLE SEED\n")
    for row in cur.execute("SELECT ticket_number, guest_name, phone, email, check_in_date, guests_count, service_type, hotel_name, room_category, special_requests, status FROM inquiries_tickets").fetchall():
        tn, gn, ph, em, cid, gc, st, hn, rc, sr, stat = row
        sr_esc = (sr or '').replace("'", "''")
        f.write(f"INSERT INTO inquiries_tickets (ticket_number, guest_name, phone, email, check_in_date, guests_count, service_type, hotel_name, room_category, special_requests, status) VALUES ('{tn}', '{gn}', '{ph}', '{em}', '{cid}', '{gc}', '{st}', '{hn}', '{rc}', '{sr_esc}', '{stat}');\n")

    f.write("\n-- SITE CONTENT TABLE SEED\n")
    for row in cur.execute("SELECT section_key, page_name, title, subtitle, content, image_url FROM site_content").fetchall():
        sk, pn, tit, stit, con, img = row
        tit_esc = tit.replace("'", "''")
        stit_esc = (stit or '').replace("'", "''")
        con_esc = con.replace("'", "''")
        f.write(f"INSERT INTO site_content (section_key, page_name, title, subtitle, content, image_url) VALUES ('{sk}', '{pn}', '{tit_esc}', '{stit_esc}', '{con_esc}', '{img}');\n")

# Verify counts
h_cnt = cur.execute("SELECT COUNT(*) FROM hotels").fetchone()[0]
r_cnt = cur.execute("SELECT COUNT(*) FROM room_categories").fetchone()[0]
z_cnt = cur.execute("SELECT COUNT(*) FROM safari_zones").fetchone()[0]
t_cnt = cur.execute("SELECT COUNT(*) FROM inquiries_tickets").fetchone()[0]
c_cnt = cur.execute("SELECT COUNT(*) FROM site_content").fetchone()[0]

print(f"DATABASE INITIALIZATION SUCCESSFUL!")
print(f"  SQLite DB: {db_path} (size: {os.path.getsize(db_path)} bytes)")
print(f"  SQL Script: {sql_path} (size: {os.path.getsize(sql_path)} bytes)")
print(f"  Hotels Inserted: {h_cnt}")
print(f"  Room Categories: {r_cnt}")
print(f"  Safari Zones: {z_cnt}")
print(f"  Inquiry Tickets: {t_cnt}")
print(f"  Content Blocks: {c_cnt}")

conn.close()
