/**
 * Honeygold Corbett Domestic Tourism Database - Synchronized Data Store
 * Built directly from database/corbett.db (SQLite) & database/corbett_schema_and_data.sql
 * 30 Hotels, 92 Room Categories, 8 Safari Zones, 5 Inquiries/Tickets, 5 Content Blocks
 */

window.CORBETT_INITIAL_DB = {
    hotels: [
    {
        "id": 1,
        "name": "Paatlidun Safari Lodge",
        "slug": "paatlidun-safari-lodge",
        "zone": "mohaan",
        "zone_label": "Mohaan / Bakrakot, Corbett",
        "category": "luxury",
        "tier_badge": "5-Star Ultra Luxury Wildlife Lodge",
        "price": 24000.0,
        "rating": 4.9,
        "reviews": 184,
        "official_website": "https://www.paatlidun.com/",
        "image": "https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi riverfront parking activity",
        "amenities_list": [
            "Private Plunge Pool",
            "Open-Air Star Bed",
            "Arijana Wellness Spa",
            "Kumaoni Fine Dining",
            "Chahi Wildlife Library"
        ],
        "description": "Nestled on the edge of Corbett along the Kumaon foothills, Paatlidun features private plunge pools, open-air star-beds on terraces, and handcrafted stone cottages steeped in rustic wildlife heritage overlooking the river valley.",
        "rooms": [
            "Bush Cottage",
            "Luxury Cottage",
            "Premium Cottage"
        ]
    },
    {
        "id": 2,
        "name": "Saraca Resort Corbett (Lebua)",
        "slug": "saraca-resort-corbett-lebua",
        "zone": "mohaan",
        "zone_label": "Mohaan / Bakrakot, Corbett",
        "category": "luxury",
        "tier_badge": "5-Star Luxury Eco-Resort",
        "price": 16500.0,
        "rating": 4.8,
        "reviews": 210,
        "official_website": "https://www.saracahotels.com/",
        "image": "https://images.unsplash.com/photo-1582719508461-905c673771fd?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi activity parking",
        "amenities_list": [
            "Infinity Swimming Pool",
            "Saraca Spa & Ayurveda",
            "Horse Riding & Stables",
            "Azrak Multi-Cuisine",
            "Panoramic Pond View"
        ],
        "description": "Spread across 9 acres of dense green foliage adjacent to the reserve forest, Saraca Corbett offers luxurious suites and standalone cottages with panoramic views of landscaped ponds, birding trails, and horse riding facilities.",
        "rooms": [
            "Premium room",
            "Family Cottage",
            "Premium Suite one bedroom",
            "Two bedroom Forest view",
            "Two bedroom Pond view"
        ]
    },
    {
        "id": 3,
        "name": "Namah Resort Corbett",
        "slug": "namah-resort-corbett",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett (Kosi Riverbank)",
        "category": "luxury",
        "tier_badge": "5-Star Riverside Sanctuary",
        "price": 13500.0,
        "rating": 4.8,
        "reviews": 328,
        "official_website": "https://www.namah.in/",
        "image": "https://images.unsplash.com/photo-1540555700478-4be289fbecef?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi riverfront parking activity",
        "amenities_list": [
            "Kosi Riverfront View",
            "Pratha All-Day Dining",
            "Boond Bar",
            "Spa & Fitness Center",
            "Grand Ballroom Lawns"
        ],
        "description": "Surrounded by natural beauty and lush greenery, Namah sits directly along the tranquil Kosi riverbanks with grand riverview balconies, expansive lush lawns, holistic wellness therapy, and direct safari desk assistance.",
        "rooms": [
            "Superior",
            "Premium"
        ]
    },
    {
        "id": 4,
        "name": "The Corbett Hideaway by Leisure",
        "slug": "the-corbett-hideaway-by-leisure",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett",
        "category": "premium",
        "tier_badge": "4-Star Heritage Forest Hideaway",
        "price": 11000.0,
        "rating": 4.7,
        "reviews": 264,
        "official_website": "https://www.leisurehotels.co.in/the-corbett-hideaway/",
        "image": "https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi riverfront parking activity",
        "amenities_list": [
            "Mango Orchard Setting",
            "Kosi Riverside Sit-out",
            "Outdoor Swimming Pool",
            "The Den Wilderness Spa",
            "Naturalist Safari Desk"
        ],
        "description": "A legendary wilderness retreat set amidst a scenic mango orchard by Leisure Hotels / IHCL SeleQtions, offering sloped-roof cottages, Kumaoni architecture, river-facing sit-outs, and birdwatching trails.",
        "rooms": [
            "Deluxe",
            "Superior"
        ]
    },
    {
        "id": 5,
        "name": "The Riverview Retreat",
        "slug": "the-riverview-retreat",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett (Kosi Riverfront)",
        "category": "premium",
        "tier_badge": "4-Star Riverfront Retreat",
        "price": 9500.0,
        "rating": 4.7,
        "reviews": 340,
        "official_website": "https://www.leisurehotels.co.in/the-riverview-retreat-corbett-resort/",
        "image": "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi riverfront parking activity",
        "amenities_list": [
            "8-Acre Riverfront Lawns",
            "Gurney House Restaurant",
            "Jim's Bar",
            "Large Swimming Pool",
            "Nature Walking Trails"
        ],
        "description": "Spread across 8 lush acres on the banks of the Kosi River, featuring charming stone cottages, duplex villas, multi-cuisine dining at Gurney House, riverside lawns, and swimming pools framed by forested hills.",
        "rooms": [
            "Deluxe",
            "Deluxe cottage",
            "Superior",
            "Duplex",
            "Suite",
            "Premium"
        ]
    },
    {
        "id": 6,
        "name": "Bellmont Caves Resort",
        "slug": "bellmont-caves-resort",
        "zone": "mohaan",
        "zone_label": "Mohaan, Corbett",
        "category": "mid",
        "tier_badge": "Boutique Cave-Themed Resort",
        "price": 5500.0,
        "rating": 4.5,
        "reviews": 118,
        "official_website": "https://bryscaves.com/",
        "image": "https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool restaurant wifi parking activity",
        "amenities_list": [
            "Stone Cave Architecture",
            "Valley View Decks",
            "Campfire & Live Music",
            "Outdoor Pool",
            "Multi-Cuisine Cafe"
        ],
        "description": "A uniquely designed resort set among rocky foothills in Mohaan featuring cave-style rustic architecture, valley view decks, outdoor pool, campfire sessions, and authentic Himalayan hospitality.",
        "rooms": [
            "Deluxe",
            "Executive"
        ]
    },
    {
        "id": 7,
        "name": "ZANA Resort Jim Corbett",
        "slug": "zana-resort-jim-corbett",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Corbett (Riverview)",
        "category": "luxury",
        "tier_badge": "5-Star Luxury Boutique Sanctuary",
        "price": 15000.0,
        "rating": 4.9,
        "reviews": 165,
        "official_website": "https://zanaresorts.com/",
        "image": "https://images.unsplash.com/photo-1578683010236-d716f9a3f461?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi riverfront parking activity",
        "amenities_list": [
            "In-Room Fireplace",
            "Riverview Lawns",
            "Bespoke Wellness Spa",
            "Mayfair All-Day Dining",
            "Heated Pool Experience"
        ],
        "description": "A premier luxury resort by Espire Hospitality on the Corbett riverfront, boasting contemporary design cottages with fireplaces, private sit-outs, river views, tailored wildlife safaris, and fine dining.",
        "rooms": [
            "Classic",
            "Riverview",
            "Tiger  Tales Suite",
            "Luxury cottage with Fireplace"
        ]
    },
    {
        "id": 8,
        "name": "Lemon Tree Premier Corbett",
        "slug": "lemon-tree-premier-corbett",
        "zone": "mohaan",
        "zone_label": "Mohaan, Jim Corbett",
        "category": "premium",
        "tier_badge": "4-Star Contemporary Riverside Resort",
        "price": 8500.0,
        "rating": 4.6,
        "reviews": 280,
        "official_website": "https://www.lemontreehotels.com/lemon-tree-premier/corbett/resort-corbett",
        "image": "https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi riverfront parking activity",
        "amenities_list": [
            "Riverside Swimming Pool",
            "Fresco Spa",
            "Citrus Cafe & Slounge",
            "Fitness Center",
            "High-Speed Wi-Fi"
        ],
        "description": "Located in Mohaan right on the Kosi riverbank, Lemon Tree Premier offers vibrant contemporary styling, Citrus Cafe dining, Fresco Spa treatments, outdoor swimming pool, and easy access to Corbett safari zones.",
        "rooms": [
            "Double"
        ]
    },
    {
        "id": 9,
        "name": "The Solluna Resort",
        "slug": "the-solluna-resort",
        "zone": "marchula",
        "zone_label": "Marchula Valley, Corbett (Ramganga River)",
        "category": "luxury",
        "tier_badge": "5-Star Eco-Luxury Valley Retreat",
        "price": 14000.0,
        "rating": 4.8,
        "reviews": 310,
        "official_website": "https://www.sollunaresort.com/",
        "image": "https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi riverfront parking activity",
        "amenities_list": [
            "Ramganga Valley View",
            "Pebbled Pool & Waterfall",
            "Top-of-the-World Dining",
            "Stargazing Decks",
            "River Trekking Trails"
        ],
        "description": "Positioned in the pristine Marchula Valley where the sun and moon harmonize, Solluna provides luxury cottages themed after nature's elements, panoramic valley horizons, outdoor pool, and private river pebble access.",
        "rooms": [
            "Superior",
            "Deluxe",
            "Premier"
        ]
    },
    {
        "id": 10,
        "name": "Club Mahindra Corbett",
        "slug": "club-mahindra-corbett",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett",
        "category": "premium",
        "tier_badge": "4-Star Family Adventure Resort",
        "price": 9000.0,
        "rating": 4.6,
        "reviews": 420,
        "official_website": "https://www.clubmahindra.com/our-resorts/club-mahindra-corbett-uttarakhand",
        "image": "https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi parking activity",
        "amenities_list": [
            "Happy Hub Family Activity",
            "Multi-Tier Swimming Pool",
            "Machan Multi-Cuisine",
            "Svaastha Spa",
            "Curated Wilderness Excursions"
        ],
        "description": "A renowned family-friendly retreat set in Dhikuli, Club Mahindra Corbett features spacious studio apartments, landscaped gardens, the signature Happy Hub recreation center, pool, and comprehensive jungle safari desks.",
        "rooms": [
            "Superior"
        ]
    },
    {
        "id": 11,
        "name": "La Pearle River Resort",
        "slug": "la-pearle-river-resort",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett",
        "category": "mid",
        "tier_badge": "Riverside Boutique Garden Resort",
        "price": 5200.0,
        "rating": 4.4,
        "reviews": 175,
        "official_website": "https://lapearleresorts.com/",
        "image": "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool restaurant wifi riverfront parking activity",
        "amenities_list": [
            "Direct River Access",
            "7.5-Acre Fruit Orchards",
            "Swimming Pool",
            "Riverside Restaurant",
            "Bonfire & Folk Performances"
        ],
        "description": "Set across 7.5 acres of orchards and greens touching the Kosi River, La Pearle offers cozy garden cottages, swimming pool, riverside dining, and warm hospitality at incredible value.",
        "rooms": [
            "Std"
        ]
    },
    {
        "id": 12,
        "name": "Mango Bloom River Resort",
        "slug": "mango-bloom-river-resort",
        "zone": "mohaan",
        "zone_label": "Mohaan, Corbett (Riverbed)",
        "category": "mid",
        "tier_badge": "Serene Riverside Nature Hideaway",
        "price": 4800.0,
        "rating": 4.4,
        "reviews": 142,
        "official_website": "https://mangobloomcorbett.com/",
        "image": "https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool restaurant wifi riverfront parking activity",
        "amenities_list": [
            "Lush Mango Groves",
            "Pebble River Walk",
            "Swimming Pool",
            "Open-Air Garden Dining",
            "Birdwatching Trails"
        ],
        "description": "A peaceful hideaway nestled inside dense mango groves along the riverbed near Mohaan. Perfect for birdwatchers and nature enthusiasts seeking tranquility and authentic mountain breezes.",
        "rooms": [
            "Std"
        ]
    },
    {
        "id": 13,
        "name": "Excel Resort Corbett",
        "slug": "excel-resort-corbett",
        "zone": "dhikuli",
        "zone_label": "Dhikuli / Ramnagar, Corbett",
        "category": "budget",
        "tier_badge": "Budget Comfort Wildlife Stay",
        "price": 3500.0,
        "rating": 4.3,
        "reviews": 98,
        "official_website": "https://excelhotelandresort.com/",
        "image": "https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool restaurant wifi parking",
        "amenities_list": [
            "Free High-Speed Wi-Fi",
            "Outdoor Pool",
            "Multi-Cuisine Dining",
            "Ample Free Parking",
            "24/7 Room Service"
        ],
        "description": "An economical yet comfortable getaway located conveniently in Dhikuli with air-conditioned accommodations, swimming pool, fast access to safari pickup gates, and attentive service.",
        "rooms": [
            "Std"
        ]
    },
    {
        "id": 14,
        "name": "Corbett River Creek Resort & Spa",
        "slug": "corbett-river-creek-resort-spa",
        "zone": "marchula",
        "zone_label": "Marchula, Jim Corbett",
        "category": "premium",
        "tier_badge": "4-Star River Confluence Resort",
        "price": 8500.0,
        "rating": 4.7,
        "reviews": 215,
        "official_website": "https://www.corbettrivercreek.com/",
        "image": "https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi riverfront parking activity",
        "amenities_list": [
            "Ramganga & Creek Confluence",
            "Ayur Van Healing Spa",
            "Vadilal Creek View Dining",
            "Riverside Pool",
            "River Angling & Trekking"
        ],
        "description": "Perched along the confluence of the Ramganga River and a forested creek in Marchula, offering creek-facing stone cottages, lush gardens, rejuvenating Ayurvedic massages, and jungle safaris.",
        "rooms": [
            "Creek",
            "Premium",
            "Creek Luxury"
        ]
    },
    {
        "id": 15,
        "name": "Corbett The Baagh Spa & Resort",
        "slug": "corbett-the-baagh-spa-resort",
        "zone": "sitabani",
        "zone_label": "Patkot, Corbett (Nainital Foothills)",
        "category": "luxury",
        "tier_badge": "5-Star Valley & Forest Resort",
        "price": 13000.0,
        "rating": 4.8,
        "reviews": 275,
        "official_website": "https://www.corbettthebaagh.com/",
        "image": "https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi parking activity",
        "amenities_list": [
            "360\u00b0 Valley & Forest Panoramas",
            "The Baagh Luxury Spa",
            "Nazaara Multi-Cuisine Fine Dining",
            "Infinity Hill Pool",
            "Adventure Activity Zone"
        ],
        "description": "Surrounded by untouched reserved forest in Patkot near Sitabani, Corbett The Baagh delivers 5-star luxury with majestic hill backdrops, expansive suites, wellness spa treatments, and exquisite culinary spreads.",
        "rooms": [
            "Jungle Cat",
            "Spotted Cat",
            "Leopard Cat",
            "Leopard Suite"
        ]
    },
    {
        "id": 16,
        "name": "Bela Monde Riverside Resort",
        "slug": "bela-monde-riverside-resort",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett",
        "category": "mid",
        "tier_badge": "Riverside Boutique Retreat",
        "price": 5800.0,
        "rating": 4.5,
        "reviews": 134,
        "official_website": "https://bellamonderiverside.com/",
        "image": "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool restaurant wifi riverfront parking",
        "amenities_list": [
            "Direct Kosi River Deck",
            "Outdoor Swimming Pool",
            "Riverside Diner",
            "Sunloungers & Gardens",
            "High-Speed Wi-Fi"
        ],
        "description": "Positioned gracefully on the river banks of Kosi in Dhikuli, Bel-La Monde offers tastefully crafted riverside rooms and deluxe cottages, scenic sunrise views, open gardens, and evening music sessions.",
        "rooms": [
            "Std",
            "Deluxe"
        ]
    },
    {
        "id": 17,
        "name": "Tarangi Resort & Spa",
        "slug": "tarangi-resort-spa",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett (Kosi Waterfront)",
        "category": "luxury",
        "tier_badge": "5-Star Riverfront Luxury Resort",
        "price": 15500.0,
        "rating": 4.9,
        "reviews": 380,
        "official_website": "https://www.tarangiresort.com/",
        "image": "https://images.unsplash.com/photo-1540555700478-4be289fbecef?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi riverfront parking activity",
        "amenities_list": [
            "Private Pool Villas (Jal)",
            "Sansa Ayurvedic Spa",
            "Panorama Riverfront Diner",
            "Whispering River Decks",
            "Destination Wedding Lawns"
        ],
        "description": "A premier 5-star riverfront haven spreading across 13 verdant acres beside the Kosi River. Features private pool villas (Jal), Sarang cottages, Sansa Ayurvedic Spa, and spectacular hill vistas.",
        "rooms": [
            "Sarang",
            "Luxury Cottage",
            "Jal The Pool Villa"
        ]
    },
    {
        "id": 18,
        "name": "Tarangi Ramganga Resort",
        "slug": "tarangi-ramganga-resort",
        "zone": "marchula",
        "zone_label": "Marchula, Corbett (Ramganga River)",
        "category": "premium",
        "tier_badge": "4-Star Riverview Wilderness Lodge",
        "price": 7800.0,
        "rating": 4.6,
        "reviews": 188,
        "official_website": "https://tarangiramganga.com/",
        "image": "https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi riverfront parking activity",
        "amenities_list": [
            "Direct Ramganga Riverfront",
            "Scenic Swimming Pool",
            "The Riverview Restaurant",
            "Wilderness Trekking",
            "Evening Bonfire Sessions"
        ],
        "description": "Tucked away in the serene Marchula valley directly beside the emerald waters of the Ramganga River, offering deluxe and club rooms, safari connections, swimming pool, and pristine natural solitude.",
        "rooms": [
            "Deluxe",
            "Superior Deluxe",
            "Club",
            "Suite"
        ]
    },
    {
        "id": 19,
        "name": "Alaya Resort",
        "slug": "alaya-resort",
        "zone": "kyari",
        "zone_label": "Kyari Village, Corbett",
        "category": "mid",
        "tier_badge": "Eco-Village Nature Resort",
        "price": 4800.0,
        "rating": 4.4,
        "reviews": 122,
        "official_website": "https://alayaresorts.com/",
        "image": "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool restaurant wifi parking activity",
        "amenities_list": [
            "Eco-Village Heritage Setting",
            "Outdoor Swimming Pool",
            "Farm-to-Fork Organic Dining",
            "Village Walks & Cycling",
            "Bonfire & Acoustic Music"
        ],
        "description": "Experience authentic Kumaoni village life in Kyari with rustic eco-cottages, organic cuisine, swimming pool, cycling tours, village heritage walks, and peace far from city traffic.",
        "rooms": [
            "Standard",
            "Deluxe",
            "Executive"
        ]
    },
    {
        "id": 20,
        "name": "Country Inn Tarika Riverside Resort",
        "slug": "country-inn-tarika-riverside-resort",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett",
        "category": "premium",
        "tier_badge": "4-Star Riverside Cottage Resort",
        "price": 8000.0,
        "rating": 4.6,
        "reviews": 230,
        "official_website": "https://countryinn.in/",
        "image": "https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi riverfront parking activity",
        "amenities_list": [
            "Unique Tree Top Cottages",
            "Riverside Promenade",
            "Swimming Pool",
            "Multi-Cuisine Flavours",
            "Ayurvedic Spa Therapies"
        ],
        "description": "Famous for its charming tree-top cottages and expansive riverside lawns in Dhikuli, Country Inn Tarika delivers family-centric luxury, open swimming pool, Ayurvedic rejuvenation, and wildlife excursions.",
        "rooms": [
            "Tree Top Cottage",
            "Luxury Cottage",
            "Deluxe Room",
            "Superior Room"
        ]
    },
    {
        "id": 21,
        "name": "The Golden Tusk",
        "slug": "the-golden-tusk",
        "zone": "dhela",
        "zone_label": "Dhela / Jhirna, Corbett",
        "category": "luxury",
        "tier_badge": "5-Star Forest Eco-Resort",
        "price": 12500.0,
        "rating": 4.8,
        "reviews": 345,
        "official_website": "https://thegoldentusk.com/",
        "image": "https://images.unsplash.com/photo-1578683010236-d716f9a3f461?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi parking activity",
        "amenities_list": [
            "Luxury Glamping Tents",
            "Dual Swimming Pools",
            "The Golden Flower Spa",
            "Golden Forest Fine Dining",
            "Forest Cycling Trails"
        ],
        "description": "Set amidst 10 acres of landscaped greenery on the Dhela river banks close to Jhirna and Dhela safari gates, featuring luxury tents, nature suites, dual swimming pools, and customized wildlife trails.",
        "rooms": [
            "Nature View",
            "Forest View",
            "Villa",
            "Suite",
            "Luxury Tent"
        ]
    },
    {
        "id": 22,
        "name": "j\u00fcSTa Lazy Haven Corbett",
        "slug": "justa-lazy-haven-corbett",
        "zone": "bijrani",
        "zone_label": "Bijrani Zone / Chhoi, Corbett",
        "category": "luxury",
        "tier_badge": "5-Star Boutique Wilderness Retreat",
        "price": 11500.0,
        "rating": 4.8,
        "reviews": 160,
        "official_website": "https://www.justahotels.com/corbett-resorts/",
        "image": "https://images.unsplash.com/photo-1582719508461-905c673771fd?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi parking activity",
        "amenities_list": [
            "Art-Inspired Modern Suites",
            "Central Swimming Pool",
            "Sabor Artisan Cuisine",
            "Signature Spa Care",
            "Private Forest Decks"
        ],
        "description": "An exquisite boutique haven blending artistic architecture with wilderness serenity, offering handcrafted luxury interiors, Sabor fine dining, lush gardens, outdoor pool, and proximity to Bijrani safari gate.",
        "rooms": [
            "Superior",
            "Deluxe",
            "Suite"
        ]
    },
    {
        "id": 23,
        "name": "Shervani Pebbles & Pines",
        "slug": "shervani-pebbles-pines",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Jim Corbett",
        "category": "premium",
        "tier_badge": "4-Star Boutique Forest Haven",
        "price": 7500.0,
        "rating": 4.6,
        "reviews": 140,
        "official_website": "https://www.shervanihotels.com/shervani-pebbles-pines-corbett/",
        "image": "https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi parking activity",
        "amenities_list": [
            "Pine & Sal Woodland Setting",
            "Swimming Pool",
            "Pebbles Multi-Cuisine",
            "Relaxation Therapy",
            "Evening Campfire"
        ],
        "description": "A tranquil boutique retreat in Dhikuli surrounded by pine trees and pebbles, featuring tasteful rooms, relaxing pool, delectable dining, and easy access to both Bijrani and Dhikala safari zones.",
        "rooms": [
            "Deluxe",
            "Superior",
            "Suite"
        ]
    },
    {
        "id": 24,
        "name": "Sterling Corbett",
        "slug": "sterling-corbett",
        "zone": "marchula",
        "zone_label": "Marchula / Ramganga, Corbett",
        "category": "premium",
        "tier_badge": "4-Star Riverview Leisure Resort",
        "price": 7200.0,
        "rating": 4.5,
        "reviews": 295,
        "official_website": "https://www.sterlingholidays.com/resorts-hotels/corbett",
        "image": "https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi riverfront parking activity",
        "amenities_list": [
            "Panoramic River Valley Views",
            "Outdoor Swimming Pool",
            "Machan Multi-Cuisine",
            "Subuthi Spa",
            "Holiday Activity Centre"
        ],
        "description": "Overlooking the meandering Ramganga River with breathtaking views of the Shivalik hills, Sterling Corbett offers classic rooms, spacious suites, multi-cuisine dining, swimming pool, and activity hubs.",
        "rooms": [
            "Classic Room",
            "Premier Room",
            "Privilege Suite"
        ]
    },
    {
        "id": 25,
        "name": "Silvanza Resort",
        "slug": "silvanza-resort",
        "zone": "ramnagar",
        "zone_label": "Bailparao / Ramnagar, Corbett",
        "category": "mid",
        "tier_badge": "Modern Comfort Eco-Resort",
        "price": 5000.0,
        "rating": 4.5,
        "reviews": 110,
        "official_website": "https://www.silvanzaresort.com/",
        "image": "https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool restaurant wifi parking activity",
        "amenities_list": [
            "Large Swimming Pool",
            "Flavors Multi-Cuisine Diner",
            "Lush Green Party Lawns",
            "High-Speed Wi-Fi",
            "Spacious Secure Parking"
        ],
        "description": "A modern resort surrounded by lush farmland and orchard groves in Bailparao near Ramnagar, offering comfortable family suites, sprawling green lawns, outdoor swimming pool, and safari booking desks.",
        "rooms": [
            "Deluxe",
            "Executive",
            "Family Suite"
        ]
    },
    {
        "id": 26,
        "name": "Sterling Corbett Quinta",
        "slug": "sterling-corbett-quinta",
        "zone": "dhikuli",
        "zone_label": "Dhikuli / Garjiya, Corbett",
        "category": "premium",
        "tier_badge": "4-Star Forest-Fringe Haven",
        "price": 7000.0,
        "rating": 4.5,
        "reviews": 155,
        "official_website": "https://www.sterlingholidays.com/resorts-hotels/corbett",
        "image": "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi parking activity",
        "amenities_list": [
            "Outdoor Swimming Pool",
            "Quinta All-Day Diner",
            "Scenic Garden Lawns",
            "Safari Booking Desk",
            "Evening Bonfire Gatherings"
        ],
        "description": "Nestled along the Dhikuli forest perimeter, Sterling Quinta brings warm hospitality, expansive lawns, swimming pool, fine local and continental gastronomy, and quick access to Corbett National Park gates.",
        "rooms": [
            "Classic Room",
            "Premier Room",
            "Privilege Suite"
        ]
    },
    {
        "id": 27,
        "name": "Aura by Xperience Corbett",
        "slug": "aura-by-xperience-corbett",
        "zone": "dhikuli",
        "zone_label": "Dhikuli, Corbett",
        "category": "mid",
        "tier_badge": "Boutique Riverside Getaway",
        "price": 4600.0,
        "rating": 4.4,
        "reviews": 92,
        "official_website": "https://aurabyxperience.com/",
        "image": "https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool restaurant wifi parking activity",
        "amenities_list": [
            "Swimming Pool",
            "Multi-Cuisine Cafe",
            "Free High-Speed Wi-Fi",
            "Garden Sit-outs",
            "Jeep Safari Assistance"
        ],
        "description": "A refreshing boutique experience in Dhikuli offering stylish modern rooms, prompt service, sparkling swimming pool, multi-cuisine dining, and friendly guidance for jungle safaris.",
        "rooms": [
            "Deluxe Room",
            "Super Deluxe",
            "Executive Room"
        ]
    },
    {
        "id": 28,
        "name": "The Cloyster Resort & Spa",
        "slug": "the-cloyster-resort-spa",
        "zone": "dhela",
        "zone_label": "Sawaldey / Dhela, Corbett",
        "category": "premium",
        "tier_badge": "4-Star Wellness & Safari Retreat",
        "price": 6500.0,
        "rating": 4.5,
        "reviews": 148,
        "official_website": "https://thecloysterresort.in/",
        "image": "https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi parking activity",
        "amenities_list": [
            "The Cloyster Wellness Spa",
            "Swimming Pool with Sun Deck",
            "Forest View Dining Hall",
            "Landscaped Botanical Gardens",
            "Evening Campfire & Music"
        ],
        "description": "Located in Sawaldey adjacent to the Dhela safari corridor, The Cloyster offers serene botanical settings, rejuvenating spa treatments, family suites, and seamless safari transfers.",
        "rooms": [
            "Deluxe",
            "Luxury",
            "Family Suite"
        ]
    },
    {
        "id": 29,
        "name": "Anantum Gateway Resorts & Spa",
        "slug": "anantum-gateway-resorts-spa",
        "zone": "pawalgarh",
        "zone_label": "Pawalgarh / Bailparao, Corbett",
        "category": "luxury",
        "tier_badge": "5-Star Luxury Destination Resort",
        "price": 14500.0,
        "rating": 4.8,
        "reviews": 320,
        "official_website": "https://anantumgatewayresorts.com/",
        "image": "https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?auto=format&fit=crop&w=800&q=80",
        "amenities": "pool spa restaurant wifi parking activity",
        "amenities_list": [
            "Private Pool Villas",
            "Anantum Rejuvenation Spa",
            "Grand Multi-Cuisine Banquets",
            "Massive Wedding Lawns",
            "Indoor & Outdoor Sports Arena"
        ],
        "description": "Spread across expansive acres against the Pawalgarh forest backdrop, Anantum Gateway boasts private pool villas, grand ballrooms, luxury spa therapies, children's recreation zones, and royal hospitality.",
        "rooms": [
            "Deluxe Room",
            "Luxury Cottage",
            "Pool Villa"
        ]
    },
    {
        "id": 30,
        "name": "Dhikala Forest Rest House",
        "slug": "dhikala-forest-rest-house",
        "zone": "dhikala",
        "zone_label": "Dhikala Core Zone, Corbett Tiger Reserve",
        "category": "premium",
        "tier_badge": "Govt Core Forest Heritage Lodge",
        "price": 6500.0,
        "rating": 4.9,
        "reviews": 560,
        "official_website": "https://www.corbettonline.uk.gov.in/",
        "image": "https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&w=800&q=80",
        "amenities": "restaurant riverfront activity",
        "amenities_list": [
            "Direct Core Tiger Reserve Access",
            "Ramganga Reservoir Watchtower",
            "KMVN Forest Canteen Dining",
            "Exclusive Core Zone Gypsy Safaris",
            "Historic 1890s Colonial Heritage"
        ],
        "description": "The iconic heart of Jim Corbett Tiger Reserve, Dhikala FRH offers rare deep-forest night stays overlooking the Ramganga reservoir with immediate access to raw wildlife activity and grasslands.",
        "rooms": [
            "Forest Rest House Room",
            "Dormitory Bed",
            "Hutment Room"
        ]
    }
],
    rooms: [
    {
        "id": 1,
        "hotel_id": 1,
        "hotel_name": "Paatlidun Safari Lodge",
        "name": "Bush Cottage",
        "pax": "2 Adults + 1 Child",
        "price": 24000.0,
        "description": "Bush Cottage at Paatlidun Safari Lodge with scenic jungle/valley views."
    },
    {
        "id": 2,
        "hotel_id": 1,
        "hotel_name": "Paatlidun Safari Lodge",
        "name": "Luxury Cottage",
        "pax": "2 Adults + 1 Child",
        "price": 24000.0,
        "description": "Luxury Cottage at Paatlidun Safari Lodge with scenic jungle/valley views."
    },
    {
        "id": 3,
        "hotel_id": 1,
        "hotel_name": "Paatlidun Safari Lodge",
        "name": "Premium Cottage",
        "pax": "2 Adults + 1 Child",
        "price": 24000.0,
        "description": "Premium Cottage at Paatlidun Safari Lodge with scenic jungle/valley views."
    },
    {
        "id": 4,
        "hotel_id": 2,
        "hotel_name": "Saraca Resort Corbett (Lebua)",
        "name": "Premium Room",
        "pax": "2 Adults + 1 Child",
        "price": 18500.0,
        "description": "Premium Room at Saraca Resort Corbett (Lebua) with scenic jungle/valley views."
    },
    {
        "id": 5,
        "hotel_id": 2,
        "hotel_name": "Saraca Resort Corbett (Lebua)",
        "name": "Family Cottage",
        "pax": "2 Adults + 1 Child",
        "price": 18500.0,
        "description": "Family Cottage at Saraca Resort Corbett (Lebua) with scenic jungle/valley views."
    },
    {
        "id": 6,
        "hotel_id": 2,
        "hotel_name": "Saraca Resort Corbett (Lebua)",
        "name": "Premium Suite One Bedroom",
        "pax": "2 Adults + 1 Child",
        "price": 18500.0,
        "description": "Premium Suite One Bedroom at Saraca Resort Corbett (Lebua) with scenic jungle/valley views."
    },
    {
        "id": 7,
        "hotel_id": 2,
        "hotel_name": "Saraca Resort Corbett (Lebua)",
        "name": "Two Bedroom Forest View",
        "pax": "2 Adults + 1 Child",
        "price": 18500.0,
        "description": "Two Bedroom Forest View at Saraca Resort Corbett (Lebua) with scenic jungle/valley views."
    },
    {
        "id": 8,
        "hotel_id": 2,
        "hotel_name": "Saraca Resort Corbett (Lebua)",
        "name": "Two Bedroom Pond View",
        "pax": "2 Adults + 1 Child",
        "price": 18500.0,
        "description": "Two Bedroom Pond View at Saraca Resort Corbett (Lebua) with scenic jungle/valley views."
    },
    {
        "id": 9,
        "hotel_id": 3,
        "hotel_name": "Namah Resort Corbett",
        "name": "Superior",
        "pax": "2 Adults + 1 Child",
        "price": 14500.0,
        "description": "Superior at Namah Resort Corbett with scenic jungle/valley views."
    },
    {
        "id": 10,
        "hotel_id": 3,
        "hotel_name": "Namah Resort Corbett",
        "name": "Premium",
        "pax": "2 Adults + 1 Child",
        "price": 14500.0,
        "description": "Premium at Namah Resort Corbett with scenic jungle/valley views."
    },
    {
        "id": 11,
        "hotel_id": 4,
        "hotel_name": "The Corbett Hideaway by Leisure",
        "name": "Deluxe",
        "pax": "2 Adults + 1 Child",
        "price": 11000.0,
        "description": "Deluxe at The Corbett Hideaway by Leisure with scenic jungle/valley views."
    },
    {
        "id": 12,
        "hotel_id": 4,
        "hotel_name": "The Corbett Hideaway by Leisure",
        "name": "Superior",
        "pax": "2 Adults + 1 Child",
        "price": 11000.0,
        "description": "Superior at The Corbett Hideaway by Leisure with scenic jungle/valley views."
    },
    {
        "id": 13,
        "hotel_id": 5,
        "hotel_name": "The Riverview Retreat",
        "name": "Deluxe",
        "pax": "2 Adults + 1 Child",
        "price": 9500.0,
        "description": "Deluxe at The Riverview Retreat with scenic jungle/valley views."
    },
    {
        "id": 14,
        "hotel_id": 5,
        "hotel_name": "The Riverview Retreat",
        "name": "Deluxe Cottage",
        "pax": "2 Adults + 1 Child",
        "price": 9500.0,
        "description": "Deluxe Cottage at The Riverview Retreat with scenic jungle/valley views."
    },
    {
        "id": 15,
        "hotel_id": 5,
        "hotel_name": "The Riverview Retreat",
        "name": "Superior",
        "pax": "2 Adults + 1 Child",
        "price": 9500.0,
        "description": "Superior at The Riverview Retreat with scenic jungle/valley views."
    },
    {
        "id": 16,
        "hotel_id": 5,
        "hotel_name": "The Riverview Retreat",
        "name": "Duplex",
        "pax": "2 Adults + 1 Child",
        "price": 9500.0,
        "description": "Duplex at The Riverview Retreat with scenic jungle/valley views."
    },
    {
        "id": 17,
        "hotel_id": 5,
        "hotel_name": "The Riverview Retreat",
        "name": "Suite",
        "pax": "2 Adults + 1 Child",
        "price": 9500.0,
        "description": "Suite at The Riverview Retreat with scenic jungle/valley views."
    },
    {
        "id": 18,
        "hotel_id": 5,
        "hotel_name": "The Riverview Retreat",
        "name": "Premium",
        "pax": "2 Adults + 1 Child",
        "price": 9500.0,
        "description": "Premium at The Riverview Retreat with scenic jungle/valley views."
    },
    {
        "id": 19,
        "hotel_id": 6,
        "hotel_name": "Bellmont Caves Resort",
        "name": "Deluxe",
        "pax": "2 Adults + 1 Child",
        "price": 6000.0,
        "description": "Deluxe at Bellmont Caves Resort with scenic jungle/valley views."
    },
    {
        "id": 20,
        "hotel_id": 6,
        "hotel_name": "Bellmont Caves Resort",
        "name": "Executive",
        "pax": "2 Adults + 1 Child",
        "price": 6000.0,
        "description": "Executive at Bellmont Caves Resort with scenic jungle/valley views."
    },
    {
        "id": 21,
        "hotel_id": 7,
        "hotel_name": "ZANA Resort Jim Corbett",
        "name": "Classic",
        "pax": "2 Adults + 1 Child",
        "price": 17000.0,
        "description": "Classic at ZANA Resort Jim Corbett with scenic jungle/valley views."
    },
    {
        "id": 22,
        "hotel_id": 7,
        "hotel_name": "ZANA Resort Jim Corbett",
        "name": "Riverview",
        "pax": "2 Adults + 1 Child",
        "price": 17000.0,
        "description": "Riverview at ZANA Resort Jim Corbett with scenic jungle/valley views."
    },
    {
        "id": 23,
        "hotel_id": 7,
        "hotel_name": "ZANA Resort Jim Corbett",
        "name": "Tiger Tales Suite",
        "pax": "2 Adults + 1 Child",
        "price": 17000.0,
        "description": "Tiger Tales Suite at ZANA Resort Jim Corbett with scenic jungle/valley views."
    },
    {
        "id": 24,
        "hotel_id": 7,
        "hotel_name": "ZANA Resort Jim Corbett",
        "name": "Luxury Cottage with Fireplace",
        "pax": "2 Adults + 1 Child",
        "price": 17000.0,
        "description": "Luxury Cottage with Fireplace at ZANA Resort Jim Corbett with scenic jungle/valley views."
    },
    {
        "id": 25,
        "hotel_id": 8,
        "hotel_name": "Lemon Tree Premier Corbett",
        "name": "Double",
        "pax": "2 Adults + 1 Child",
        "price": 10500.0,
        "description": "Double at Lemon Tree Premier Corbett with scenic jungle/valley views."
    },
    {
        "id": 26,
        "hotel_id": 9,
        "hotel_name": "The Solluna Resort",
        "name": "Superior",
        "pax": "2 Adults + 1 Child",
        "price": 10500.0,
        "description": "Superior at The Solluna Resort with scenic jungle/valley views."
    },
    {
        "id": 27,
        "hotel_id": 9,
        "hotel_name": "The Solluna Resort",
        "name": "Deluxe",
        "pax": "2 Adults + 1 Child",
        "price": 10500.0,
        "description": "Deluxe at The Solluna Resort with scenic jungle/valley views."
    },
    {
        "id": 28,
        "hotel_id": 9,
        "hotel_name": "The Solluna Resort",
        "name": "Premier",
        "pax": "2 Adults + 1 Child",
        "price": 10500.0,
        "description": "Premier at The Solluna Resort with scenic jungle/valley views."
    },
    {
        "id": 29,
        "hotel_id": 10,
        "hotel_name": "Club Mahindra Corbett",
        "name": "Superior",
        "pax": "2 Adults + 1 Child",
        "price": 8500.0,
        "description": "Superior at Club Mahindra Corbett with scenic jungle/valley views."
    },
    {
        "id": 30,
        "hotel_id": 11,
        "hotel_name": "La Pearle River Resort",
        "name": "Std",
        "pax": "2 Adults + 1 Child",
        "price": 4500.0,
        "description": "Std at La Pearle River Resort with scenic jungle/valley views."
    },
    {
        "id": 31,
        "hotel_id": 12,
        "hotel_name": "Mango Bloom River Resort",
        "name": "Std",
        "pax": "2 Adults + 1 Child",
        "price": 4800.0,
        "description": "Std at Mango Bloom River Resort with scenic jungle/valley views."
    },
    {
        "id": 32,
        "hotel_id": 13,
        "hotel_name": "Excel Resort Corbett",
        "name": "Std",
        "pax": "2 Adults + 1 Child",
        "price": 3500.0,
        "description": "Std at Excel Resort Corbett with scenic jungle/valley views."
    },
    {
        "id": 33,
        "hotel_id": 14,
        "hotel_name": "Corbett River Creek Resort & Spa",
        "name": "Creek",
        "pax": "2 Adults + 1 Child",
        "price": 9000.0,
        "description": "Creek at Corbett River Creek Resort & Spa with scenic jungle/valley views."
    },
    {
        "id": 34,
        "hotel_id": 14,
        "hotel_name": "Corbett River Creek Resort & Spa",
        "name": "Premium",
        "pax": "2 Adults + 1 Child",
        "price": 9000.0,
        "description": "Premium at Corbett River Creek Resort & Spa with scenic jungle/valley views."
    },
    {
        "id": 35,
        "hotel_id": 14,
        "hotel_name": "Corbett River Creek Resort & Spa",
        "name": "Creek Luxury",
        "pax": "2 Adults + 1 Child",
        "price": 9000.0,
        "description": "Creek Luxury at Corbett River Creek Resort & Spa with scenic jungle/valley views."
    },
    {
        "id": 36,
        "hotel_id": 15,
        "hotel_name": "Corbett The Baagh Spa & Resort",
        "name": "Jungle Cat",
        "pax": "2 Adults + 1 Child",
        "price": 13500.0,
        "description": "Jungle Cat at Corbett The Baagh Spa & Resort with scenic jungle/valley views."
    },
    {
        "id": 37,
        "hotel_id": 15,
        "hotel_name": "Corbett The Baagh Spa & Resort",
        "name": "Spotted Cat",
        "pax": "2 Adults + 1 Child",
        "price": 13500.0,
        "description": "Spotted Cat at Corbett The Baagh Spa & Resort with scenic jungle/valley views."
    },
    {
        "id": 38,
        "hotel_id": 15,
        "hotel_name": "Corbett The Baagh Spa & Resort",
        "name": "Leopard Cat",
        "pax": "2 Adults + 1 Child",
        "price": 13500.0,
        "description": "Leopard Cat at Corbett The Baagh Spa & Resort with scenic jungle/valley views."
    },
    {
        "id": 39,
        "hotel_id": 15,
        "hotel_name": "Corbett The Baagh Spa & Resort",
        "name": "Leopard Suite",
        "pax": "2 Adults + 1 Child",
        "price": 13500.0,
        "description": "Leopard Suite at Corbett The Baagh Spa & Resort with scenic jungle/valley views."
    },
    {
        "id": 40,
        "hotel_id": 16,
        "hotel_name": "Bela Monde Riverside Resort",
        "name": "Std",
        "pax": "2 Adults + 1 Child",
        "price": 8000.0,
        "description": "Std at Bela Monde Riverside Resort with scenic jungle/valley views."
    },
    {
        "id": 41,
        "hotel_id": 16,
        "hotel_name": "Bela Monde Riverside Resort",
        "name": "Deluxe",
        "pax": "2 Adults + 1 Child",
        "price": 8000.0,
        "description": "Deluxe at Bela Monde Riverside Resort with scenic jungle/valley views."
    },
    {
        "id": 42,
        "hotel_id": 17,
        "hotel_name": "Tarangi Resort & Spa",
        "name": "Sarang",
        "pax": "2 Adults + 1 Child",
        "price": 16000.0,
        "description": "Sarang at Tarangi Resort & Spa with scenic jungle/valley views."
    },
    {
        "id": 43,
        "hotel_id": 17,
        "hotel_name": "Tarangi Resort & Spa",
        "name": "Luxury Cottage",
        "pax": "2 Adults + 1 Child",
        "price": 16000.0,
        "description": "Luxury Cottage at Tarangi Resort & Spa with scenic jungle/valley views."
    },
    {
        "id": 44,
        "hotel_id": 17,
        "hotel_name": "Tarangi Resort & Spa",
        "name": "River View Cottage",
        "pax": "2 Adults + 1 Child",
        "price": 16000.0,
        "description": "River View Cottage at Tarangi Resort & Spa with scenic jungle/valley views."
    },
    {
        "id": 45,
        "hotel_id": 17,
        "hotel_name": "Tarangi Resort & Spa",
        "name": "Jal Pool Villa",
        "pax": "2 Adults + 1 Child",
        "price": 16000.0,
        "description": "Jal Pool Villa at Tarangi Resort & Spa with scenic jungle/valley views."
    },
    {
        "id": 46,
        "hotel_id": 17,
        "hotel_name": "Tarangi Resort & Spa",
        "name": "Whispering 4 Bedroom",
        "pax": "2 Adults + 1 Child",
        "price": 16000.0,
        "description": "Whispering 4 Bedroom at Tarangi Resort & Spa with scenic jungle/valley views."
    },
    {
        "id": 47,
        "hotel_id": 18,
        "hotel_name": "Tarangi Ramganga Resort",
        "name": "Deluxe Cottage",
        "pax": "2 Adults + 1 Child",
        "price": 9500.0,
        "description": "Deluxe Cottage at Tarangi Ramganga Resort with scenic jungle/valley views."
    },
    {
        "id": 48,
        "hotel_id": 18,
        "hotel_name": "Tarangi Ramganga Resort",
        "name": "Super Dlx Cottage",
        "pax": "2 Adults + 1 Child",
        "price": 9500.0,
        "description": "Super Dlx Cottage at Tarangi Ramganga Resort with scenic jungle/valley views."
    },
    {
        "id": 49,
        "hotel_id": 18,
        "hotel_name": "Tarangi Ramganga Resort",
        "name": "Ramganga Suite",
        "pax": "2 Adults + 1 Child",
        "price": 9500.0,
        "description": "Ramganga Suite at Tarangi Ramganga Resort with scenic jungle/valley views."
    },
    {
        "id": 50,
        "hotel_id": 18,
        "hotel_name": "Tarangi Ramganga Resort",
        "name": "Pine Cottage",
        "pax": "2 Adults + 1 Child",
        "price": 9500.0,
        "description": "Pine Cottage at Tarangi Ramganga Resort with scenic jungle/valley views."
    },
    {
        "id": 51,
        "hotel_id": 18,
        "hotel_name": "Tarangi Ramganga Resort",
        "name": "Duplex Cottage",
        "pax": "2 Adults + 1 Child",
        "price": 9500.0,
        "description": "Duplex Cottage at Tarangi Ramganga Resort with scenic jungle/valley views."
    },
    {
        "id": 52,
        "hotel_id": 18,
        "hotel_name": "Tarangi Ramganga Resort",
        "name": "River Facing Family Cottage",
        "pax": "2 Adults + 1 Child",
        "price": 9500.0,
        "description": "River Facing Family Cottage at Tarangi Ramganga Resort with scenic jungle/valley views."
    },
    {
        "id": 53,
        "hotel_id": 19,
        "hotel_name": "Alaya Resort",
        "name": "Double",
        "pax": "2 Adults + 1 Child",
        "price": 5500.0,
        "description": "Double at Alaya Resort with scenic jungle/valley views."
    },
    {
        "id": 54,
        "hotel_id": 20,
        "hotel_name": "Country Inn Riverside Resort",
        "name": "Jungle View",
        "pax": "2 Adults + 1 Child",
        "price": 10000.0,
        "description": "Jungle View at Country Inn Riverside Resort with scenic jungle/valley views."
    },
    {
        "id": 55,
        "hotel_id": 20,
        "hotel_name": "Country Inn Riverside Resort",
        "name": "Jims Cottage",
        "pax": "2 Adults + 1 Child",
        "price": 10000.0,
        "description": "Jims Cottage at Country Inn Riverside Resort with scenic jungle/valley views."
    },
    {
        "id": 56,
        "hotel_id": 20,
        "hotel_name": "Country Inn Riverside Resort",
        "name": "Cottage with Terrace",
        "pax": "2 Adults + 1 Child",
        "price": 10000.0,
        "description": "Cottage with Terrace at Country Inn Riverside Resort with scenic jungle/valley views."
    },
    {
        "id": 57,
        "hotel_id": 20,
        "hotel_name": "Country Inn Riverside Resort",
        "name": "Cottage with Garden",
        "pax": "2 Adults + 1 Child",
        "price": 10000.0,
        "description": "Cottage with Garden at Country Inn Riverside Resort with scenic jungle/valley views."
    },
    {
        "id": 58,
        "hotel_id": 20,
        "hotel_name": "Country Inn Riverside Resort",
        "name": "Cottage with Plunge Pool",
        "pax": "2 Adults + 1 Child",
        "price": 10000.0,
        "description": "Cottage with Plunge Pool at Country Inn Riverside Resort with scenic jungle/valley views."
    },
    {
        "id": 59,
        "hotel_id": 21,
        "hotel_name": "The Golden Tusk",
        "name": "Garden Suite",
        "pax": "2 Adults + 1 Child",
        "price": 14000.0,
        "description": "Garden Suite at The Golden Tusk with scenic jungle/valley views."
    },
    {
        "id": 60,
        "hotel_id": 21,
        "hotel_name": "The Golden Tusk",
        "name": "Nature View / Luxury Tents",
        "pax": "2 Adults + 1 Child",
        "price": 14000.0,
        "description": "Nature View / Luxury Tents at The Golden Tusk with scenic jungle/valley views."
    },
    {
        "id": 61,
        "hotel_id": 21,
        "hotel_name": "The Golden Tusk",
        "name": "Pool View Suite",
        "pax": "2 Adults + 1 Child",
        "price": 14000.0,
        "description": "Pool View Suite at The Golden Tusk with scenic jungle/valley views."
    },
    {
        "id": 62,
        "hotel_id": 21,
        "hotel_name": "The Golden Tusk",
        "name": "Corbett Suite",
        "pax": "2 Adults + 1 Child",
        "price": 14000.0,
        "description": "Corbett Suite at The Golden Tusk with scenic jungle/valley views."
    },
    {
        "id": 63,
        "hotel_id": 21,
        "hotel_name": "The Golden Tusk",
        "name": "Villa",
        "pax": "2 Adults + 1 Child",
        "price": 14000.0,
        "description": "Villa at The Golden Tusk with scenic jungle/valley views."
    },
    {
        "id": 64,
        "hotel_id": 21,
        "hotel_name": "The Golden Tusk",
        "name": "Villa Grande",
        "pax": "2 Adults + 1 Child",
        "price": 14000.0,
        "description": "Villa Grande at The Golden Tusk with scenic jungle/valley views."
    },
    {
        "id": 65,
        "hotel_id": 21,
        "hotel_name": "The Golden Tusk",
        "name": "Tusk Suite",
        "pax": "2 Adults + 1 Child",
        "price": 14000.0,
        "description": "Tusk Suite at The Golden Tusk with scenic jungle/valley views."
    },
    {
        "id": 66,
        "hotel_id": 21,
        "hotel_name": "The Golden Tusk",
        "name": "Tiger Suite (4 Pax)",
        "pax": "2 Adults + 1 Child",
        "price": 14000.0,
        "description": "Tiger Suite (4 Pax) at The Golden Tusk with scenic jungle/valley views."
    },
    {
        "id": 67,
        "hotel_id": 22,
        "hotel_name": "j\u00fcSTa Lazy Haven Corbett",
        "name": "Superior with Balcony",
        "pax": "2 Adults + 1 Child",
        "price": 7500.0,
        "description": "Superior with Balcony at j\u00fcSTa Lazy Haven Corbett with scenic jungle/valley views."
    },
    {
        "id": 68,
        "hotel_id": 22,
        "hotel_name": "j\u00fcSTa Lazy Haven Corbett",
        "name": "Deluxe with Balcony",
        "pax": "2 Adults + 1 Child",
        "price": 7500.0,
        "description": "Deluxe with Balcony at j\u00fcSTa Lazy Haven Corbett with scenic jungle/valley views."
    },
    {
        "id": 69,
        "hotel_id": 23,
        "hotel_name": "Shervani Pebbles & Pines",
        "name": "Deluxe Garden View",
        "pax": "2 Adults + 1 Child",
        "price": 8500.0,
        "description": "Deluxe Garden View at Shervani Pebbles & Pines with scenic jungle/valley views."
    },
    {
        "id": 70,
        "hotel_id": 23,
        "hotel_name": "Shervani Pebbles & Pines",
        "name": "Premium Garden",
        "pax": "2 Adults + 1 Child",
        "price": 8500.0,
        "description": "Premium Garden at Shervani Pebbles & Pines with scenic jungle/valley views."
    },
    {
        "id": 71,
        "hotel_id": 23,
        "hotel_name": "Shervani Pebbles & Pines",
        "name": "Superior with Jacuzzi",
        "pax": "2 Adults + 1 Child",
        "price": 8500.0,
        "description": "Superior with Jacuzzi at Shervani Pebbles & Pines with scenic jungle/valley views."
    },
    {
        "id": 72,
        "hotel_id": 24,
        "hotel_name": "Sterling Corbett",
        "name": "Classic",
        "pax": "2 Adults + 1 Child",
        "price": 8000.0,
        "description": "Classic at Sterling Corbett with scenic jungle/valley views."
    },
    {
        "id": 73,
        "hotel_id": 24,
        "hotel_name": "Sterling Corbett",
        "name": "Premier",
        "pax": "2 Adults + 1 Child",
        "price": 8000.0,
        "description": "Premier at Sterling Corbett with scenic jungle/valley views."
    },
    {
        "id": 74,
        "hotel_id": 25,
        "hotel_name": "Silvanza Resort",
        "name": "Origin",
        "pax": "2 Adults + 1 Child",
        "price": 4200.0,
        "description": "Origin at Silvanza Resort with scenic jungle/valley views."
    },
    {
        "id": 75,
        "hotel_id": 25,
        "hotel_name": "Silvanza Resort",
        "name": "Breeze",
        "pax": "2 Adults + 1 Child",
        "price": 4200.0,
        "description": "Breeze at Silvanza Resort with scenic jungle/valley views."
    },
    {
        "id": 76,
        "hotel_id": 26,
        "hotel_name": "Sterling Corbett Quinta",
        "name": "Classic",
        "pax": "2 Adults + 1 Child",
        "price": 7800.0,
        "description": "Classic at Sterling Corbett Quinta with scenic jungle/valley views."
    },
    {
        "id": 77,
        "hotel_id": 26,
        "hotel_name": "Sterling Corbett Quinta",
        "name": "Premier",
        "pax": "2 Adults + 1 Child",
        "price": 7800.0,
        "description": "Premier at Sterling Corbett Quinta with scenic jungle/valley views."
    },
    {
        "id": 78,
        "hotel_id": 27,
        "hotel_name": "Aura by Xperience Corbett",
        "name": "Deluxe Cottage",
        "pax": "2 Adults + 1 Child",
        "price": 9200.0,
        "description": "Deluxe Cottage at Aura by Xperience Corbett with scenic jungle/valley views."
    },
    {
        "id": 79,
        "hotel_id": 27,
        "hotel_name": "Aura by Xperience Corbett",
        "name": "Mud Cottage",
        "pax": "2 Adults + 1 Child",
        "price": 9200.0,
        "description": "Mud Cottage at Aura by Xperience Corbett with scenic jungle/valley views."
    },
    {
        "id": 80,
        "hotel_id": 27,
        "hotel_name": "Aura by Xperience Corbett",
        "name": "Premium",
        "pax": "2 Adults + 1 Child",
        "price": 9200.0,
        "description": "Premium at Aura by Xperience Corbett with scenic jungle/valley views."
    },
    {
        "id": 81,
        "hotel_id": 27,
        "hotel_name": "Aura by Xperience Corbett",
        "name": "Elegant Plunge Pool",
        "pax": "2 Adults + 1 Child",
        "price": 9200.0,
        "description": "Elegant Plunge Pool at Aura by Xperience Corbett with scenic jungle/valley views."
    },
    {
        "id": 82,
        "hotel_id": 27,
        "hotel_name": "Aura by Xperience Corbett",
        "name": "Family Villa 4 Pax",
        "pax": "2 Adults + 1 Child",
        "price": 9200.0,
        "description": "Family Villa 4 Pax at Aura by Xperience Corbett with scenic jungle/valley views."
    },
    {
        "id": 83,
        "hotel_id": 28,
        "hotel_name": "The Cloyster Resort & Spa",
        "name": "Deluxe Garden View",
        "pax": "2 Adults + 1 Child",
        "price": 8200.0,
        "description": "Deluxe Garden View at The Cloyster Resort & Spa with scenic jungle/valley views."
    },
    {
        "id": 84,
        "hotel_id": 28,
        "hotel_name": "The Cloyster Resort & Spa",
        "name": "Premium Jungle View",
        "pax": "2 Adults + 1 Child",
        "price": 8200.0,
        "description": "Premium Jungle View at The Cloyster Resort & Spa with scenic jungle/valley views."
    },
    {
        "id": 85,
        "hotel_id": 28,
        "hotel_name": "The Cloyster Resort & Spa",
        "name": "Luxury Hill Facing",
        "pax": "2 Adults + 1 Child",
        "price": 8200.0,
        "description": "Luxury Hill Facing at The Cloyster Resort & Spa with scenic jungle/valley views."
    },
    {
        "id": 86,
        "hotel_id": 28,
        "hotel_name": "The Cloyster Resort & Spa",
        "name": "Pool View",
        "pax": "2 Adults + 1 Child",
        "price": 8200.0,
        "description": "Pool View at The Cloyster Resort & Spa with scenic jungle/valley views."
    },
    {
        "id": 87,
        "hotel_id": 29,
        "hotel_name": "Anantum Gateway Resorts & Spa",
        "name": "Deluxe",
        "pax": "2 Adults + 1 Child",
        "price": 12500.0,
        "description": "Deluxe at Anantum Gateway Resorts & Spa with scenic jungle/valley views."
    },
    {
        "id": 88,
        "hotel_id": 29,
        "hotel_name": "Anantum Gateway Resorts & Spa",
        "name": "Executive",
        "pax": "2 Adults + 1 Child",
        "price": 12500.0,
        "description": "Executive at Anantum Gateway Resorts & Spa with scenic jungle/valley views."
    },
    {
        "id": 89,
        "hotel_id": 29,
        "hotel_name": "Anantum Gateway Resorts & Spa",
        "name": "Plunge Pool Cottage",
        "pax": "2 Adults + 1 Child",
        "price": 12500.0,
        "description": "Plunge Pool Cottage at Anantum Gateway Resorts & Spa with scenic jungle/valley views."
    },
    {
        "id": 90,
        "hotel_id": 30,
        "hotel_name": "Dhikala Forest Rest House",
        "name": "Dhikala Forest Cabin",
        "pax": "2 Adults + 1 Child",
        "price": 5000.0,
        "description": "Dhikala Forest Cabin at Dhikala Forest Rest House with scenic jungle/valley views."
    },
    {
        "id": 91,
        "hotel_id": 30,
        "hotel_name": "Dhikala Forest Rest House",
        "name": "Hutment",
        "pax": "2 Adults + 1 Child",
        "price": 5000.0,
        "description": "Hutment at Dhikala Forest Rest House with scenic jungle/valley views."
    },
    {
        "id": 92,
        "hotel_id": 30,
        "hotel_name": "Dhikala Forest Rest House",
        "name": "New Forest Rest House Room",
        "pax": "2 Adults + 1 Child",
        "price": 5000.0,
        "description": "New Forest Rest House Room at Dhikala Forest Rest House with scenic jungle/valley views."
    }
],
    safaris: [
    {
        "id": 1,
        "name": "Dhikala Zone",
        "gate": "Dhangarhi Gate",
        "type": "Core",
        "morning": "06:00 AM - 09:30 AM",
        "evening": "03:00 PM - 06:30 PM",
        "gypsy": 6500.0,
        "canter": 2200.0,
        "max": 32,
        "season": "15 Nov - 15 June",
        "description": "The most famous core zone with panoramic Ramganga riverbed views and highest tiger density."
    },
    {
        "id": 2,
        "name": "Bijrani Zone",
        "gate": "Amdanda Gate",
        "type": "Core",
        "morning": "06:00 AM - 09:30 AM",
        "evening": "02:30 PM - 06:00 PM",
        "gypsy": 4500.0,
        "canter": 0.0,
        "max": 30,
        "season": "15 Oct - 30 June",
        "description": "Magnificent sal forests and open grasslands known for royal Bengal tiger encounters."
    },
    {
        "id": 3,
        "name": "Jhirna Zone",
        "gate": "Dhela Gate",
        "type": "Buffer/Core",
        "morning": "06:00 AM - 09:30 AM",
        "evening": "02:30 PM - 06:00 PM",
        "gypsy": 4500.0,
        "canter": 0.0,
        "max": 30,
        "season": "Open Round the Year",
        "description": "South boundary zone famous for sloth bears, wild elephants, and deer herds."
    },
    {
        "id": 4,
        "name": "Dhela Zone",
        "gate": "Dhela Gate",
        "type": "Eco-Tourism",
        "morning": "06:00 AM - 09:30 AM",
        "evening": "02:30 PM - 06:00 PM",
        "gypsy": 4200.0,
        "canter": 0.0,
        "max": 15,
        "season": "Open Round the Year",
        "description": "Rich mixed forest and water bodies ideal for bird watching and tiger sightings."
    },
    {
        "id": 5,
        "name": "Durga Devi Zone",
        "gate": "Durga Devi Gate",
        "type": "Hilly Core",
        "morning": "06:00 AM - 09:30 AM",
        "evening": "02:30 PM - 06:00 PM",
        "gypsy": 4800.0,
        "canter": 0.0,
        "max": 15,
        "season": "15 Nov - 15 June",
        "description": "Hilly terrain along Mandal River, paradise for birders and Mahseer fish watchers."
    },
    {
        "id": 6,
        "name": "Sitabani Zone",
        "gate": "Ramnagar Gate",
        "type": "Landscape",
        "morning": "06:00 AM - 09:30 AM",
        "evening": "02:30 PM - 06:00 PM",
        "gypsy": 4000.0,
        "canter": 0.0,
        "max": 50,
        "season": "Open Round the Year",
        "description": "Mythological forest buffer zone associated with Ramayana, rich in avian species."
    },
    {
        "id": 7,
        "name": "Garjiya Zone",
        "gate": "Garjiya Gate",
        "type": "Core",
        "morning": "06:00 AM - 09:30 AM",
        "evening": "02:30 PM - 06:00 PM",
        "gypsy": 4600.0,
        "canter": 0.0,
        "max": 30,
        "season": "15 Oct - 30 June",
        "description": "Scenic zone adjoining Bijrani, popular for rich grasslands and wildlife sightings."
    },
    {
        "id": 8,
        "name": "Phato Zone",
        "gate": "Maldhan Gate",
        "type": "Eco-Tourism",
        "morning": "06:00 AM - 09:30 AM",
        "evening": "02:30 PM - 06:00 PM",
        "gypsy": 4200.0,
        "canter": 0.0,
        "max": 30,
        "season": "Open Round the Year",
        "description": "Newest eco-tourism zone with treehouses and pristine woodlands."
    }
],
    tickets: [
    {
        "id": 1,
        "number": "HG-CORBETT-94821",
        "guest": "Vikramaditya Roy",
        "phone": "+91 98112 34567",
        "email": "vikram.roy@example.com",
        "date": "2026-10-18",
        "guests": "2 Adults",
        "service": "Hotel Lodge Stay",
        "hotel": "Paatlidun Safari Lodge",
        "room": "Bush Cottage",
        "status": "Confirmed"
    },
    {
        "id": 2,
        "number": "HG-CORBETT-77291",
        "guest": "Priya Kulkarni",
        "phone": "+91 98201 88290",
        "email": "priya.k@example.com",
        "date": "2026-11-04",
        "guests": "3 Adults",
        "service": "Hotel Lodge Stay",
        "hotel": "Tarangi Resort & Spa",
        "room": "Jal Pool Villa",
        "status": "New"
    },
    {
        "id": 3,
        "number": "HG-CORBETT-63104",
        "guest": "Dr. Amitava Ghosh",
        "phone": "+91 94330 19283",
        "email": "amitava.ghosh@hospital.org",
        "date": "2026-11-20",
        "guests": "2 Adults",
        "service": "Hotel Lodge Stay",
        "hotel": "The Golden Tusk",
        "room": "Pool View Suite",
        "status": "New"
    },
    {
        "id": 4,
        "number": "HG-CORBETT-51928",
        "guest": "Rohit Malhotra",
        "phone": "+91 98710 44556",
        "email": "rohit.m@delhi.com",
        "date": "2026-12-10",
        "guests": "4+ Adults",
        "service": "Hotel Lodge Stay",
        "hotel": "Saraca Resort Corbett (Lebua)",
        "room": "Two Bedroom Forest View",
        "status": "Confirmed"
    },
    {
        "id": 5,
        "number": "HG-CORBETT-43019",
        "guest": "Ananya Deshmukh",
        "phone": "+91 97654 32100",
        "email": "ananya.d@gmail.com",
        "date": "2026-12-28",
        "guests": "2 Adults",
        "service": "Hotel Lodge Stay",
        "hotel": "The Solluna Resort",
        "room": "Premier",
        "status": "New"
    }
],
    content: [
    {
        "id": 1,
        "key": "brand_header",
        "page": "global",
        "title": "Honeygold India - Corbett Initiative",
        "subtitle": "Domestic Tourism Initiative",
        "content": "Book forest resorts, reserve safaris, and arrange wilderness destination weddings in Jim Corbett National Park."
    },
    {
        "id": 2,
        "key": "hero_banner",
        "page": "index",
        "title": "Uncover the Wilderness of Jim Corbett",
        "subtitle": "India's Oldest & Most Prestigious Wildlife Sanctuary",
        "content": "Experience nature in its rawest form. Book luxury forest resorts, adventure river safaris, and host unforgettable wilderness weddings in Corbett's magical ecosystem."
    },
    {
        "id": 3,
        "key": "about_heritage",
        "page": "about",
        "title": "The Historic Journey of Hailey to Corbett",
        "subtitle": "Founded 1936 | Project Tiger 1973",
        "content": "Established in 1936 as Hailey National Park, Jim Corbett National Park stands as India's oldest wildlife reserve. Renamed in honor of legendary hunter-turned-conservationist Jim Corbett, it remains the crown jewel of tiger conservation."
    },
    {
        "id": 4,
        "key": "contact_srinagar",
        "page": "global",
        "title": "Srinagar Head Office",
        "subtitle": "Rather Complex, Top Floor, Near New Era School, RajBagh, Srinagar - 190008",
        "content": "Ph: 0194-2310736, 2310270 | Mobile: +91 9419045656"
    },
    {
        "id": 5,
        "key": "contact_delhi",
        "page": "global",
        "title": "New Delhi Corporate Office",
        "subtitle": "B1/36, Ashok Vihar Phase II, New Delhi - 110052",
        "content": "Ph: 011-47145656 | Toll Free: 1800 891 7626"
    }
]
};
