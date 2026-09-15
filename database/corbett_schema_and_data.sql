
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

-- ==========================================================
-- DML DATA SEED STATEMENTS
-- ==========================================================

-- HOTELS TABLE SEED (30 Properties)
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Paatlidun Safari Lodge', 'paatlidun-safari-lodge', 'mohaan', 'Mohaan / Bakrakot, Corbett', '5-star', '5-Star Luxury Wildlife Lodge', 24000, 4.9, 128, 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80', 'pool,riverfront,spa,plunge_pool', 'Nestled on the edge of Corbett park along the Kumaon foothills, Paatlidun features private plunge pools, open-air star-beds on terraces, and handcrafted stone cottages steeped in rustic wildlife heritage.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Saraca Resort Corbett (Lebua)', 'saraca-resort-corbett-lebua', 'mohaan', 'Mohaan / Bakrakot, Corbett', '5-star', '5-Star Luxury Eco-Resort', 18500, 4.8, 142, 'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&q=80', 'pool,spa,balcony', 'Spread across 9 acres of dense green foliage adjacent to the reserve forest, Saraca offers luxurious suites with panoramic views of landscaped ponds and thick woodland.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Namah Resort Corbett', 'namah-resort-corbett', 'dhikuli', 'Dhikuli, Jim Corbett', '5-star', '5-Star Riverside Sanctuary', 14500, 4.8, 210, 'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=800&q=80', 'pool,riverfront,spa,balcony', 'Surrounded by natural beauty and lush greenery, Namah sits directly along the tranquil Kosi riverbanks with grand riverview balconies and expansive ballroom facilities.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('The Corbett Hideaway by Leisure', 'the-corbett-hideaway-by-leisure', 'dhikuli', 'Dhikuli, Jim Corbett', '4-star', '4-Star Heritage Forest Hideaway', 11000, 4.7, 95, 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800&q=80', 'pool,riverfront,spa', 'A charming hideaway nestled inside mango orchards along the Kosi river. Provides authentic thatched roofs, warm timber cottages, and intimate jungle hospitality.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('The Riverview Retreat', 'the-riverview-retreat', 'dhikuli', 'Dhikuli, Jim Corbett', '4-star', '4-Star Riverfront Retreat', 9500, 4.8, 320, 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=80', 'pool,riverfront,spa,balcony', 'Sprawled over 8 acres along the banks of River Kosi, this retreat features sloping tiled roofs, cool stone floors, and private garden sit-outs ideal for large families.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Bellmont Caves Resort', 'bellmont-caves-resort', 'mohaan', 'Mohaan, Corbett', 'mid-range', 'Boutique Cave-Themed Resort', 6000, 4.4, 68, 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&q=80', 'pool,balcony', 'A unique architectural stay carved with rustic cave motifs and stone textures, offering scenic valley views and thrilling campfire evenings.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('ZANA Resort Jim Corbett', 'zana-resort-jim-corbett', 'mohaan', 'Mohaan / Kosi Valley', '5-star', '5-Star Luxury Boutique Retreat', 17000, 4.9, 84, 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800&q=80', 'pool,riverfront,spa,balcony', 'Curated luxury offering vintage architecture, private garden fireplaces, bespoke riverside picnic experiences, and spacious suites tailored for discerning wildlife travelers.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Lemon Tree Premier Corbett', 'lemon-tree-premier-corbett', 'mohaan', 'Mohaan, Corbett', '4-star', '4-Star Upscale Riverside Resort', 10500, 4.6, 240, 'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800&q=80', 'pool,riverfront,spa', 'Overlooking the meandering Kosi River, Lemon Tree Premier blends contemporary flair with scenic natural vistas, featuring outdoor lawns and wellness spas.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('The Solluna Resort', 'the-solluna-resort', 'marchula', 'Marchula Valley, Ramganga', '5-star', '5-Star Eco-Luxury Resort', 10500, 4.7, 190, 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800&q=80', 'pool,riverfront,spa,balcony', 'Situated in the scenic Marchula valley along the Ramganga riverbed, Solluna offers presidential and fragrance cottages, open-air amphitheatre, rain dance, and starry night dining.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Club Mahindra Corbett', 'club-mahindra-corbett', 'mohaan', 'Mohaan, Corbett', '4-star', '4-Star Family Jungle Resort', 8500, 4.6, 310, 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=800&q=80', 'pool,spa,balcony', 'Designed for wholesome family getaways with manicured gardens, indoor recreational zones, guided jungle safaris, and comfortable cottage suites.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('La Pearle River Resort', 'la-pearle-river-resort', 'dhikuli', 'Dhikuli, Jim Corbett', 'mid-range', '3-Star Riverfront Stay', 4500, 4.3, 115, 'https://images.unsplash.com/photo-1445019980597-93fa8acb246c?w=800&q=80', 'pool,riverfront', 'Perched on the rim of River Kosi in Dhikuli village, La Pearle offers budget-conscious travelers picturesque waterside views and tranquil green courtyards.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Mango Bloom River Resort', 'mango-bloom-river-resort', 'mohaan', 'Mohaan, Corbett', 'mid-range', '3-Star River Retreat', 4800, 4.2, 90, 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=800&q=80', 'pool,riverfront', 'Set amidst shady mango groves alongside shimmering mountain waters, Mango Bloom is ideal for nature walks, birdwatching, and riverside tea sessions.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Excel Resort Corbett', 'excel-resort-corbett', 'mohaan', 'Mohaan / Ramnagar', 'budget', 'Economy Forest Stay', 3500, 4, 55, 'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=800&q=80', 'pool', 'Comfortable, economical rooms with prompt safari assistance, outdoor parking, and friendly service for backpackers and wildlife tour groups.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Corbett River Creek Resort & Spa', 'corbett-river-creek-resort-spa', 'marchula', 'Marchula, Ramganga', '4-star', '4-Star Riverview Lodge & Spa', 9000, 4.7, 165, 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800&q=80', 'pool,riverfront,spa,balcony', 'Surrounded on three sides by dense Sal forest and the Ramganga creek, this scenic lodge features glass-front river cottages and rejuvenating spa therapies.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Corbett The Baagh Spa & Resort', 'corbett-the-baagh-spa-resort', 'kyari', 'Patkot Valley, Corbett', '5-star', '5-Star Mountain & Valley Resort', 13500, 4.8, 178, 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800&q=80', 'pool,spa,balcony', 'Hidden away in the serene Patkot valley, The Baagh provides magnificent 360-degree Himalayan and jungle foothill views, cat-themed luxury suites, and an infinity pool.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Bela Monde Riverside Resort', 'bela-monde-riverside-resort', 'dhikuli', 'Dhikuli, Jim Corbett', '4-star', '4-Star Boutique Riverside Resort', 8000, 4.5, 88, 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&q=80', 'pool,riverfront,balcony', 'Located directly on the Kosi riverbed in Dhikuli, Bela Monde offers spacious rooms with private riverside balconies, evening music, and campfire lawns.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Tarangi Resort & Spa', 'tarangi-resort-spa', 'dhikuli', 'Dhikuli, Jim Corbett', '5-star', '5-Star Riverview Spa & Villa Resort', 16000, 4.9, 380, 'https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&q=80', 'pool,riverfront,spa,plunge_pool,balcony', 'One of Corbett''s premier luxury addresses. Features riverside Sarang rooms, private Jal pool villas, an opulent Sanskriti spa, and grand lawns for destination weddings.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Tarangi Ramganga Resort', 'tarangi-ramganga-resort', 'marchula', 'Marchula Valley, Ramganga', '4-star', '4-Star Riverside Wilderness Resort', 9500, 4.7, 130, 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800&q=80', 'pool,riverfront,balcony', 'A historic property on the banks of River Ramganga, famed for Mahseer angling, riverside cottage duplexes, and quiet forest valley escapes.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Alaya Resort', 'alaya-resort', 'kyari', 'Kyari Village, Corbett', 'mid-range', 'Eco-Heritage Village Resort', 5500, 4.4, 75, 'https://images.unsplash.com/photo-1470770841072-f978cf4d019e?w=800&q=80', 'pool,balcony', 'Situated in scenic Kyari village amidst agricultural fields and dense Sal forest, Alaya delivers village-style serenity, organic cuisine, and cycling tours.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Country Inn Riverside Resort', 'country-inn-riverside-resort', 'dhikuli', 'Dhikuli, Jim Corbett', '4-star', '4-Star Luxury Cottage Resort', 10000, 4.6, 215, 'https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?w=800&q=80', 'pool,riverfront,spa,plunge_pool,balcony', 'Known for its sprawling botanical grounds, standalone Jim''s cottages with terraces, and exclusive suites featuring private plunge pools overlooking river rocks.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('The Golden Tusk', 'the-golden-tusk', 'dhela', 'Dhela (Near Jhirna Gate)', '5-star', '5-Star Forest & Safari Resort', 14000, 4.8, 290, 'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=800&q=80', 'pool,spa,balcony', 'Set along the Dhela River countryside just 5 minutes from Dhela and Jhirna safari gates. Boasts lavish suites, luxury safari tents, multi-cuisine dining, and swimming pools.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('jüSTa Lazy Haven Corbett', 'justa-lazy-haven-corbett', 'ramnagar', 'Chhoi / Ramnagar', '4-star', '4-Star Boutique Art Resort', 7500, 4.5, 110, 'https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=800&q=80', 'pool,balcony', 'Art-inspired boutique stay nestled amongst lush flora. Each room opens into a spacious balcony overlooking forested hills and landscaped gardens.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Shervani Pebbles & Pines', 'shervani-pebbles-pines', 'dhikuli', 'Dhikuli, Jim Corbett', '4-star', '4-Star Premium Jacuzzi Resort', 8500, 4.6, 145, 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80', 'pool,spa,jacuzzi,balcony', 'Boasts designer rooms equipped with private outdoor Jacuzzis, manicured lawns, and close proximity to the famous Bijrani safari gate.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Sterling Corbett', 'sterling-corbett', 'marchula', 'Marchula Valley, Ramganga', '4-star', '4-Star Hillside Riverside Resort', 8000, 4.5, 185, 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=800&q=80', 'pool,riverfront,balcony', 'Perched on a hillside overlooking the sparkling Ramganga River. Features river-facing stargazing platforms, evening barbecue, and adventure trails.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Silvanza Resort', 'silvanza-resort', 'mohaan', 'Mohaan, Corbett', 'mid-range', '3-Star Eco-Forest Stay', 4200, 4.1, 60, 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&q=80', 'pool,balcony', 'A tranquil haven tucked into the woods of Mohaan. Offers clean, modern Origin & Breeze cottages with personal verandas and garden swings.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Sterling Corbett Quinta', 'sterling-corbett-quinta', 'dhikuli', 'Dhikuli, Jim Corbett', '4-star', '4-Star Contemporary Safari Stay', 7800, 4.4, 92, 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800&q=80', 'pool,balcony', 'Conveniently located along the main Dhikuli safari corridor. Features quick safari dispatch, cozy bedding, and multi-cuisine buffet spreads.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Aura by Xperience Corbett', 'aura-by-xperience-corbett', 'semalkhaliya', 'Semalkhaliya, Bailparao', '4-star', '4-Star Plunge Pool & Mud Cottages', 9200, 4.7, 105, 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&q=80', 'pool,spa,plunge_pool,balcony', 'A boutique eco-retreat featuring rustic mud architecture, elegant private plunge pool villas, and large family accommodation blocks.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('The Cloyster Resort & Spa', 'the-cloyster-resort-spa', 'mohaan', 'Mohaan / Dhikuli Border', '4-star', '4-Star Hill Facing Luxury Resort', 8200, 4.5, 118, 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=80', 'pool,spa,balcony', 'Framed by dramatic Kumaon mountain cliffs. Offers luxury hill-facing balconies, swimming pool, and easy access to both Sitabani and Bijrani safari zones.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Anantum Gateway Resorts & Spa', 'anantum-gateway-resorts-spa', 'semalkhaliya', 'Semalkhaliya, Bailparao', '5-star', '5-Star Luxury Destination Resort', 12500, 4.8, 230, 'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=800&q=80', 'pool,spa,plunge_pool,balcony', 'One of Corbett''s largest luxury wedding and leisure properties, boasting private plunge pool cottages, grand banquets, adventure parks, and wellness spas.', 1);
INSERT INTO hotels (name, slug, zone, zone_label, category, tier_badge, starting_price, rating, reviews_count, main_image, amenities, description, is_featured) VALUES ('Dhikala Forest Rest House', 'dhikala-forest-rest-house', 'dhikala', 'Dhikala Core Wildlife Zone', 'core', 'Government Core FRH (Deep Jungle)', 5000, 4.9, 450, 'https://images.unsplash.com/photo-1470770841072-f978cf4d019e?w=800&q=80', 'riverfront,balcony', 'The crown jewel of Indian wildlife tourism. An authentic 100-year-old British colonial forest lodge located deep inside the core tiger reserve, overlooking the Ramganga reservoir.', 1);

-- ROOM CATEGORIES TABLE SEED
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (1, 'Bush Cottage', 'Bush Cottage at Paatlidun Safari Lodge with scenic jungle/valley views.', '2 Adults + 1 Child', 24000, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (1, 'Luxury Cottage', 'Luxury Cottage at Paatlidun Safari Lodge with scenic jungle/valley views.', '2 Adults + 1 Child', 24000, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (1, 'Premium Cottage', 'Premium Cottage at Paatlidun Safari Lodge with scenic jungle/valley views.', '2 Adults + 1 Child', 24000, 3);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (2, 'Premium Room', 'Premium Room at Saraca Resort Corbett (Lebua) with scenic jungle/valley views.', '2 Adults + 1 Child', 18500, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (2, 'Family Cottage', 'Family Cottage at Saraca Resort Corbett (Lebua) with scenic jungle/valley views.', '2 Adults + 1 Child', 18500, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (2, 'Premium Suite One Bedroom', 'Premium Suite One Bedroom at Saraca Resort Corbett (Lebua) with scenic jungle/valley views.', '2 Adults + 1 Child', 18500, 3);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (2, 'Two Bedroom Forest View', 'Two Bedroom Forest View at Saraca Resort Corbett (Lebua) with scenic jungle/valley views.', '2 Adults + 1 Child', 18500, 4);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (2, 'Two Bedroom Pond View', 'Two Bedroom Pond View at Saraca Resort Corbett (Lebua) with scenic jungle/valley views.', '2 Adults + 1 Child', 18500, 5);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (3, 'Superior', 'Superior at Namah Resort Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 14500, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (3, 'Premium', 'Premium at Namah Resort Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 14500, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (4, 'Deluxe', 'Deluxe at The Corbett Hideaway by Leisure with scenic jungle/valley views.', '2 Adults + 1 Child', 11000, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (4, 'Superior', 'Superior at The Corbett Hideaway by Leisure with scenic jungle/valley views.', '2 Adults + 1 Child', 11000, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (5, 'Deluxe', 'Deluxe at The Riverview Retreat with scenic jungle/valley views.', '2 Adults + 1 Child', 9500, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (5, 'Deluxe Cottage', 'Deluxe Cottage at The Riverview Retreat with scenic jungle/valley views.', '2 Adults + 1 Child', 9500, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (5, 'Superior', 'Superior at The Riverview Retreat with scenic jungle/valley views.', '2 Adults + 1 Child', 9500, 3);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (5, 'Duplex', 'Duplex at The Riverview Retreat with scenic jungle/valley views.', '2 Adults + 1 Child', 9500, 4);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (5, 'Suite', 'Suite at The Riverview Retreat with scenic jungle/valley views.', '2 Adults + 1 Child', 9500, 5);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (5, 'Premium', 'Premium at The Riverview Retreat with scenic jungle/valley views.', '2 Adults + 1 Child', 9500, 6);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (6, 'Deluxe', 'Deluxe at Bellmont Caves Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 6000, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (6, 'Executive', 'Executive at Bellmont Caves Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 6000, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (7, 'Classic', 'Classic at ZANA Resort Jim Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 17000, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (7, 'Riverview', 'Riverview at ZANA Resort Jim Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 17000, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (7, 'Tiger Tales Suite', 'Tiger Tales Suite at ZANA Resort Jim Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 17000, 3);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (7, 'Luxury Cottage with Fireplace', 'Luxury Cottage with Fireplace at ZANA Resort Jim Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 17000, 4);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (8, 'Double', 'Double at Lemon Tree Premier Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 10500, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (9, 'Superior', 'Superior at The Solluna Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 10500, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (9, 'Deluxe', 'Deluxe at The Solluna Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 10500, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (9, 'Premier', 'Premier at The Solluna Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 10500, 3);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (10, 'Superior', 'Superior at Club Mahindra Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 8500, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (11, 'Std', 'Std at La Pearle River Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 4500, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (12, 'Std', 'Std at Mango Bloom River Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 4800, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (13, 'Std', 'Std at Excel Resort Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 3500, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (14, 'Creek', 'Creek at Corbett River Creek Resort & Spa with scenic jungle/valley views.', '2 Adults + 1 Child', 9000, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (14, 'Premium', 'Premium at Corbett River Creek Resort & Spa with scenic jungle/valley views.', '2 Adults + 1 Child', 9000, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (14, 'Creek Luxury', 'Creek Luxury at Corbett River Creek Resort & Spa with scenic jungle/valley views.', '2 Adults + 1 Child', 9000, 3);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (15, 'Jungle Cat', 'Jungle Cat at Corbett The Baagh Spa & Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 13500, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (15, 'Spotted Cat', 'Spotted Cat at Corbett The Baagh Spa & Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 13500, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (15, 'Leopard Cat', 'Leopard Cat at Corbett The Baagh Spa & Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 13500, 3);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (15, 'Leopard Suite', 'Leopard Suite at Corbett The Baagh Spa & Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 13500, 4);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (16, 'Std', 'Std at Bela Monde Riverside Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 8000, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (16, 'Deluxe', 'Deluxe at Bela Monde Riverside Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 8000, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (17, 'Sarang', 'Sarang at Tarangi Resort & Spa with scenic jungle/valley views.', '2 Adults + 1 Child', 16000, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (17, 'Luxury Cottage', 'Luxury Cottage at Tarangi Resort & Spa with scenic jungle/valley views.', '2 Adults + 1 Child', 16000, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (17, 'River View Cottage', 'River View Cottage at Tarangi Resort & Spa with scenic jungle/valley views.', '2 Adults + 1 Child', 16000, 3);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (17, 'Jal Pool Villa', 'Jal Pool Villa at Tarangi Resort & Spa with scenic jungle/valley views.', '2 Adults + 1 Child', 16000, 4);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (17, 'Whispering 4 Bedroom', 'Whispering 4 Bedroom at Tarangi Resort & Spa with scenic jungle/valley views.', '2 Adults + 1 Child', 16000, 5);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (18, 'Deluxe Cottage', 'Deluxe Cottage at Tarangi Ramganga Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 9500, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (18, 'Super Dlx Cottage', 'Super Dlx Cottage at Tarangi Ramganga Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 9500, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (18, 'Ramganga Suite', 'Ramganga Suite at Tarangi Ramganga Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 9500, 3);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (18, 'Pine Cottage', 'Pine Cottage at Tarangi Ramganga Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 9500, 4);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (18, 'Duplex Cottage', 'Duplex Cottage at Tarangi Ramganga Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 9500, 5);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (18, 'River Facing Family Cottage', 'River Facing Family Cottage at Tarangi Ramganga Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 9500, 6);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (19, 'Double', 'Double at Alaya Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 5500, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (20, 'Jungle View', 'Jungle View at Country Inn Riverside Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 10000, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (20, 'Jims Cottage', 'Jims Cottage at Country Inn Riverside Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 10000, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (20, 'Cottage with Terrace', 'Cottage with Terrace at Country Inn Riverside Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 10000, 3);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (20, 'Cottage with Garden', 'Cottage with Garden at Country Inn Riverside Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 10000, 4);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (20, 'Cottage with Plunge Pool', 'Cottage with Plunge Pool at Country Inn Riverside Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 10000, 5);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (21, 'Garden Suite', 'Garden Suite at The Golden Tusk with scenic jungle/valley views.', '2 Adults + 1 Child', 14000, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (21, 'Nature View / Luxury Tents', 'Nature View / Luxury Tents at The Golden Tusk with scenic jungle/valley views.', '2 Adults + 1 Child', 14000, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (21, 'Pool View Suite', 'Pool View Suite at The Golden Tusk with scenic jungle/valley views.', '2 Adults + 1 Child', 14000, 3);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (21, 'Corbett Suite', 'Corbett Suite at The Golden Tusk with scenic jungle/valley views.', '2 Adults + 1 Child', 14000, 4);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (21, 'Villa', 'Villa at The Golden Tusk with scenic jungle/valley views.', '2 Adults + 1 Child', 14000, 5);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (21, 'Villa Grande', 'Villa Grande at The Golden Tusk with scenic jungle/valley views.', '2 Adults + 1 Child', 14000, 6);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (21, 'Tusk Suite', 'Tusk Suite at The Golden Tusk with scenic jungle/valley views.', '2 Adults + 1 Child', 14000, 7);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (21, 'Tiger Suite (4 Pax)', 'Tiger Suite (4 Pax) at The Golden Tusk with scenic jungle/valley views.', '2 Adults + 1 Child', 14000, 8);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (22, 'Superior with Balcony', 'Superior with Balcony at jüSTa Lazy Haven Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 7500, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (22, 'Deluxe with Balcony', 'Deluxe with Balcony at jüSTa Lazy Haven Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 7500, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (23, 'Deluxe Garden View', 'Deluxe Garden View at Shervani Pebbles & Pines with scenic jungle/valley views.', '2 Adults + 1 Child', 8500, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (23, 'Premium Garden', 'Premium Garden at Shervani Pebbles & Pines with scenic jungle/valley views.', '2 Adults + 1 Child', 8500, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (23, 'Superior with Jacuzzi', 'Superior with Jacuzzi at Shervani Pebbles & Pines with scenic jungle/valley views.', '2 Adults + 1 Child', 8500, 3);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (24, 'Classic', 'Classic at Sterling Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 8000, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (24, 'Premier', 'Premier at Sterling Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 8000, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (25, 'Origin', 'Origin at Silvanza Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 4200, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (25, 'Breeze', 'Breeze at Silvanza Resort with scenic jungle/valley views.', '2 Adults + 1 Child', 4200, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (26, 'Classic', 'Classic at Sterling Corbett Quinta with scenic jungle/valley views.', '2 Adults + 1 Child', 7800, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (26, 'Premier', 'Premier at Sterling Corbett Quinta with scenic jungle/valley views.', '2 Adults + 1 Child', 7800, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (27, 'Deluxe Cottage', 'Deluxe Cottage at Aura by Xperience Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 9200, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (27, 'Mud Cottage', 'Mud Cottage at Aura by Xperience Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 9200, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (27, 'Premium', 'Premium at Aura by Xperience Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 9200, 3);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (27, 'Elegant Plunge Pool', 'Elegant Plunge Pool at Aura by Xperience Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 9200, 4);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (27, 'Family Villa 4 Pax', 'Family Villa 4 Pax at Aura by Xperience Corbett with scenic jungle/valley views.', '2 Adults + 1 Child', 9200, 5);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (28, 'Deluxe Garden View', 'Deluxe Garden View at The Cloyster Resort & Spa with scenic jungle/valley views.', '2 Adults + 1 Child', 8200, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (28, 'Premium Jungle View', 'Premium Jungle View at The Cloyster Resort & Spa with scenic jungle/valley views.', '2 Adults + 1 Child', 8200, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (28, 'Luxury Hill Facing', 'Luxury Hill Facing at The Cloyster Resort & Spa with scenic jungle/valley views.', '2 Adults + 1 Child', 8200, 3);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (28, 'Pool View', 'Pool View at The Cloyster Resort & Spa with scenic jungle/valley views.', '2 Adults + 1 Child', 8200, 4);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (29, 'Deluxe', 'Deluxe at Anantum Gateway Resorts & Spa with scenic jungle/valley views.', '2 Adults + 1 Child', 12500, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (29, 'Executive', 'Executive at Anantum Gateway Resorts & Spa with scenic jungle/valley views.', '2 Adults + 1 Child', 12500, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (29, 'Plunge Pool Cottage', 'Plunge Pool Cottage at Anantum Gateway Resorts & Spa with scenic jungle/valley views.', '2 Adults + 1 Child', 12500, 3);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (30, 'Dhikala Forest Cabin', 'Dhikala Forest Cabin at Dhikala Forest Rest House with scenic jungle/valley views.', '2 Adults + 1 Child', 5000, 1);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (30, 'Hutment', 'Hutment at Dhikala Forest Rest House with scenic jungle/valley views.', '2 Adults + 1 Child', 5000, 2);
INSERT INTO room_categories (hotel_id, category_name, description, pax_capacity, base_price, sort_order) VALUES (30, 'New Forest Rest House Room', 'New Forest Rest House Room at Dhikala Forest Rest House with scenic jungle/valley views.', '2 Adults + 1 Child', 5000, 3);

-- SAFARI ZONES TABLE SEED
INSERT INTO safari_zones (zone_name, gate_name, zone_type, morning_timings, evening_timings, gypsy_price, canter_price, max_vehicles, best_season, description) VALUES ('Dhikala Zone', 'Dhangarhi Gate', 'Core', '06:00 AM - 09:30 AM', '03:00 PM - 06:30 PM', 6500, 2200, 32, '15 Nov - 15 June', 'The most famous core zone with panoramic Ramganga riverbed views and highest tiger density.');
INSERT INTO safari_zones (zone_name, gate_name, zone_type, morning_timings, evening_timings, gypsy_price, canter_price, max_vehicles, best_season, description) VALUES ('Bijrani Zone', 'Amdanda Gate', 'Core', '06:00 AM - 09:30 AM', '02:30 PM - 06:00 PM', 4500, 0, 30, '15 Oct - 30 June', 'Magnificent sal forests and open grasslands known for royal Bengal tiger encounters.');
INSERT INTO safari_zones (zone_name, gate_name, zone_type, morning_timings, evening_timings, gypsy_price, canter_price, max_vehicles, best_season, description) VALUES ('Jhirna Zone', 'Dhela Gate', 'Buffer/Core', '06:00 AM - 09:30 AM', '02:30 PM - 06:00 PM', 4500, 0, 30, 'Open Round the Year', 'South boundary zone famous for sloth bears, wild elephants, and deer herds.');
INSERT INTO safari_zones (zone_name, gate_name, zone_type, morning_timings, evening_timings, gypsy_price, canter_price, max_vehicles, best_season, description) VALUES ('Dhela Zone', 'Dhela Gate', 'Eco-Tourism', '06:00 AM - 09:30 AM', '02:30 PM - 06:00 PM', 4200, 0, 15, 'Open Round the Year', 'Rich mixed forest and water bodies ideal for bird watching and tiger sightings.');
INSERT INTO safari_zones (zone_name, gate_name, zone_type, morning_timings, evening_timings, gypsy_price, canter_price, max_vehicles, best_season, description) VALUES ('Durga Devi Zone', 'Durga Devi Gate', 'Hilly Core', '06:00 AM - 09:30 AM', '02:30 PM - 06:00 PM', 4800, 0, 15, '15 Nov - 15 June', 'Hilly terrain along Mandal River, paradise for birders and Mahseer fish watchers.');
INSERT INTO safari_zones (zone_name, gate_name, zone_type, morning_timings, evening_timings, gypsy_price, canter_price, max_vehicles, best_season, description) VALUES ('Sitabani Zone', 'Ramnagar Gate', 'Landscape', '06:00 AM - 09:30 AM', '02:30 PM - 06:00 PM', 4000, 0, 50, 'Open Round the Year', 'Mythological forest buffer zone associated with Ramayana, rich in avian species.');
INSERT INTO safari_zones (zone_name, gate_name, zone_type, morning_timings, evening_timings, gypsy_price, canter_price, max_vehicles, best_season, description) VALUES ('Garjiya Zone', 'Garjiya Gate', 'Core', '06:00 AM - 09:30 AM', '02:30 PM - 06:00 PM', 4600, 0, 30, '15 Oct - 30 June', 'Scenic zone adjoining Bijrani, popular for rich grasslands and wildlife sightings.');
INSERT INTO safari_zones (zone_name, gate_name, zone_type, morning_timings, evening_timings, gypsy_price, canter_price, max_vehicles, best_season, description) VALUES ('Phato Zone', 'Maldhan Gate', 'Eco-Tourism', '06:00 AM - 09:30 AM', '02:30 PM - 06:00 PM', 4200, 0, 30, 'Open Round the Year', 'Newest eco-tourism zone with treehouses and pristine woodlands.');

-- ACTIVITIES TABLE SEED
INSERT INTO activities (name, category, duration, price_per_person, description, image_url) VALUES ('Jeep Safari Expedition', 'Wildlife Safari', '3.5 Hours', 4500, 'Authorized 4x4 Gypsy open safari across designated Corbett zones with experienced driver & forest guide.', 'assets/img/home-1/tour/tour-1.jpg');
INSERT INTO activities (name, category, duration, price_per_person, description, image_url) VALUES ('Canter Safari (Dhikala Core)', 'Wildlife Safari', '5 Hours', 2200, '16-seater open safari bus exploring the deep grasslands of Dhikala Core Tiger Reserve.', 'assets/img/home-1/tour/tour-2.jpg');
INSERT INTO activities (name, category, duration, price_per_person, description, image_url) VALUES ('Kosi River Rafting & Body Surfing', 'Water Adventure', '2.5 Hours', 1800, 'Exciting Grade II & III whitewater rafting along scenic Kosi river rapids during monsoon/post-monsoon.', 'assets/img/home-1/tour/tour-3.jpg');
INSERT INTO activities (name, category, duration, price_per_person, description, image_url) VALUES ('Forest Canopy Trek & Birding', 'Eco Tourism', '2 Hours', 950, 'Guided walking safari across Sitabani and Kyari buffer forests identifying exotic Himalayan birds.', 'assets/img/home-1/tour/tour-4.jpg');
INSERT INTO activities (name, category, duration, price_per_person, description, image_url) VALUES ('Jungle Destination Wedding Coordination', 'Luxury Events', 'Multi-Day', 150000, 'Comprehensive wedding management across Corbett riverside lawns, floral decor, banquet & permits.', 'assets/img/home-1/tour/tour-5.jpg');

-- INQUIRIES & TICKETS TABLE SEED
INSERT INTO inquiries_tickets (ticket_number, guest_name, phone, email, check_in_date, guests_count, service_type, hotel_name, room_category, special_requests, status) VALUES ('HG-CORBETT-94821', 'Vikramaditya Roy', '+91 98112 34567', 'vikram.roy@example.com', '2026-10-18', '2 Adults', 'Hotel Lodge Stay', 'Paatlidun Safari Lodge', 'Bush Cottage', 'Please arrange early check-in and Bijrani afternoon safari permit.', 'Confirmed');
INSERT INTO inquiries_tickets (ticket_number, guest_name, phone, email, check_in_date, guests_count, service_type, hotel_name, room_category, special_requests, status) VALUES ('HG-CORBETT-77291', 'Priya Kulkarni', '+91 98201 88290', 'priya.k@example.com', '2026-11-04', '3 Adults', 'Hotel Lodge Stay', 'Tarangi Resort & Spa', 'Jal Pool Villa', 'Anniversary celebration decor in room.', 'New');
INSERT INTO inquiries_tickets (ticket_number, guest_name, phone, email, check_in_date, guests_count, service_type, hotel_name, room_category, special_requests, status) VALUES ('HG-CORBETT-63104', 'Dr. Amitava Ghosh', '+91 94330 19283', 'amitava.ghosh@hospital.org', '2026-11-20', '2 Adults', 'Hotel Lodge Stay', 'The Golden Tusk', 'Pool View Suite', 'Dhela zone morning jeep safari required.', 'New');
INSERT INTO inquiries_tickets (ticket_number, guest_name, phone, email, check_in_date, guests_count, service_type, hotel_name, room_category, special_requests, status) VALUES ('HG-CORBETT-51928', 'Rohit Malhotra', '+91 98710 44556', 'rohit.m@delhi.com', '2026-12-10', '4+ Adults', 'Hotel Lodge Stay', 'Saraca Resort Corbett (Lebua)', 'Two Bedroom Forest View', 'Need 2 connecting rooms and airport cab transfer from Dehradun.', 'Confirmed');
INSERT INTO inquiries_tickets (ticket_number, guest_name, phone, email, check_in_date, guests_count, service_type, hotel_name, room_category, special_requests, status) VALUES ('HG-CORBETT-43019', 'Ananya Deshmukh', '+91 97654 32100', 'ananya.d@gmail.com', '2026-12-28', '2 Adults', 'Hotel Lodge Stay', 'The Solluna Resort', 'Premier', 'New Year package booking with gala dinner.', 'New');

-- SITE CONTENT TABLE SEED
INSERT INTO site_content (section_key, page_name, title, subtitle, content, image_url) VALUES ('brand_header', 'global', 'Honeygold India - Corbett Initiative', 'Domestic Tourism Initiative', 'Book forest resorts, reserve safaris, and arrange wilderness destination weddings in Jim Corbett National Park.', 'https://www.honeygoldindia.com/img/logo2.png');
INSERT INTO site_content (section_key, page_name, title, subtitle, content, image_url) VALUES ('hero_banner', 'index', 'Uncover the Wilderness of Jim Corbett', 'India''s Oldest & Most Prestigious Wildlife Sanctuary', 'Experience nature in its rawest form. Book luxury forest resorts, adventure river safaris, and host unforgettable wilderness weddings in Corbett''s magical ecosystem.', 'assets/img/hero/hero-bg.jpg');
INSERT INTO site_content (section_key, page_name, title, subtitle, content, image_url) VALUES ('about_heritage', 'about', 'The Historic Journey of Hailey to Corbett', 'Founded 1936 | Project Tiger 1973', 'Established in 1936 as Hailey National Park, Jim Corbett National Park stands as India''s oldest wildlife reserve. Renamed in honor of legendary hunter-turned-conservationist Jim Corbett, it remains the crown jewel of tiger conservation.', 'assets/img/honeygold/about.jpg');
INSERT INTO site_content (section_key, page_name, title, subtitle, content, image_url) VALUES ('contact_srinagar', 'global', 'Srinagar Head Office', 'Rather Complex, Top Floor, Near New Era School, RajBagh, Srinagar - 190008', 'Ph: 0194-2310736, 2310270 | Mobile: +91 9419045656', '');
INSERT INTO site_content (section_key, page_name, title, subtitle, content, image_url) VALUES ('contact_delhi', 'global', 'New Delhi Corporate Office', 'B1/36, Ashok Vihar Phase II, New Delhi - 110052', 'Ph: 011-47145656 | Toll Free: 1800 891 7626', '');
