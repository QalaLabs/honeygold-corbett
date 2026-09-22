-- ==========================================================
-- Honeygold Corbett Domestic Tourism Database
-- Comprehensive Schema for Resorts, Room Categories, Safaris & Inquiries
-- Compatible with SQLite, MySQL, and PostgreSQL
-- ==========================================================

BEGIN TRANSACTION;
CREATE TABLE activities (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(150) NOT NULL,
    category VARCHAR(100) NOT NULL,
    duration VARCHAR(50) DEFAULT '3 Hours',
    price_per_person DECIMAL(10, 2) DEFAULT 0.00,
    description TEXT,
    image_url VARCHAR(500)
);
INSERT INTO "activities" VALUES(1,'Jeep Safari Expedition','Wildlife Safari','3.5 Hours',4500,'Authorized 4x4 Gypsy open safari across designated Corbett zones with experienced driver & forest guide.','assets/img/home-1/tour/tour-1.jpg');
INSERT INTO "activities" VALUES(2,'Canter Safari (Dhikala Core)','Wildlife Safari','5 Hours',2200,'16-seater open safari bus exploring the deep grasslands of Dhikala Core Tiger Reserve.','assets/img/home-1/tour/tour-2.jpg');
INSERT INTO "activities" VALUES(3,'Kosi River Rafting & Body Surfing','Water Adventure','2.5 Hours',1800,'Exciting Grade II & III whitewater rafting along scenic Kosi river rapids during monsoon/post-monsoon.','assets/img/home-1/tour/tour-3.jpg');
INSERT INTO "activities" VALUES(4,'Forest Canopy Trek & Birding','Eco Tourism','2 Hours',950,'Guided walking safari across Sitabani and Kyari buffer forests identifying exotic Himalayan birds.','assets/img/home-1/tour/tour-4.jpg');
INSERT INTO "activities" VALUES(5,'Jungle Destination Wedding Coordination','Luxury Events','Multi-Day',150000,'Comprehensive wedding management across Corbett riverside lawns, floral decor, banquet & permits.','assets/img/home-1/tour/tour-5.jpg');
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
, official_website VARCHAR(500));
INSERT INTO "hotels" VALUES(1,'Paatlidun Safari Lodge','paatlidun-safari-lodge','mohaan','Mohaan / Bakrakot, Corbett','luxury','5-Star Ultra Luxury Wildlife Lodge',24000,4.9,184,'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80','Private Plunge Pool,Open-Air Star Bed,Arijana Wellness Spa,Kumaoni Fine Dining,Chahi Wildlife Library','Nestled on the edge of Corbett along the Kumaon foothills, Paatlidun features private plunge pools, open-air star-beds on terraces, and handcrafted stone cottages steeped in rustic wildlife heritage overlooking the river valley.',1,'2026-09-15 06:32:12','https://www.paatlidun.com/');
INSERT INTO "hotels" VALUES(2,'Saraca Resort Corbett (Lebua)','saraca-resort-corbett-lebua','mohaan','Mohaan / Bakrakot, Corbett','luxury','5-Star Luxury Eco-Resort',16500,4.8,210,'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&q=80','Infinity Swimming Pool,Saraca Spa & Ayurveda,Horse Riding & Stables,Azrak Multi-Cuisine,Panoramic Pond View','Spread across 9 acres of dense green foliage adjacent to the reserve forest, Saraca Corbett offers luxurious suites and standalone cottages with panoramic views of landscaped ponds, birding trails, and horse riding facilities.',1,'2026-09-15 06:32:12','https://www.saracahotels.com/');
INSERT INTO "hotels" VALUES(3,'Namah Resort Corbett','namah-resort-corbett','dhikuli','Dhikuli, Jim Corbett (Kosi Riverbank)','luxury','5-Star Riverside Sanctuary',13500,4.8,328,'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=800&q=80','Kosi Riverfront View,Pratha All-Day Dining,Boond Bar,Spa & Fitness Center,Grand Ballroom Lawns','Surrounded by natural beauty and lush greenery, Namah sits directly along the tranquil Kosi riverbanks with grand riverview balconies, expansive lush lawns, holistic wellness therapy, and direct safari desk assistance.',1,'2026-09-15 06:32:12','https://www.namah.in/');
INSERT INTO "hotels" VALUES(4,'The Corbett Hideaway by Leisure','the-corbett-hideaway-by-leisure','dhikuli','Dhikuli, Jim Corbett','premium','4-Star Heritage Forest Hideaway',11000,4.7,264,'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800&q=80','Mango Orchard Setting,Kosi Riverside Sit-out,Outdoor Swimming Pool,The Den Wilderness Spa,Naturalist Safari Desk','A legendary wilderness retreat set amidst a scenic mango orchard by Leisure Hotels / IHCL SeleQtions, offering sloped-roof cottages, Kumaoni architecture, river-facing sit-outs, and birdwatching trails.',1,'2026-09-15 06:32:12','https://www.leisurehotels.co.in/the-corbett-hideaway/');
INSERT INTO "hotels" VALUES(5,'The Riverview Retreat','the-riverview-retreat','dhikuli','Dhikuli, Jim Corbett (Kosi Riverfront)','premium','4-Star Riverfront Retreat',9500,4.7,340,'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=80','8-Acre Riverfront Lawns,Gurney House Restaurant,Jim''s Bar,Large Swimming Pool,Nature Walking Trails','Spread across 8 lush acres on the banks of the Kosi River, featuring charming stone cottages, duplex villas, multi-cuisine dining at Gurney House, riverside lawns, and swimming pools framed by forested hills.',1,'2026-09-15 06:32:12','https://www.leisurehotels.co.in/the-riverview-retreat-corbett-resort/');
INSERT INTO "hotels" VALUES(6,'Bellmont Caves Resort','bellmont-caves-resort','mohaan','Mohaan, Corbett','mid','Boutique Cave-Themed Resort',5500,4.5,118,'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&q=80','Stone Cave Architecture,Valley View Decks,Campfire & Live Music,Outdoor Pool,Multi-Cuisine Cafe','A uniquely designed resort set among rocky foothills in Mohaan featuring cave-style rustic architecture, valley view decks, outdoor pool, campfire sessions, and authentic Himalayan hospitality.',1,'2026-09-15 06:32:12','https://bryscaves.com/');
INSERT INTO "hotels" VALUES(7,'ZANA Resort Jim Corbett','zana-resort-jim-corbett','dhikuli','Dhikuli, Corbett (Riverview)','luxury','5-Star Luxury Boutique Sanctuary',15000,4.9,165,'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=800&q=80','In-Room Fireplace,Riverview Lawns,Bespoke Wellness Spa,Mayfair All-Day Dining,Heated Pool Experience','A premier luxury resort by Espire Hospitality on the Corbett riverfront, boasting contemporary design cottages with fireplaces, private sit-outs, river views, tailored wildlife safaris, and fine dining.',1,'2026-09-15 06:32:12','https://zanaresorts.com/');
INSERT INTO "hotels" VALUES(8,'Lemon Tree Premier Corbett','lemon-tree-premier-corbett','mohaan','Mohaan, Jim Corbett','premium','4-Star Contemporary Riverside Resort',8500,4.6,280,'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800&q=80','Riverside Swimming Pool,Fresco Spa,Citrus Cafe & Slounge,Fitness Center,High-Speed Wi-Fi','Located in Mohaan right on the Kosi riverbank, Lemon Tree Premier offers vibrant contemporary styling, Citrus Cafe dining, Fresco Spa treatments, outdoor swimming pool, and easy access to Corbett safari zones.',1,'2026-09-15 06:32:12','https://www.lemontreehotels.com/lemon-tree-premier/corbett/resort-corbett');
INSERT INTO "hotels" VALUES(9,'The Solluna Resort','the-solluna-resort','marchula','Marchula Valley, Corbett (Ramganga River)','luxury','5-Star Eco-Luxury Valley Retreat',14000,4.8,310,'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800&q=80','Ramganga Valley View,Pebbled Pool & Waterfall,Top-of-the-World Dining,Stargazing Decks,River Trekking Trails','Positioned in the pristine Marchula Valley where the sun and moon harmonize, Solluna provides luxury cottages themed after nature''s elements, panoramic valley horizons, outdoor pool, and private river pebble access.',1,'2026-09-15 06:32:12','https://www.sollunaresort.com/');
INSERT INTO "hotels" VALUES(10,'Club Mahindra Corbett','club-mahindra-corbett','dhikuli','Dhikuli, Jim Corbett','premium','4-Star Family Adventure Resort',9000,4.6,420,'https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=800&q=80','Happy Hub Family Activity,Multi-Tier Swimming Pool,Machan Multi-Cuisine,Svaastha Spa,Curated Wilderness Excursions','A renowned family-friendly retreat set in Dhikuli, Club Mahindra Corbett features spacious studio apartments, landscaped gardens, the signature Happy Hub recreation center, pool, and comprehensive jungle safari desks.',1,'2026-09-15 06:32:12','https://www.clubmahindra.com/our-resorts/club-mahindra-corbett-uttarakhand');
INSERT INTO "hotels" VALUES(11,'La Pearle River Resort','la-pearle-river-resort','dhikuli','Dhikuli, Jim Corbett','mid','Riverside Boutique Garden Resort',5200,4.4,175,'https://images.unsplash.com/photo-1445019980597-93fa8acb246c?w=800&q=80','Direct River Access,7.5-Acre Fruit Orchards,Swimming Pool,Riverside Restaurant,Bonfire & Folk Performances','Set across 7.5 acres of orchards and greens touching the Kosi River, La Pearle offers cozy garden cottages, swimming pool, riverside dining, and warm hospitality at incredible value.',1,'2026-09-15 06:32:12','https://lapearleresorts.com/');
INSERT INTO "hotels" VALUES(12,'Mango Bloom River Resort','mango-bloom-river-resort','mohaan','Mohaan, Corbett (Riverbed)','mid','Serene Riverside Nature Hideaway',4800,4.4,142,'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=800&q=80','Lush Mango Groves,Pebble River Walk,Swimming Pool,Open-Air Garden Dining,Birdwatching Trails','A peaceful hideaway nestled inside dense mango groves along the riverbed near Mohaan. Perfect for birdwatchers and nature enthusiasts seeking tranquility and authentic mountain breezes.',1,'2026-09-15 06:32:12','https://mangobloomcorbett.com/');
INSERT INTO "hotels" VALUES(13,'Excel Resort Corbett','excel-resort-corbett','dhikuli','Dhikuli / Ramnagar, Corbett','budget','Budget Comfort Wildlife Stay',3500,4.3,98,'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=800&q=80','Free High-Speed Wi-Fi,Outdoor Pool,Multi-Cuisine Dining,Ample Free Parking,24/7 Room Service','An economical yet comfortable getaway located conveniently in Dhikuli with air-conditioned accommodations, swimming pool, fast access to safari pickup gates, and attentive service.',1,'2026-09-15 06:32:12','https://excelhotelandresort.com/');
INSERT INTO "hotels" VALUES(14,'Corbett River Creek Resort & Spa','corbett-river-creek-resort-spa','marchula','Marchula, Jim Corbett','premium','4-Star River Confluence Resort',8500,4.7,215,'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800&q=80','Ramganga & Creek Confluence,Ayur Van Healing Spa,Vadilal Creek View Dining,Riverside Pool,River Angling & Trekking','Perched along the confluence of the Ramganga River and a forested creek in Marchula, offering creek-facing stone cottages, lush gardens, rejuvenating Ayurvedic massages, and jungle safaris.',1,'2026-09-15 06:32:12','https://www.corbettrivercreek.com/');
INSERT INTO "hotels" VALUES(15,'Corbett The Baagh Spa & Resort','corbett-the-baagh-spa-resort','sitabani','Patkot, Corbett (Nainital Foothills)','luxury','5-Star Valley & Forest Resort',13000,4.8,275,'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800&q=80','360° Valley & Forest Panoramas,The Baagh Luxury Spa,Nazaara Multi-Cuisine Fine Dining,Infinity Hill Pool,Adventure Activity Zone','Surrounded by untouched reserved forest in Patkot near Sitabani, Corbett The Baagh delivers 5-star luxury with majestic hill backdrops, expansive suites, wellness spa treatments, and exquisite culinary spreads.',1,'2026-09-15 06:32:12','https://www.corbettthebaagh.com/');
INSERT INTO "hotels" VALUES(16,'Bela Monde Riverside Resort','bela-monde-riverside-resort','dhikuli','Dhikuli, Jim Corbett','mid','Riverside Boutique Retreat',5800,4.5,134,'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&q=80','Direct Kosi River Deck,Outdoor Swimming Pool,Riverside Diner,Sunloungers & Gardens,High-Speed Wi-Fi','Positioned gracefully on the river banks of Kosi in Dhikuli, Bel-La Monde offers tastefully crafted riverside rooms and deluxe cottages, scenic sunrise views, open gardens, and evening music sessions.',1,'2026-09-15 06:32:12','https://bellamonderiverside.com/');
INSERT INTO "hotels" VALUES(17,'Tarangi Resort & Spa','tarangi-resort-spa','dhikuli','Dhikuli, Jim Corbett (Kosi Waterfront)','luxury','5-Star Riverfront Luxury Resort',15500,4.9,380,'https://images.unsplash.com/photo-1540541338287-41700207dee6?w=800&q=80','Private Pool Villas (Jal),Sansa Ayurvedic Spa,Panorama Riverfront Diner,Whispering River Decks,Destination Wedding Lawns','A premier 5-star riverfront haven spreading across 13 verdant acres beside the Kosi River. Features private pool villas (Jal), Sarang cottages, Sansa Ayurvedic Spa, and spectacular hill vistas.',1,'2026-09-15 06:32:12','https://www.tarangiresort.com/');
INSERT INTO "hotels" VALUES(18,'Tarangi Ramganga Resort','tarangi-ramganga-resort','marchula','Marchula, Corbett (Ramganga River)','premium','4-Star Riverview Wilderness Lodge',7800,4.6,188,'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800&q=80','Direct Ramganga Riverfront,Scenic Swimming Pool,The Riverview Restaurant,Wilderness Trekking,Evening Bonfire Sessions','Tucked away in the serene Marchula valley directly beside the emerald waters of the Ramganga River, offering deluxe and club rooms, safari connections, swimming pool, and pristine natural solitude.',1,'2026-09-15 06:32:12','https://tarangiramganga.com/');
INSERT INTO "hotels" VALUES(19,'Alaya Resort','alaya-resort','kyari','Kyari Village, Corbett','mid','Eco-Village Nature Resort',4800,4.4,122,'https://images.unsplash.com/photo-1470770841072-f978cf4d019e?w=800&q=80','Eco-Village Heritage Setting,Outdoor Swimming Pool,Farm-to-Fork Organic Dining,Village Walks & Cycling,Bonfire & Acoustic Music','Experience authentic Kumaoni village life in Kyari with rustic eco-cottages, organic cuisine, swimming pool, cycling tours, village heritage walks, and peace far from city traffic.',1,'2026-09-15 06:32:12','https://alayaresorts.com/');
INSERT INTO "hotels" VALUES(20,'Country Inn Riverside Resort','country-inn-riverside-resort','dhikuli','Dhikuli, Jim Corbett','premium','4-Star Riverside Cottage Resort',8000,4.6,230,'https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?w=800&q=80','Unique Tree Top Cottages,Riverside Promenade,Swimming Pool,Multi-Cuisine Flavours,Ayurvedic Spa Therapies','Famous for its charming tree-top cottages and expansive riverside lawns in Dhikuli, Country Inn Tarika delivers family-centric luxury, open swimming pool, Ayurvedic rejuvenation, and wildlife excursions.',1,'2026-09-15 06:32:12','https://countryinn.in/');
INSERT INTO "hotels" VALUES(21,'The Golden Tusk','the-golden-tusk','dhela','Dhela / Jhirna, Corbett','luxury','5-Star Forest Eco-Resort',12500,4.8,345,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=800&q=80','Luxury Glamping Tents,Dual Swimming Pools,The Golden Flower Spa,Golden Forest Fine Dining,Forest Cycling Trails','Set amidst 10 acres of landscaped greenery on the Dhela river banks close to Jhirna and Dhela safari gates, featuring luxury tents, nature suites, dual swimming pools, and customized wildlife trails.',1,'2026-09-15 06:32:12','https://thegoldentusk.com/');
INSERT INTO "hotels" VALUES(22,'jüSTa Lazy Haven Corbett','justa-lazy-haven-corbett','bijrani','Bijrani Zone / Chhoi, Corbett','luxury','5-Star Boutique Wilderness Retreat',11500,4.8,160,'https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=800&q=80','Art-Inspired Modern Suites,Central Swimming Pool,Sabor Artisan Cuisine,Signature Spa Care,Private Forest Decks','An exquisite boutique haven blending artistic architecture with wilderness serenity, offering handcrafted luxury interiors, Sabor fine dining, lush gardens, outdoor pool, and proximity to Bijrani safari gate.',1,'2026-09-15 06:32:12','https://www.justahotels.com/corbett-resorts/');
INSERT INTO "hotels" VALUES(23,'Shervani Pebbles & Pines','shervani-pebbles-pines','dhikuli','Dhikuli, Jim Corbett','premium','4-Star Boutique Forest Haven',7500,4.6,140,'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80','Pine & Sal Woodland Setting,Swimming Pool,Pebbles Multi-Cuisine,Relaxation Therapy,Evening Campfire','A tranquil boutique retreat in Dhikuli surrounded by pine trees and pebbles, featuring tasteful rooms, relaxing pool, delectable dining, and easy access to both Bijrani and Dhikala safari zones.',1,'2026-09-15 06:32:12','https://www.shervanihotels.com/shervani-pebbles-pines-corbett/');
INSERT INTO "hotels" VALUES(24,'Sterling Corbett','sterling-corbett','marchula','Marchula / Ramganga, Corbett','premium','4-Star Riverview Leisure Resort',7200,4.5,295,'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=800&q=80','Panoramic River Valley Views,Outdoor Swimming Pool,Machan Multi-Cuisine,Subuthi Spa,Holiday Activity Centre','Overlooking the meandering Ramganga River with breathtaking views of the Shivalik hills, Sterling Corbett offers classic rooms, spacious suites, multi-cuisine dining, swimming pool, and activity hubs.',1,'2026-09-15 06:32:12','https://www.sterlingholidays.com/resorts-hotels/corbett');
INSERT INTO "hotels" VALUES(25,'Silvanza Resort','silvanza-resort','ramnagar','Bailparao / Ramnagar, Corbett','mid','Modern Comfort Eco-Resort',5000,4.5,110,'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800&q=80','Large Swimming Pool,Flavors Multi-Cuisine Diner,Lush Green Party Lawns,High-Speed Wi-Fi,Spacious Secure Parking','A modern resort surrounded by lush farmland and orchard groves in Bailparao near Ramnagar, offering comfortable family suites, sprawling green lawns, outdoor swimming pool, and safari booking desks.',1,'2026-09-15 06:32:12','https://www.silvanzaresort.com/');
INSERT INTO "hotels" VALUES(26,'Sterling Corbett Quinta','sterling-corbett-quinta','dhikuli','Dhikuli / Garjiya, Corbett','premium','4-Star Forest-Fringe Haven',7000,4.5,155,'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=800&q=80','Outdoor Swimming Pool,Quinta All-Day Diner,Scenic Garden Lawns,Safari Booking Desk,Evening Bonfire Gatherings','Nestled along the Dhikuli forest perimeter, Sterling Quinta brings warm hospitality, expansive lawns, swimming pool, fine local and continental gastronomy, and quick access to Corbett National Park gates.',1,'2026-09-15 06:32:12','https://www.sterlingholidays.com/resorts-hotels/corbett');
INSERT INTO "hotels" VALUES(27,'Aura by Xperience Corbett','aura-by-xperience-corbett','dhikuli','Dhikuli, Corbett','mid','Boutique Riverside Getaway',4600,4.4,92,'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&q=80','Swimming Pool,Multi-Cuisine Cafe,Free High-Speed Wi-Fi,Garden Sit-outs,Jeep Safari Assistance','A refreshing boutique experience in Dhikuli offering stylish modern rooms, prompt service, sparkling swimming pool, multi-cuisine dining, and friendly guidance for jungle safaris.',1,'2026-09-15 06:32:12','https://aurabyxperience.com/');
INSERT INTO "hotels" VALUES(28,'The Cloyster Resort & Spa','the-cloyster-resort-spa','dhela','Sawaldey / Dhela, Corbett','premium','4-Star Wellness & Safari Retreat',6500,4.5,148,'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&q=80','The Cloyster Wellness Spa,Swimming Pool with Sun Deck,Forest View Dining Hall,Landscaped Botanical Gardens,Evening Campfire & Music','Located in Sawaldey adjacent to the Dhela safari corridor, The Cloyster offers serene botanical settings, rejuvenating spa treatments, family suites, and seamless safari transfers.',1,'2026-09-15 06:32:12','https://thecloysterresort.in/');
INSERT INTO "hotels" VALUES(29,'Anantum Gateway Resorts & Spa','anantum-gateway-resorts-spa','pawalgarh','Pawalgarh / Bailparao, Corbett','luxury','5-Star Luxury Destination Resort',14500,4.8,320,'https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=800&q=80','Private Pool Villas,Anantum Rejuvenation Spa,Grand Multi-Cuisine Banquets,Massive Wedding Lawns,Indoor & Outdoor Sports Arena','Spread across expansive acres against the Pawalgarh forest backdrop, Anantum Gateway boasts private pool villas, grand ballrooms, luxury spa therapies, children''s recreation zones, and royal hospitality.',1,'2026-09-15 06:32:12','https://anantumgatewayresorts.com/');
INSERT INTO "hotels" VALUES(30,'Dhikala Forest Rest House','dhikala-forest-rest-house','dhikala','Dhikala Core Zone, Corbett Tiger Reserve','premium','Govt Core Forest Heritage Lodge',6500,4.9,560,'https://images.unsplash.com/photo-1470770841072-f978cf4d019e?w=800&q=80','Direct Core Tiger Reserve Access,Ramganga Reservoir Watchtower,KMVN Forest Canteen Dining,Exclusive Core Zone Gypsy Safaris,Historic 1890s Colonial Heritage','The iconic heart of Jim Corbett Tiger Reserve, Dhikala FRH offers rare deep-forest night stays overlooking the Ramganga reservoir with immediate access to raw wildlife activity and grasslands.',1,'2026-09-15 06:32:12','https://www.corbettonline.uk.gov.in/');
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
INSERT INTO "inquiries_tickets" VALUES(1,'HG-CORBETT-94821','Vikramaditya Roy','+91 98112 34567','vikram.roy@example.com','2026-10-18','2 Adults','Hotel Lodge Stay','Paatlidun Safari Lodge','Bush Cottage','Please arrange early check-in and Bijrani afternoon safari permit.','Confirmed','2026-09-15 06:32:12');
INSERT INTO "inquiries_tickets" VALUES(2,'HG-CORBETT-77291','Priya Kulkarni','+91 98201 88290','priya.k@example.com','2026-11-04','3 Adults','Hotel Lodge Stay','Tarangi Resort & Spa','Jal Pool Villa','Anniversary celebration decor in room.','New','2026-09-15 06:32:12');
INSERT INTO "inquiries_tickets" VALUES(3,'HG-CORBETT-63104','Dr. Amitava Ghosh','+91 94330 19283','amitava.ghosh@hospital.org','2026-11-20','2 Adults','Hotel Lodge Stay','The Golden Tusk','Pool View Suite','Dhela zone morning jeep safari required.','New','2026-09-15 06:32:12');
INSERT INTO "inquiries_tickets" VALUES(4,'HG-CORBETT-51928','Rohit Malhotra','+91 98710 44556','rohit.m@delhi.com','2026-12-10','4+ Adults','Hotel Lodge Stay','Saraca Resort Corbett (Lebua)','Two Bedroom Forest View','Need 2 connecting rooms and airport cab transfer from Dehradun.','Confirmed','2026-09-15 06:32:12');
INSERT INTO "inquiries_tickets" VALUES(5,'HG-CORBETT-43019','Ananya Deshmukh','+91 97654 32100','ananya.d@gmail.com','2026-12-28','2 Adults','Hotel Lodge Stay','The Solluna Resort','Premier','New Year package booking with gala dinner.','New','2026-09-15 06:32:12');
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
INSERT INTO "room_categories" VALUES(1,1,'Bush Cottage','Bush Cottage at Paatlidun Safari Lodge with scenic jungle/valley views.','2 Adults + 1 Child',24000,NULL,1);
INSERT INTO "room_categories" VALUES(2,1,'Luxury Cottage','Luxury Cottage at Paatlidun Safari Lodge with scenic jungle/valley views.','2 Adults + 1 Child',24000,NULL,2);
INSERT INTO "room_categories" VALUES(3,1,'Premium Cottage','Premium Cottage at Paatlidun Safari Lodge with scenic jungle/valley views.','2 Adults + 1 Child',24000,NULL,3);
INSERT INTO "room_categories" VALUES(4,2,'Premium Room','Premium Room at Saraca Resort Corbett (Lebua) with scenic jungle/valley views.','2 Adults + 1 Child',18500,NULL,1);
INSERT INTO "room_categories" VALUES(5,2,'Family Cottage','Family Cottage at Saraca Resort Corbett (Lebua) with scenic jungle/valley views.','2 Adults + 1 Child',18500,NULL,2);
INSERT INTO "room_categories" VALUES(6,2,'Premium Suite One Bedroom','Premium Suite One Bedroom at Saraca Resort Corbett (Lebua) with scenic jungle/valley views.','2 Adults + 1 Child',18500,NULL,3);
INSERT INTO "room_categories" VALUES(7,2,'Two Bedroom Forest View','Two Bedroom Forest View at Saraca Resort Corbett (Lebua) with scenic jungle/valley views.','2 Adults + 1 Child',18500,NULL,4);
INSERT INTO "room_categories" VALUES(8,2,'Two Bedroom Pond View','Two Bedroom Pond View at Saraca Resort Corbett (Lebua) with scenic jungle/valley views.','2 Adults + 1 Child',18500,NULL,5);
INSERT INTO "room_categories" VALUES(9,3,'Superior','Superior at Namah Resort Corbett with scenic jungle/valley views.','2 Adults + 1 Child',14500,NULL,1);
INSERT INTO "room_categories" VALUES(10,3,'Premium','Premium at Namah Resort Corbett with scenic jungle/valley views.','2 Adults + 1 Child',14500,NULL,2);
INSERT INTO "room_categories" VALUES(11,4,'Deluxe','Deluxe at The Corbett Hideaway by Leisure with scenic jungle/valley views.','2 Adults + 1 Child',11000,NULL,1);
INSERT INTO "room_categories" VALUES(12,4,'Superior','Superior at The Corbett Hideaway by Leisure with scenic jungle/valley views.','2 Adults + 1 Child',11000,NULL,2);
INSERT INTO "room_categories" VALUES(13,5,'Deluxe','Deluxe at The Riverview Retreat with scenic jungle/valley views.','2 Adults + 1 Child',9500,NULL,1);
INSERT INTO "room_categories" VALUES(14,5,'Deluxe Cottage','Deluxe Cottage at The Riverview Retreat with scenic jungle/valley views.','2 Adults + 1 Child',9500,NULL,2);
INSERT INTO "room_categories" VALUES(15,5,'Superior','Superior at The Riverview Retreat with scenic jungle/valley views.','2 Adults + 1 Child',9500,NULL,3);
INSERT INTO "room_categories" VALUES(16,5,'Duplex','Duplex at The Riverview Retreat with scenic jungle/valley views.','2 Adults + 1 Child',9500,NULL,4);
INSERT INTO "room_categories" VALUES(17,5,'Suite','Suite at The Riverview Retreat with scenic jungle/valley views.','2 Adults + 1 Child',9500,NULL,5);
INSERT INTO "room_categories" VALUES(18,5,'Premium','Premium at The Riverview Retreat with scenic jungle/valley views.','2 Adults + 1 Child',9500,NULL,6);
INSERT INTO "room_categories" VALUES(19,6,'Deluxe','Deluxe at Bellmont Caves Resort with scenic jungle/valley views.','2 Adults + 1 Child',6000,NULL,1);
INSERT INTO "room_categories" VALUES(20,6,'Executive','Executive at Bellmont Caves Resort with scenic jungle/valley views.','2 Adults + 1 Child',6000,NULL,2);
INSERT INTO "room_categories" VALUES(21,7,'Classic','Classic at ZANA Resort Jim Corbett with scenic jungle/valley views.','2 Adults + 1 Child',17000,NULL,1);
INSERT INTO "room_categories" VALUES(22,7,'Riverview','Riverview at ZANA Resort Jim Corbett with scenic jungle/valley views.','2 Adults + 1 Child',17000,NULL,2);
INSERT INTO "room_categories" VALUES(23,7,'Tiger Tales Suite','Tiger Tales Suite at ZANA Resort Jim Corbett with scenic jungle/valley views.','2 Adults + 1 Child',17000,NULL,3);
INSERT INTO "room_categories" VALUES(24,7,'Luxury Cottage with Fireplace','Luxury Cottage with Fireplace at ZANA Resort Jim Corbett with scenic jungle/valley views.','2 Adults + 1 Child',17000,NULL,4);
INSERT INTO "room_categories" VALUES(25,8,'Double','Double at Lemon Tree Premier Corbett with scenic jungle/valley views.','2 Adults + 1 Child',10500,NULL,1);
INSERT INTO "room_categories" VALUES(26,9,'Superior','Superior at The Solluna Resort with scenic jungle/valley views.','2 Adults + 1 Child',10500,NULL,1);
INSERT INTO "room_categories" VALUES(27,9,'Deluxe','Deluxe at The Solluna Resort with scenic jungle/valley views.','2 Adults + 1 Child',10500,NULL,2);
INSERT INTO "room_categories" VALUES(28,9,'Premier','Premier at The Solluna Resort with scenic jungle/valley views.','2 Adults + 1 Child',10500,NULL,3);
INSERT INTO "room_categories" VALUES(29,10,'Superior','Superior at Club Mahindra Corbett with scenic jungle/valley views.','2 Adults + 1 Child',8500,NULL,1);
INSERT INTO "room_categories" VALUES(30,11,'Std','Std at La Pearle River Resort with scenic jungle/valley views.','2 Adults + 1 Child',4500,NULL,1);
INSERT INTO "room_categories" VALUES(31,12,'Std','Std at Mango Bloom River Resort with scenic jungle/valley views.','2 Adults + 1 Child',4800,NULL,1);
INSERT INTO "room_categories" VALUES(32,13,'Std','Std at Excel Resort Corbett with scenic jungle/valley views.','2 Adults + 1 Child',3500,NULL,1);
INSERT INTO "room_categories" VALUES(33,14,'Creek','Creek at Corbett River Creek Resort & Spa with scenic jungle/valley views.','2 Adults + 1 Child',9000,NULL,1);
INSERT INTO "room_categories" VALUES(34,14,'Premium','Premium at Corbett River Creek Resort & Spa with scenic jungle/valley views.','2 Adults + 1 Child',9000,NULL,2);
INSERT INTO "room_categories" VALUES(35,14,'Creek Luxury','Creek Luxury at Corbett River Creek Resort & Spa with scenic jungle/valley views.','2 Adults + 1 Child',9000,NULL,3);
INSERT INTO "room_categories" VALUES(36,15,'Jungle Cat','Jungle Cat at Corbett The Baagh Spa & Resort with scenic jungle/valley views.','2 Adults + 1 Child',13500,NULL,1);
INSERT INTO "room_categories" VALUES(37,15,'Spotted Cat','Spotted Cat at Corbett The Baagh Spa & Resort with scenic jungle/valley views.','2 Adults + 1 Child',13500,NULL,2);
INSERT INTO "room_categories" VALUES(38,15,'Leopard Cat','Leopard Cat at Corbett The Baagh Spa & Resort with scenic jungle/valley views.','2 Adults + 1 Child',13500,NULL,3);
INSERT INTO "room_categories" VALUES(39,15,'Leopard Suite','Leopard Suite at Corbett The Baagh Spa & Resort with scenic jungle/valley views.','2 Adults + 1 Child',13500,NULL,4);
INSERT INTO "room_categories" VALUES(40,16,'Std','Std at Bela Monde Riverside Resort with scenic jungle/valley views.','2 Adults + 1 Child',8000,NULL,1);
INSERT INTO "room_categories" VALUES(41,16,'Deluxe','Deluxe at Bela Monde Riverside Resort with scenic jungle/valley views.','2 Adults + 1 Child',8000,NULL,2);
INSERT INTO "room_categories" VALUES(42,17,'Sarang','Sarang at Tarangi Resort & Spa with scenic jungle/valley views.','2 Adults + 1 Child',16000,NULL,1);
INSERT INTO "room_categories" VALUES(43,17,'Luxury Cottage','Luxury Cottage at Tarangi Resort & Spa with scenic jungle/valley views.','2 Adults + 1 Child',16000,NULL,2);
INSERT INTO "room_categories" VALUES(44,17,'River View Cottage','River View Cottage at Tarangi Resort & Spa with scenic jungle/valley views.','2 Adults + 1 Child',16000,NULL,3);
INSERT INTO "room_categories" VALUES(45,17,'Jal Pool Villa','Jal Pool Villa at Tarangi Resort & Spa with scenic jungle/valley views.','2 Adults + 1 Child',16000,NULL,4);
INSERT INTO "room_categories" VALUES(46,17,'Whispering 4 Bedroom','Whispering 4 Bedroom at Tarangi Resort & Spa with scenic jungle/valley views.','2 Adults + 1 Child',16000,NULL,5);
INSERT INTO "room_categories" VALUES(47,18,'Deluxe Cottage','Deluxe Cottage at Tarangi Ramganga Resort with scenic jungle/valley views.','2 Adults + 1 Child',9500,NULL,1);
INSERT INTO "room_categories" VALUES(48,18,'Super Dlx Cottage','Super Dlx Cottage at Tarangi Ramganga Resort with scenic jungle/valley views.','2 Adults + 1 Child',9500,NULL,2);
INSERT INTO "room_categories" VALUES(49,18,'Ramganga Suite','Ramganga Suite at Tarangi Ramganga Resort with scenic jungle/valley views.','2 Adults + 1 Child',9500,NULL,3);
INSERT INTO "room_categories" VALUES(50,18,'Pine Cottage','Pine Cottage at Tarangi Ramganga Resort with scenic jungle/valley views.','2 Adults + 1 Child',9500,NULL,4);
INSERT INTO "room_categories" VALUES(51,18,'Duplex Cottage','Duplex Cottage at Tarangi Ramganga Resort with scenic jungle/valley views.','2 Adults + 1 Child',9500,NULL,5);
INSERT INTO "room_categories" VALUES(52,18,'River Facing Family Cottage','River Facing Family Cottage at Tarangi Ramganga Resort with scenic jungle/valley views.','2 Adults + 1 Child',9500,NULL,6);
INSERT INTO "room_categories" VALUES(53,19,'Double','Double at Alaya Resort with scenic jungle/valley views.','2 Adults + 1 Child',5500,NULL,1);
INSERT INTO "room_categories" VALUES(54,20,'Jungle View','Jungle View at Country Inn Riverside Resort with scenic jungle/valley views.','2 Adults + 1 Child',10000,NULL,1);
INSERT INTO "room_categories" VALUES(55,20,'Jims Cottage','Jims Cottage at Country Inn Riverside Resort with scenic jungle/valley views.','2 Adults + 1 Child',10000,NULL,2);
INSERT INTO "room_categories" VALUES(56,20,'Cottage with Terrace','Cottage with Terrace at Country Inn Riverside Resort with scenic jungle/valley views.','2 Adults + 1 Child',10000,NULL,3);
INSERT INTO "room_categories" VALUES(57,20,'Cottage with Garden','Cottage with Garden at Country Inn Riverside Resort with scenic jungle/valley views.','2 Adults + 1 Child',10000,NULL,4);
INSERT INTO "room_categories" VALUES(58,20,'Cottage with Plunge Pool','Cottage with Plunge Pool at Country Inn Riverside Resort with scenic jungle/valley views.','2 Adults + 1 Child',10000,NULL,5);
INSERT INTO "room_categories" VALUES(59,21,'Garden Suite','Garden Suite at The Golden Tusk with scenic jungle/valley views.','2 Adults + 1 Child',14000,NULL,1);
INSERT INTO "room_categories" VALUES(60,21,'Nature View / Luxury Tents','Nature View / Luxury Tents at The Golden Tusk with scenic jungle/valley views.','2 Adults + 1 Child',14000,NULL,2);
INSERT INTO "room_categories" VALUES(61,21,'Pool View Suite','Pool View Suite at The Golden Tusk with scenic jungle/valley views.','2 Adults + 1 Child',14000,NULL,3);
INSERT INTO "room_categories" VALUES(62,21,'Corbett Suite','Corbett Suite at The Golden Tusk with scenic jungle/valley views.','2 Adults + 1 Child',14000,NULL,4);
INSERT INTO "room_categories" VALUES(63,21,'Villa','Villa at The Golden Tusk with scenic jungle/valley views.','2 Adults + 1 Child',14000,NULL,5);
INSERT INTO "room_categories" VALUES(64,21,'Villa Grande','Villa Grande at The Golden Tusk with scenic jungle/valley views.','2 Adults + 1 Child',14000,NULL,6);
INSERT INTO "room_categories" VALUES(65,21,'Tusk Suite','Tusk Suite at The Golden Tusk with scenic jungle/valley views.','2 Adults + 1 Child',14000,NULL,7);
INSERT INTO "room_categories" VALUES(66,21,'Tiger Suite (4 Pax)','Tiger Suite (4 Pax) at The Golden Tusk with scenic jungle/valley views.','2 Adults + 1 Child',14000,NULL,8);
INSERT INTO "room_categories" VALUES(67,22,'Superior with Balcony','Superior with Balcony at jüSTa Lazy Haven Corbett with scenic jungle/valley views.','2 Adults + 1 Child',7500,NULL,1);
INSERT INTO "room_categories" VALUES(68,22,'Deluxe with Balcony','Deluxe with Balcony at jüSTa Lazy Haven Corbett with scenic jungle/valley views.','2 Adults + 1 Child',7500,NULL,2);
INSERT INTO "room_categories" VALUES(69,23,'Deluxe Garden View','Deluxe Garden View at Shervani Pebbles & Pines with scenic jungle/valley views.','2 Adults + 1 Child',8500,NULL,1);
INSERT INTO "room_categories" VALUES(70,23,'Premium Garden','Premium Garden at Shervani Pebbles & Pines with scenic jungle/valley views.','2 Adults + 1 Child',8500,NULL,2);
INSERT INTO "room_categories" VALUES(71,23,'Superior with Jacuzzi','Superior with Jacuzzi at Shervani Pebbles & Pines with scenic jungle/valley views.','2 Adults + 1 Child',8500,NULL,3);
INSERT INTO "room_categories" VALUES(72,24,'Classic','Classic at Sterling Corbett with scenic jungle/valley views.','2 Adults + 1 Child',8000,NULL,1);
INSERT INTO "room_categories" VALUES(73,24,'Premier','Premier at Sterling Corbett with scenic jungle/valley views.','2 Adults + 1 Child',8000,NULL,2);
INSERT INTO "room_categories" VALUES(74,25,'Origin','Origin at Silvanza Resort with scenic jungle/valley views.','2 Adults + 1 Child',4200,NULL,1);
INSERT INTO "room_categories" VALUES(75,25,'Breeze','Breeze at Silvanza Resort with scenic jungle/valley views.','2 Adults + 1 Child',4200,NULL,2);
INSERT INTO "room_categories" VALUES(76,26,'Classic','Classic at Sterling Corbett Quinta with scenic jungle/valley views.','2 Adults + 1 Child',7800,NULL,1);
INSERT INTO "room_categories" VALUES(77,26,'Premier','Premier at Sterling Corbett Quinta with scenic jungle/valley views.','2 Adults + 1 Child',7800,NULL,2);
INSERT INTO "room_categories" VALUES(78,27,'Deluxe Cottage','Deluxe Cottage at Aura by Xperience Corbett with scenic jungle/valley views.','2 Adults + 1 Child',9200,NULL,1);
INSERT INTO "room_categories" VALUES(79,27,'Mud Cottage','Mud Cottage at Aura by Xperience Corbett with scenic jungle/valley views.','2 Adults + 1 Child',9200,NULL,2);
INSERT INTO "room_categories" VALUES(80,27,'Premium','Premium at Aura by Xperience Corbett with scenic jungle/valley views.','2 Adults + 1 Child',9200,NULL,3);
INSERT INTO "room_categories" VALUES(81,27,'Elegant Plunge Pool','Elegant Plunge Pool at Aura by Xperience Corbett with scenic jungle/valley views.','2 Adults + 1 Child',9200,NULL,4);
INSERT INTO "room_categories" VALUES(82,27,'Family Villa 4 Pax','Family Villa 4 Pax at Aura by Xperience Corbett with scenic jungle/valley views.','2 Adults + 1 Child',9200,NULL,5);
INSERT INTO "room_categories" VALUES(83,28,'Deluxe Garden View','Deluxe Garden View at The Cloyster Resort & Spa with scenic jungle/valley views.','2 Adults + 1 Child',8200,NULL,1);
INSERT INTO "room_categories" VALUES(84,28,'Premium Jungle View','Premium Jungle View at The Cloyster Resort & Spa with scenic jungle/valley views.','2 Adults + 1 Child',8200,NULL,2);
INSERT INTO "room_categories" VALUES(85,28,'Luxury Hill Facing','Luxury Hill Facing at The Cloyster Resort & Spa with scenic jungle/valley views.','2 Adults + 1 Child',8200,NULL,3);
INSERT INTO "room_categories" VALUES(86,28,'Pool View','Pool View at The Cloyster Resort & Spa with scenic jungle/valley views.','2 Adults + 1 Child',8200,NULL,4);
INSERT INTO "room_categories" VALUES(87,29,'Deluxe','Deluxe at Anantum Gateway Resorts & Spa with scenic jungle/valley views.','2 Adults + 1 Child',12500,NULL,1);
INSERT INTO "room_categories" VALUES(88,29,'Executive','Executive at Anantum Gateway Resorts & Spa with scenic jungle/valley views.','2 Adults + 1 Child',12500,NULL,2);
INSERT INTO "room_categories" VALUES(89,29,'Plunge Pool Cottage','Plunge Pool Cottage at Anantum Gateway Resorts & Spa with scenic jungle/valley views.','2 Adults + 1 Child',12500,NULL,3);
INSERT INTO "room_categories" VALUES(90,30,'Dhikala Forest Cabin','Dhikala Forest Cabin at Dhikala Forest Rest House with scenic jungle/valley views.','2 Adults + 1 Child',5000,NULL,1);
INSERT INTO "room_categories" VALUES(91,30,'Hutment','Hutment at Dhikala Forest Rest House with scenic jungle/valley views.','2 Adults + 1 Child',5000,NULL,2);
INSERT INTO "room_categories" VALUES(92,30,'New Forest Rest House Room','New Forest Rest House Room at Dhikala Forest Rest House with scenic jungle/valley views.','2 Adults + 1 Child',5000,NULL,3);
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
INSERT INTO "safari_zones" VALUES(1,'Dhikala Zone','Dhangarhi Gate','Core','06:00 AM - 09:30 AM','03:00 PM - 06:30 PM',6500,2200,32,'15 Nov - 15 June','The most famous core zone with panoramic Ramganga riverbed views and highest tiger density.');
INSERT INTO "safari_zones" VALUES(2,'Bijrani Zone','Amdanda Gate','Core','06:00 AM - 09:30 AM','02:30 PM - 06:00 PM',4500,0,30,'15 Oct - 30 June','Magnificent sal forests and open grasslands known for royal Bengal tiger encounters.');
INSERT INTO "safari_zones" VALUES(3,'Jhirna Zone','Dhela Gate','Buffer/Core','06:00 AM - 09:30 AM','02:30 PM - 06:00 PM',4500,0,30,'Open Round the Year','South boundary zone famous for sloth bears, wild elephants, and deer herds.');
INSERT INTO "safari_zones" VALUES(4,'Dhela Zone','Dhela Gate','Eco-Tourism','06:00 AM - 09:30 AM','02:30 PM - 06:00 PM',4200,0,15,'Open Round the Year','Rich mixed forest and water bodies ideal for bird watching and tiger sightings.');
INSERT INTO "safari_zones" VALUES(5,'Durga Devi Zone','Durga Devi Gate','Hilly Core','06:00 AM - 09:30 AM','02:30 PM - 06:00 PM',4800,0,15,'15 Nov - 15 June','Hilly terrain along Mandal River, paradise for birders and Mahseer fish watchers.');
INSERT INTO "safari_zones" VALUES(6,'Sitabani Zone','Ramnagar Gate','Landscape','06:00 AM - 09:30 AM','02:30 PM - 06:00 PM',4000,0,50,'Open Round the Year','Mythological forest buffer zone associated with Ramayana, rich in avian species.');
INSERT INTO "safari_zones" VALUES(7,'Garjiya Zone','Garjiya Gate','Core','06:00 AM - 09:30 AM','02:30 PM - 06:00 PM',4600,0,30,'15 Oct - 30 June','Scenic zone adjoining Bijrani, popular for rich grasslands and wildlife sightings.');
INSERT INTO "safari_zones" VALUES(8,'Phato Zone','Maldhan Gate','Eco-Tourism','06:00 AM - 09:30 AM','02:30 PM - 06:00 PM',4200,0,30,'Open Round the Year','Newest eco-tourism zone with treehouses and pristine woodlands.');
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
INSERT INTO "site_content" VALUES(1,'brand_header','global','Honeygold India - Corbett Initiative','Domestic Tourism Initiative','Book forest resorts, reserve safaris, and arrange wilderness destination weddings in Jim Corbett National Park.','https://www.honeygoldindia.com/img/logo2.png','2026-09-15 06:32:12');
INSERT INTO "site_content" VALUES(2,'hero_banner','index','Uncover the Wilderness of Jim Corbett','India''s Oldest & Most Prestigious Wildlife Sanctuary','Experience nature in its rawest form. Book luxury forest resorts, adventure river safaris, and host unforgettable wilderness weddings in Corbett''s magical ecosystem.','assets/img/hero/hero-bg.jpg','2026-09-15 06:32:12');
INSERT INTO "site_content" VALUES(3,'about_heritage','about','The Historic Journey of Hailey to Corbett','Founded 1936 | Project Tiger 1973','Established in 1936 as Hailey National Park, Jim Corbett National Park stands as India''s oldest wildlife reserve. Renamed in honor of legendary hunter-turned-conservationist Jim Corbett, it remains the crown jewel of tiger conservation.','assets/img/honeygold/about.jpg','2026-09-15 06:32:12');
INSERT INTO "site_content" VALUES(4,'contact_srinagar','global','Srinagar Head Office','Rather Complex, Top Floor, Near New Era School, RajBagh, Srinagar - 190008','Ph: 0194-2310736, 2310270 | Mobile: +91 9419045656','','2026-09-15 06:32:12');
INSERT INTO "site_content" VALUES(5,'contact_delhi','global','New Delhi Corporate Office','B1/36, Ashok Vihar Phase II, New Delhi - 110052','Ph: 011-47145656 | Toll Free: 1800 891 7626','','2026-09-15 06:32:12');
CREATE INDEX idx_hotels_zone ON hotels(zone);
CREATE INDEX idx_hotels_category ON hotels(category);
CREATE INDEX idx_rooms_hotel ON room_categories(hotel_id);
CREATE INDEX idx_tickets_number ON inquiries_tickets(ticket_number);
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('hotels',30);
INSERT INTO "sqlite_sequence" VALUES('room_categories',92);
INSERT INTO "sqlite_sequence" VALUES('safari_zones',8);
INSERT INTO "sqlite_sequence" VALUES('activities',5);
INSERT INTO "sqlite_sequence" VALUES('inquiries_tickets',5);
INSERT INTO "sqlite_sequence" VALUES('site_content',5);
COMMIT;
