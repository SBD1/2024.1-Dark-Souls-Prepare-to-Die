INSERT INTO Class (nome, base_level, base_vit, base_dex, base_att, base_end, base_str, base_int, base_fai)
VALUES ('Thief', 6, 9, 14, 9, 11, 6, 9, 8);

INSERT INTO Class (nome, base_level, base_vit, base_dex, base_att, base_end, base_str, base_int, base_fai)
VALUES ('Warrior', 4, 11, 13 , 8, 12, 13, 9, 9);

INSERT INTO Class (nome, base_level, base_vit, base_dex, base_att, base_end, base_str, base_int, base_fai)
VALUES ('Knight', 5, 14, 11, 10, 10, 11, 9, 11);

INSERT INTO Class (nome, base_level, base_vit, base_att, base_end, base_str, base_dex, base_int, base_fai)
VALUES ('Wanderer', 3, 10, 11, 10, 11, 14, 11, 8);

INSERT INTO Class (nome, base_level, base_vit, base_att, base_end, base_str, base_dex, base_int, base_fai)
VALUES ('Bandit', 4, 12, 8, 14, 14, 9, 8, 10);

INSERT INTO Class (nome, base_level, base_vit, base_att, base_end, base_str, base_dex, base_int, base_fai)
VALUES ('Hunter', 4, 11, 9, 11, 12, 14, 9, 9);

INSERT INTO Class (nome, base_level, base_vit, base_att, base_end, base_str, base_dex, base_int, base_fai)
VALUES ('Sorcerer', 3, 8, 15, 8, 9, 11, 15, 8);

INSERT INTO Class (nome, base_level, base_vit, base_att, base_end, base_str, base_dex, base_int, base_fai)
VALUES ('Pyromancer', 1, 10, 12, 11, 12, 9, 10, 8);

INSERT INTO Class (nome, base_level, base_vit, base_att, base_end, base_str, base_dex, base_int, base_fai)
VALUES ('Cleric', 2, 11, 11, 9, 12, 8, 8, 14);

INSERT INTO Class (nome, base_level, base_vit, base_att, base_end, base_str, base_dex, base_int, base_fai)
VALUES ('Deprived', 6, 11, 11, 11, 11, 11, 11, 11);

-- Insert Regions
INSERT INTO Region (nome, description) VALUES
('Firelink Shrine', 'A central hub area connecting various parts of Lordran'),
('Undead Burg', 'A decaying town filled with hollowed undead'),
('Undead Parish', 'An old church area guarded by powerful enemies'),
('Lower Undead Burg', 'The lower section of the Undead Burg, leading to the Depths'),
('The Depths', 'A network of sewers infested with rats and other creatures'),
('Blighttown', 'A poisonous swamp area with treacherous wooden structures'),
('Quelaag''s Domain', 'The lair of the Chaos Witch Quelaag'),
('Sen''s Fortress', 'A trap-filled fortress guarding the way to Anor Londo'),
('Anor Londo', 'The city of the gods, bathed in eternal sunlight'),
('Painted World of Ariamis', 'A snowy world inside a painting'),
('Darkroot Garden', 'A mysterious forest area with hidden secrets'),
('Darkroot Basin', 'The lower area of Darkroot, leading to the Hydra'),
('The Great Hollow', 'A giant hollow tree connecting Blighttown to Ash Lake'),
('Ash Lake', 'An ancient, hidden area beneath Blighttown'),
('The Catacombs', 'A maze-like area filled with reanimating skeletons'),
('Tomb of the Giants', 'A pitch-black cavern filled with giant skeletons'),
('Demon Ruins', 'The fiery ruins of the lost city of Izalith'),
('Lost Izalith', 'The chaotic home of the Witch of Izalith and her daughters'),
('Duke''s Archives', 'A vast library filled with knowledge and crystalline enemies'),
('Crystal Cave', 'A hidden area within the Duke''s Archives, home to Seath the Scaleless'),
('New Londo Ruins', 'A flooded city once home to the Four Kings'),
('The Abyss', 'The dark void where the Four Kings reside'),
('Valley of Drakes', 'A narrow valley inhabited by drakes, connecting several areas'),
('Undead Asylum', 'The starting area of the game, revisitable later'),
('Kiln of the First Flame', 'The final area where Lord Gwyn awaits'),
('Oolacile Township', 'An area in the past, accessible through DLC'),
('Oolacile Sanctuary', 'A peaceful area in Oolacile'),
('Royal Wood', 'The past version of Darkroot Garden'),
('Chasm of the Abyss', 'The birthplace of the Abyss, where Manus resides');


INSERT INTO RegionGraphNode (position, region_description, region_id) VALUES
-- Firelink Shrine
(1, 'Firelink Shrine Central Area', (SELECT id FROM Region WHERE nome = 'Firelink Shrine')),
(2, 'Firelink Shrine Graveyard', (SELECT id FROM Region WHERE nome = 'Firelink Shrine')),
(3, 'Firelink Shrine Elevator to Undead Parish', (SELECT id FROM Region WHERE nome = 'Firelink Shrine')),
(4, 'Firelink Shrine Path to New Londo Ruins', (SELECT id FROM Region WHERE nome = 'Firelink Shrine')),
(5, 'Firelink Shrine Bonfire', (SELECT id FROM Region WHERE nome = 'Firelink Shrine')),

-- Undead Burg
(10, 'Undead Burg Lower Streets', (SELECT id FROM Region WHERE nome = 'Undead Burg')),
(11, 'Undead Burg Taurus Demon Bridge', (SELECT id FROM Region WHERE nome = 'Undead Burg')),
(12, 'Undead Burg Hellkite Bridge', (SELECT id FROM Region WHERE nome = 'Undead Burg')),
(13, 'Undead Burg Tower', (SELECT id FROM Region WHERE nome = 'Undead Burg')),
(14, 'Undead Burg Lower Bonfire', (SELECT id FROM Region WHERE nome = 'Undead Burg')),

-- Undead Parish
(20, 'Undead Parish Church', (SELECT id FROM Region WHERE nome = 'Undead Parish')),
(21, 'Undead Parish Bell Gargoyle Roof', (SELECT id FROM Region WHERE nome = 'Undead Parish')),
(22, 'Undead Parish Blacksmith', (SELECT id FROM Region WHERE nome = 'Undead Parish')),
(23, 'Undead Parish Elevator to Firelink', (SELECT id FROM Region WHERE nome = 'Undead Parish')),
(24, 'Undead Parish Bonfire', (SELECT id FROM Region WHERE nome = 'Undead Parish')),

-- Lower Undead Burg
(30, 'Lower Undead Burg Streets', (SELECT id FROM Region WHERE nome = 'Lower Undead Burg')),
(31, 'Lower Undead Burg Capra Demon Arena', (SELECT id FROM Region WHERE nome = 'Lower Undead Burg')),
(32, 'Lower Undead Burg Bonfire', (SELECT id FROM Region WHERE nome = 'Lower Undead Burg')),

-- The Depths
(40, 'The Depths Upper Area', (SELECT id FROM Region WHERE nome = 'The Depths')),
(41, 'The Depths Gaping Dragon Arena', (SELECT id FROM Region WHERE nome = 'The Depths')),
(42, 'The Depths Rat-Infested Areas', (SELECT id FROM Region WHERE nome = 'The Depths')),
(43, 'The Depths Bonfire', (SELECT id FROM Region WHERE nome = 'The Depths')),

-- Blighttown
(50, 'Blighttown Upper Structures', (SELECT id FROM Region WHERE nome = 'Blighttown')),
(51, 'Blighttown Swamp', (SELECT id FROM Region WHERE nome = 'Blighttown')),
(52, 'Blighttown Upper Bonfire', (SELECT id FROM Region WHERE nome = 'Blighttown')),
(53, 'Blighttown Swamp Bonfire', (SELECT id FROM Region WHERE nome = 'Blighttown')),

-- Quelaag's Domain
(60, 'Quelaag''s Domain Exterior', (SELECT id FROM Region WHERE nome = 'Quelaag''s Domain')),
(61, 'Quelaag''s Arena', (SELECT id FROM Region WHERE nome = 'Quelaag''s Domain')),
(62, 'Quelaag''s Sister''s Sanctuary', (SELECT id FROM Region WHERE nome = 'Quelaag''s Domain')),
(63, 'Quelaag''s Domain Bonfire', (SELECT id FROM Region WHERE nome = 'Quelaag''s Domain')),

-- Sen's Fortress
(70, 'Sen''s Fortress Entrance', (SELECT id FROM Region WHERE nome = 'Sen''s Fortress')),
(71, 'Sen''s Fortress Pendulum Bridge', (SELECT id FROM Region WHERE nome = 'Sen''s Fortress')),
(72, 'Sen''s Fortress Boulder Area', (SELECT id FROM Region WHERE nome = 'Sen''s Fortress')),
(73, 'Sen''s Fortress Roof', (SELECT id FROM Region WHERE nome = 'Sen''s Fortress')),
(74, 'Sen''s Fortress Iron Golem Arena', (SELECT id FROM Region WHERE nome = 'Sen''s Fortress')),
(75, 'Sen''s Fortress Bonfire', (SELECT id FROM Region WHERE nome = 'Sen''s Fortress')),

-- Anor Londo
(80, 'Anor Londo Entrance', (SELECT id FROM Region WHERE nome = 'Anor Londo')),
(81, 'Anor Londo Cathedral Exterior', (SELECT id FROM Region WHERE nome = 'Anor Londo')),
(82, 'Anor Londo Rafters', (SELECT id FROM Region WHERE nome = 'Anor Londo')),
(83, 'Anor Londo Main Hall', (SELECT id FROM Region WHERE nome = 'Anor Londo')),
(84, 'Anor Londo Ornstein and Smough Arena', (SELECT id FROM Region WHERE nome = 'Anor Londo')),
(85, 'Anor Londo First Bonfire', (SELECT id FROM Region WHERE nome = 'Anor Londo')),
(86, 'Anor Londo Second Bonfire', (SELECT id FROM Region WHERE nome = 'Anor Londo')),
(87, 'Anor Londo Darkmoon Tomb Bonfire', (SELECT id FROM Region WHERE nome = 'Anor Londo')),

-- Painted World of Ariamis
(90, 'Painted World Entrance', (SELECT id FROM Region WHERE nome = 'Painted World of Ariamis')),
(91, 'Painted World Courtyard', (SELECT id FROM Region WHERE nome = 'Painted World of Ariamis')),
(92, 'Painted World Annex', (SELECT id FROM Region WHERE nome = 'Painted World of Ariamis')),
(93, 'Painted World Bridge', (SELECT id FROM Region WHERE nome = 'Painted World of Ariamis')),
(94, 'Painted World Priscilla''s Arena', (SELECT id FROM Region WHERE nome = 'Painted World of Ariamis')),
(95, 'Painted World Bonfire', (SELECT id FROM Region WHERE nome = 'Painted World of Ariamis')),

-- Darkroot Garden
(100, 'Darkroot Garden Entrance', (SELECT id FROM Region WHERE nome = 'Darkroot Garden')),
(101, 'Darkroot Garden Stone Knights Area', (SELECT id FROM Region WHERE nome = 'Darkroot Garden')),
(102, 'Darkroot Garden Sif''s Arena', (SELECT id FROM Region WHERE nome = 'Darkroot Garden')),
(103, 'Darkroot Garden Bonfire', (SELECT id FROM Region WHERE nome = 'Darkroot Garden')),

-- Darkroot Basin
(110, 'Darkroot Basin Entrance', (SELECT id FROM Region WHERE nome = 'Darkroot Basin')),
(111, 'Darkroot Basin Hydra Lake', (SELECT id FROM Region WHERE nome = 'Darkroot Basin')),
(112, 'Darkroot Basin Bonfire', (SELECT id FROM Region WHERE nome = 'Darkroot Basin')),

-- The Great Hollow
(120, 'The Great Hollow Entrance', (SELECT id FROM Region WHERE nome = 'The Great Hollow')),
(121, 'The Great Hollow Midsection', (SELECT id FROM Region WHERE nome = 'The Great Hollow')),
(122, 'The Great Hollow Bottom', (SELECT id FROM Region WHERE nome = 'The Great Hollow')),

-- Ash Lake
(130, 'Ash Lake Shore', (SELECT id FROM Region WHERE nome = 'Ash Lake')),
(131, 'Ash Lake Dragon Path', (SELECT id FROM Region WHERE nome = 'Ash Lake')),
(132, 'Ash Lake Bonfire', (SELECT id FROM Region WHERE nome = 'Ash Lake')),

-- The Catacombs
(140, 'The Catacombs Entrance', (SELECT id FROM Region WHERE nome = 'The Catacombs')),
(141, 'The Catacombs Bridge', (SELECT id FROM Region WHERE nome = 'The Catacombs')),
(142, 'The Catacombs Pinwheel''s Arena', (SELECT id FROM Region WHERE nome = 'The Catacombs')),
(143, 'The Catacombs Bonfire', (SELECT id FROM Region WHERE nome = 'The Catacombs')),

-- Tomb of the Giants
(150, 'Tomb of the Giants First Area', (SELECT id FROM Region WHERE nome = 'Tomb of the Giants')),
(151, 'Tomb of the Giants Patches'' Area', (SELECT id FROM Region WHERE nome = 'Tomb of the Giants')),
(152, 'Tomb of the Giants Nito''s Arena', (SELECT id FROM Region WHERE nome = 'Tomb of the Giants')),
(153, 'Tomb of the Giants First Bonfire', (SELECT id FROM Region WHERE nome = 'Tomb of the Giants')),
(154, 'Tomb of the Giants Second Bonfire', (SELECT id FROM Region WHERE nome = 'Tomb of the Giants')),

-- Demon Ruins
(160, 'Demon Ruins Entrance', (SELECT id FROM Region WHERE nome = 'Demon Ruins')),
(161, 'Demon Ruins Ceaseless Discharge Arena', (SELECT id FROM Region WHERE nome = 'Demon Ruins')),
(162, 'Demon Ruins Demon Firesage Arena', (SELECT id FROM Region WHERE nome = 'Demon Ruins')),
(163, 'Demon Ruins Centipede Demon Arena', (SELECT id FROM Region WHERE nome = 'Demon Ruins')),
(164, 'Demon Ruins First Bonfire', (SELECT id FROM Region WHERE nome = 'Demon Ruins')),
(165, 'Demon Ruins Second Bonfire', (SELECT id FROM Region WHERE nome = 'Demon Ruins')),

-- Lost Izalith
(170, 'Lost Izalith Lava Field', (SELECT id FROM Region WHERE nome = 'Lost Izalith')),
(171, 'Lost Izalith City Streets', (SELECT id FROM Region WHERE nome = 'Lost Izalith')),
(172, 'Lost Izalith Bed of Chaos Arena', (SELECT id FROM Region WHERE nome = 'Lost Izalith')),
(173, 'Lost Izalith Bonfire', (SELECT id FROM Region WHERE nome = 'Lost Izalith')),

-- Duke's Archives
(180, 'Duke''s Archives Entrance', (SELECT id FROM Region WHERE nome = 'Duke''s Archives')),
(181, 'Duke''s Archives Prison', (SELECT id FROM Region WHERE nome = 'Duke''s Archives')),
(182, 'Duke''s Archives Upper Library', (SELECT id FROM Region WHERE nome = 'Duke''s Archives')),
(183, 'Duke''s Archives Balcony', (SELECT id FROM Region WHERE nome = 'Duke''s Archives')),
(184, 'Duke''s Archives First Bonfire', (SELECT id FROM Region WHERE nome = 'Duke''s Archives')),
(185, 'Duke''s Archives Prison Bonfire', (SELECT id FROM Region WHERE nome = 'Duke''s Archives')),

-- Crystal Cave
(190, 'Crystal Cave Entrance', (SELECT id FROM Region WHERE nome = 'Crystal Cave')),
(191, 'Crystal Cave Invisible Bridges', (SELECT id FROM Region WHERE nome = 'Crystal Cave')),
(192, 'Crystal Cave Seath''s Arena', (SELECT id FROM Region WHERE nome = 'Crystal Cave')),

-- New Londo Ruins
(200, 'New Londo Ruins Entrance', (SELECT id FROM Region WHERE nome = 'New Londo Ruins')),
(201, 'New Londo Ruins Drained Area', (SELECT id FROM Region WHERE nome = 'New Londo Ruins')),
(202, 'New Londo Ruins Lower Area', (SELECT id FROM Region WHERE nome = 'New Londo Ruins')),
(203, 'New Londo Ruins Four Kings Arena', (SELECT id FROM Region WHERE nome = 'New Londo Ruins')),

-- The Abyss
(210, 'The Abyss', (SELECT id FROM Region WHERE nome = 'The Abyss')),

-- Valley of Drakes
(220, 'Valley of Drakes Entrance from New Londo', (SELECT id FROM Region WHERE nome = 'Valley of Drakes')),
(221, 'Valley of Drakes Bridge', (SELECT id FROM Region WHERE nome = 'Valley of Drakes')),
(222, 'Valley of Drakes Darkroot Basin Connection', (SELECT id FROM Region WHERE nome = 'Valley of Drakes')),

-- Undead Asylum
(230, 'Undead Asylum Courtyard', (SELECT id FROM Region WHERE nome = 'Undead Asylum')),
(231, 'Undead Asylum Upper Floor', (SELECT id FROM Region WHERE nome = 'Undead Asylum')),
(232, 'Undead Asylum Stray Demon Arena', (SELECT id FROM Region WHERE nome = 'Undead Asylum')),
(233, 'Undead Asylum Starting Room', (SELECT id FROM Region WHERE nome = 'Undead Asylum')),
(234, 'Undead Asylum Bonfire', (SELECT id FROM Region WHERE nome = 'Undead Asylum')),

-- Kiln of the First Flame
(240, 'Kiln of the First Flame Entrance', (SELECT id FROM Region WHERE nome = 'Kiln of the First Flame')),
(241, 'Kiln of the First Flame Path', (SELECT id FROM Region WHERE nome = 'Kiln of the First Flame')),
(242, 'Kiln of the First Flame Gwyn''s Arena', (SELECT id FROM Region WHERE nome = 'Kiln of the First Flame')),
(243, 'Kiln of the First Flame Bonfire', (SELECT id FROM Region WHERE nome = 'Kiln of the First Flame')),

-- Oolacile Township (DLC)
(250, 'Oolacile Township Entrance', (SELECT id FROM Region WHERE nome = 'Oolacile Township')),
(251, 'Oolacile Township Streets', (SELECT id FROM Region WHERE nome = 'Oolacile Township')),
(252, 'Oolacile Township Mimic Building', (SELECT id FROM Region WHERE nome = 'Oolacile Township')),
(253, 'Oolacile Township Bonfire', (SELECT id FROM Region WHERE nome = 'Oolacile Township')),

-- Oolacile Sanctuary (DLC)
(260, 'Oolacile Sanctuary', (SELECT id FROM Region WHERE nome = 'Oolacile Sanctuary')),
(261, 'Oolacile Sanctuary Bonfire', (SELECT id FROM Region WHERE nome = 'Oolacile Sanctuary')),

-- Royal Wood (DLC)
(270, 'Royal Wood Entrance', (SELECT id FROM Region WHERE nome = 'Royal Wood')),
(271, 'Royal Wood Kalameet Area', (SELECT id FROM Region WHERE nome = 'Royal Wood')),
(272, 'Royal Wood Artorias Arena', (SELECT id FROM Region WHERE nome = 'Royal Wood')),
(273, 'Royal Wood Elizabeth''s Garden', (SELECT id FROM Region WHERE nome = 'Royal Wood')),

-- Chasm of the Abyss (DLC)
(280, 'Chasm of the Abyss Entrance', (SELECT id FROM Region WHERE nome = 'Chasm of the Abyss')),
(281, 'Chasm of the Abyss Humanity Phantoms Area', (SELECT id FROM Region WHERE nome = 'Chasm of the Abyss')),
(282, 'Chasm of the Abyss Manus Arena', (SELECT id FROM Region WHERE nome = 'Chasm of the Abyss')),
(283, 'Chasm of the Abyss Bonfire', (SELECT id FROM Region WHERE nome = 'Chasm of the Abyss'));

-- Insert RegionGraphEdges
INSERT INTO RegionGraphEdge (origin_node, destination_node) VALUES
-- Firelink Shrine connections
(1, 2), (1, 3), (1, 4), (1, 5),
(3, 23), -- Firelink Shrine Elevator to Undead Parish
(4, 200), -- Firelink Shrine to New Londo Ruins
(2, 140), -- Firelink Shrine Graveyard to Catacombs Entrance

-- Undead Burg connections
(10, 11), (11, 12), (12, 13), (10, 14),
(13, 20), -- Undead Burg Tower to Undead Parish Church
(10, 30), -- Undead Burg Lower Streets to Lower Undead Burg

-- Undead Parish connections
(20, 21), (20, 22), (20, 23), (20, 24),
(22, 100), -- Undead Parish Blacksmith to Darkroot Garden Entrance

-- Lower Undead Burg connections
(30, 31), (30, 32),
(31, 40), -- Lower Undead Burg Capra Demon Arena to The Depths Upper Area

-- The Depths connections
(40, 41), (40, 42), (40, 43),
(42, 50), -- The Depths Rat-Infested Areas to Blighttown Upper Structures

-- Blighttown connections
(50, 51), (50, 52), (51, 53),
(51, 60), -- Blighttown Swamp to Quelaag's Domain Exterior
(51, 120), -- Blighttown Swamp to The Great Hollow Entrance

-- Quelaag's Domain connections
(60, 61), (61, 62), (60, 63),
(62, 160), -- Quelaag's Sister's Sanctuary to Demon Ruins Entrance

-- Sen's Fortress connections
(70, 71), (71, 72), (72, 73), (73, 74), (70, 75),
(74, 80), -- Sen's Fortress Iron Golem Arena to Anor Londo Entrance

-- Anor Londo connections
(80, 81), (81, 82), (82, 83), (83, 84), (80, 85), (83, 86), (83, 87),
(83, 90), -- Anor Londo Main Hall to Painted World Entrance (via painting)
(84, 180), -- Anor Londo Ornstein and Smough Arena to Duke's Archives Entrance

-- Painted World of Ariamis connections
(90, 91), (91, 92), (92, 93), (93, 94), (91, 95),

-- Darkroot Garden connections
(100, 101), (101, 102), (100, 103),
(101, 110), -- Darkroot Garden Stone Knights Area to Darkroot Basin Entrance

-- Darkroot Basin connections
(110, 111), (110, 112),
(111, 222), -- Darkroot Basin Hydra Lake to Valley of Drakes Darkroot Basin Connection

-- The Great Hollow connections
(120, 121), (121, 122),
(122, 130), -- The Great Hollow Bottom to Ash Lake Shore

-- Ash Lake connections
(130, 131), (130, 132),

-- The Catacombs connections
(140, 141), (141, 142), (140, 143),
(142, 150), -- The Catacombs Pinwheel's Arena to Tomb of the Giants First Area

-- Tomb of the Giants connections
(150, 151), (151, 152), (150, 153), (151, 154),

-- Demon Ruins connections
(160, 161), (161, 162), (162, 163), (160, 164), (162, 165),
(163, 170), -- Demon Ruins Centipede Demon Arena to Lost Izalith Lava Field

-- Lost Izalith connections
(170, 171), (171, 172), (170, 173),

-- Duke's Archives connections
(180, 181), (181, 182), (182, 183), (180, 184), (181, 185),
(183, 190), -- Duke's Archives Balcony to Crystal Cave Entrance

-- Crystal Cave connections
(190, 191), (191, 192),

-- New Londo Ruins connections
(200, 201), (201, 202), (202, 203),
(201, 220), -- New Londo Ruins Drained Area to Valley of Drakes Entrance from New Londo

-- The Abyss connection
(203, 210), -- New Londo Ruins Four Kings Arena to The Abyss

-- Valley of Drakes connections
(220, 221), (221, 222),

-- Undead Asylum connections
(230, 231), (231, 232), (230, 233), (230, 234),

-- Kiln of the First Flame connections
(240, 241), (241, 242), (240, 243),

-- DLC Area connections
-- Oolacile Township
(250, 251), (251, 252), (250, 253),
(252, 280), -- Oolacile Township Mimic Building to Chasm of the Abyss Entrance

-- Oolacile Sanctuary
(260, 261),
(260, 270), -- Oolacile Sanctuary to Royal Wood Entrance

-- Royal Wood
(270, 271), (270, 272), (270, 273),

-- Chasm of the Abyss
(280, 281), (281, 282), (280, 283),

-- Connect DLC areas to main game
(102, 270), -- Darkroot Garden Sif's Arena to Royal Wood Entrance (time travel)

-- Special connections (shortcuts, etc.)
(1, 230), -- Firelink Shrine Central Area to Undead Asylum Courtyard (via crow)
(1, 240); -- Firelink Shrine Central Area to Kiln of the First Flame Entrance (after placing Lordvessel)

-- Inserting Personagens (Characters)
INSERT INTO Personagem (nome, tipo, hp_total, stamina_total, poise_resistance) VALUES
('Oscar of Astora', 'NPC', 400, 100, 20),
('Undead Merchant', 'NPC', 300, 80, 10),
('Hollow Soldier', 'Enemy', 200, 90, 15),
('Undead Warrior', 'Enemy', 250, 100, 20);

-- Inserting Bonfires
INSERT INTO Bonfire (kindle_level, bonfire_active, warp_ok, bonfire_reset_status, region_graph_node_position) VALUES
(0, TRUE, FALSE, TRUE, 5),  -- Firelink Shrine Bonfire
(0, TRUE, FALSE, TRUE, 14), -- Undead Burg Lower Bonfire
(0, TRUE, FALSE, TRUE, 24); -- Undead Parish Bonfire

-- Inserting NPCs
INSERT INTO NPC (personagem_id, weakness, resistance, tipo, hp, respawn, position, hp_atual, stamina_atual) VALUES
((SELECT id FROM Personagem WHERE nome = 'Oscar of Astora'), 'Bleed', 'Magic', 'Friendly', 400, FALSE, 1, 400, 100),
((SELECT id FROM Personagem WHERE nome = 'Undead Merchant'), 'Fire', 'Lightning', 'Merchant', 300, TRUE, 13, 300, 80);

-- Inserting Enemies
INSERT INTO NPC (personagem_id, weakness, resistance, tipo, hp, respawn, position, hp_atual, stamina_atual) VALUES
((SELECT id FROM Personagem WHERE nome = 'Hollow Soldier'), 'Fire', 'Physical', 'Enemy', 200, TRUE, 10, 200, 90),
((SELECT id FROM Personagem WHERE nome = 'Undead Warrior'), 'Lightning', 'Fire', 'Enemy', 250, TRUE, 20, 250, 100);

-- Inserting Items
INSERT INTO Item (nome, equip, tipo, soul_valor, can_sell) VALUES
('Broken Straight Sword', TRUE, 'Weapon', 50, TRUE),
('Cracked Round Shield', TRUE, 'Shield', 50, TRUE),
('Firebomb', FALSE, 'Consumable', 30, TRUE),
('Undead Asylum F2 East Key', FALSE, 'Key', 0, FALSE);

-- Inserting Weapons
INSERT INTO Weapon (item_id, damage, attack_recovery, poise, stamina_cost, attack_tipo, attack_speed, weapon_tipo, scaling, upgrade_level, upgrade_status, equipped) VALUES
((SELECT id FROM Item WHERE nome = 'Broken Straight Sword'), 40, 1, 5, 20, 'Slash', 2, 'Straight Sword', 'D/D/-/-', 0, 'Normal', FALSE);

-- Inserting Armor (Shield)
INSERT INTO Armor (item_id, equipped, tipo, defense_valor, defense_tipo) VALUES
((SELECT id FROM Item WHERE nome = 'Cracked Round Shield'), FALSE, 'Shield', 30, 'Physical');

-- Inserting Consumable
INSERT INTO Consumable (item_id, effect, duration, valor) VALUES
((SELECT id FROM Item WHERE nome = 'Firebomb'), 'Fire Damage', 0, 30);

-- Inserting Key Item
INSERT INTO KeyItem (item_id, is_used) VALUES
((SELECT id FROM Item WHERE nome = 'Undead Asylum F2 East Key'), FALSE);

-- Inserting Chests
INSERT INTO Chest (item_id, personagem_id, position) VALUES
((SELECT id FROM Item WHERE nome = 'Firebomb'), NULL, 11),
((SELECT id FROM Item WHERE nome = 'Undead Asylum F2 East Key'), NULL, 231);


-- Insert Items
INSERT INTO Item (nome, equip, tipo, soul_valor, can_sell) VALUES
-- Warrior Items
('Longsword', TRUE, 'Weapon', 50, TRUE),
('Heater Shield', TRUE, 'Shield', 50, TRUE),
('Standard Helm', TRUE, 'Armor', 50, TRUE),
('Hard Leather Armor', TRUE, 'Armor', 50, TRUE),
('Hard Leather Gauntlets', TRUE, 'Armor', 50, TRUE),
('Hard Leather Boots', TRUE, 'Armor', 50, TRUE),
-- Knight Items
('Broadsword', TRUE, 'Weapon', 50, TRUE),
('Knight Shield', TRUE, 'Shield', 50, TRUE),
('Knight Helm', TRUE, 'Armor', 50, TRUE),
('Knight Armor', TRUE, 'Armor', 50, TRUE),
('Knight Gauntlets', TRUE, 'Armor', 50, TRUE),
('Knight Leggings', TRUE, 'Armor', 50, TRUE),
-- Wanderer Items
('Scimitar', TRUE, 'Weapon', 50, TRUE),
('Leather Shield', TRUE, 'Shield', 50, TRUE),
('Wanderer Hood', TRUE, 'Armor', 50, TRUE),
('Wanderer Coat', TRUE, 'Armor', 50, TRUE),
('Wanderer Manchette', TRUE, 'Armor', 50, TRUE),
('Wanderer Boots', TRUE, 'Armor', 50, TRUE),
-- Thief Items
('Bandit''s Knife', TRUE, 'Weapon', 50, TRUE),
('Target Shield', TRUE, 'Shield', 50, TRUE),
('Thief Mask', TRUE, 'Armor', 50, TRUE),
('Black Leather Armor', TRUE, 'Armor', 50, TRUE),
('Black Leather Gloves', TRUE, 'Armor', 50, TRUE),
('Black Leather Boots', TRUE, 'Armor', 50, TRUE),
-- Bandit Items
('Battle Axe', TRUE, 'Weapon', 50, TRUE),
('Spider Shield', TRUE, 'Shield', 50, TRUE),
('Brigand Hood', TRUE, 'Armor', 50, TRUE),
('Brigand Armor', TRUE, 'Armor', 50, TRUE),
('Brigand Gauntlets', TRUE, 'Armor', 50, TRUE),
('Brigand Trousers', TRUE, 'Armor', 50, TRUE),
-- Hunter Items
('Short Bow', TRUE, 'Weapon', 50, TRUE),
('Large Leather Shield', TRUE, 'Shield', 50, TRUE),
('Leather Armor', TRUE, 'Armor', 50, TRUE),
('Leather Gloves', TRUE, 'Armor', 50, TRUE),
('Leather Boots', TRUE, 'Armor', 50, TRUE),
('Arrow', FALSE, 'Ammo', 1, TRUE),
-- Sorcerer Items
('Dagger', TRUE, 'Weapon', 50, TRUE),
('Small Leather Shield', TRUE, 'Shield', 50, TRUE),
('Sorcerer Hat', TRUE, 'Armor', 50, TRUE),
('Sorcerer Cloak', TRUE, 'Armor', 50, TRUE),
('Sorcerer Gauntlets', TRUE, 'Armor', 50, TRUE),
('Sorcerer Boots', TRUE, 'Armor', 50, TRUE),
('Sorcerer''s Catalyst', TRUE, 'Weapon', 50, TRUE),
-- Pyromancer Items
('Hand Axe', TRUE, 'Weapon', 50, TRUE),
('Cracked Round Shield', TRUE, 'Shield', 50, TRUE),
('Tattered Cloth Hood', TRUE, 'Armor', 50, TRUE),
('Tattered Cloth Robe', TRUE, 'Armor', 50, TRUE),
('Tattered Cloth Manchette', TRUE, 'Armor', 50, TRUE),
('Heavy Boots', TRUE, 'Armor', 50, TRUE),
('Pyromancy Flame', TRUE, 'Weapon', 50, TRUE),
-- Cleric Items
('Mace', TRUE, 'Weapon', 50, TRUE),
('East-West Shield', TRUE, 'Shield', 50, TRUE),
('Holy Robe', TRUE, 'Armor', 50, TRUE),
('Holy Trousers', TRUE, 'Armor', 50, TRUE),
('Canvas Talisman', TRUE, 'Weapon', 50, TRUE),
-- Deprived Items
('Club', TRUE, 'Weapon', 50, TRUE),
('Plank Shield', TRUE, 'Shield', 50, TRUE);

INSERT INTO Weapon (item_id, damage, attack_recovery, poise, stamina_cost, attack_tipo, attack_speed, weapon_tipo, scaling, upgrade_level, upgrade_status, equipped)
SELECT id, 80, 1, 5, 20, 'Slash', 2, 
    CASE 
        WHEN nome IN ('Longsword', 'Broadsword') THEN 'Straight Sword'
        WHEN nome = 'Scimitar' THEN 'Curved Sword'
        WHEN nome = 'Bandit''s Knife' THEN 'Dagger'
        WHEN nome = 'Battle Axe' THEN 'Axe'
        WHEN nome = 'Short Bow' THEN 'Bow'
        WHEN nome = 'Dagger' THEN 'Dagger'
        WHEN nome = 'Hand Axe' THEN 'Axe'
        WHEN nome = 'Mace' THEN 'Hammer'
        WHEN nome = 'Club' THEN 'Hammer'
        ELSE 'Other'
    END,
    'C/C/-/-', 0, 'Normal', TRUE
FROM Item
WHERE nome IN ('Longsword', 'Broadsword', 'Scimitar', 'Bandit''s Knife', 'Battle Axe', 'Short Bow', 'Dagger', 'Hand Axe', 'Mace', 'Club');

INSERT INTO Armor (item_id, equipped, tipo, defense_valor, defense_tipo)
SELECT id, TRUE, 
    CASE 
        WHEN nome LIKE '%Shield%' THEN 'Shield'
        WHEN nome LIKE '%Helm%' OR nome LIKE '%Hood%' OR nome LIKE '%Mask%' OR nome LIKE '%Hat%' THEN 'Helmet'
        WHEN nome LIKE '%Armor%' OR nome LIKE '%Robe%' OR nome LIKE '%Coat%' OR nome LIKE '%Cloak%' THEN 'Chest'
        WHEN nome LIKE '%Gauntlets%' OR nome LIKE '%Gloves%' OR nome LIKE '%Manchette%' THEN 'Hands'
        WHEN nome LIKE '%Boots%' OR nome LIKE '%Leggings%' OR nome LIKE '%Trousers%' THEN 'Legs'
        ELSE 'Other'
    END,
    50, 'Physical'
FROM Item
WHERE tipo = 'Armor' OR nome LIKE '%Shield%';

INSERT INTO Magic (item_id, tipo, stamina_cost, quantity, equipped)
SELECT id, 
    CASE 
        WHEN nome = 'Sorcerer''s Catalyst' THEN 'Catalyst'
        WHEN nome = 'Pyromancy Flame' THEN 'Pyromancy Flame'
        WHEN nome = 'Canvas Talisman' THEN 'Talisman'
    END,
    10, 1, TRUE
FROM Item
WHERE nome IN ('Sorcerer''s Catalyst', 'Pyromancy Flame', 'Canvas Talisman');

INSERT INTO Consumable (item_id, effect, duration, valor)
SELECT id, 'Projectile', 0, 1
FROM Item
WHERE nome = 'Arrow';

