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

INSERT INTO Region (nome, description) VALUES
('Firelink Shrine', 'A central hub area, serving as a sanctuary for the Chosen Undead. It features a bonfire and is surrounded by ruins, with paths leading to various other areas of Lordran.'),
('Undead Burg', 'A dilapidated town filled with hollow soldiers and undead. Its winding streets and crumbling structures were once part of a thriving human settlement.'),
('Undead Parish', 'An old church district overlooking the Undead Burg. Home to the first Bell of Awakening and various challenging enemies.'),
('The Depths', 'A network of sewers beneath the Undead Burg, infested with rats, slimes, and other horrors. The domain of the Gaping Dragon.'),
('Blighttown', 'A treacherous area of rickety wooden structures built into a cliff face, leading down to a poisonous swamp. Home to dangerous enemies and the second Bell of Awakening.'),
('Sen''s Fortress', 'An ancient proving ground filled with traps, swinging blades, and rolling boulders. Those who survive its trials gain access to the shining city of Anor Londo.'),
('Anor Londo', 'The majestic city of the gods, bathed in eternal sunlight. Its grand architecture and powerful guardians stand as a testament to the age of fire.'),
('Painted World of Ariamis', 'A mysterious realm contained within a painting, accessed through a large painting in Anor Londo. A snowy, isolated world full of unique dangers.'),
('Darkroot Garden', 'A lush, overgrown forest area filled with plant-like creatures and the remnants of Oolacile. Home to several optional bosses and the grave of Artorias the Abysswalker.'),
('Darkroot Basin', 'The lower area of Darkroot, featuring a lake and the Hydra. It connects to various other regions and holds several secrets.'),
('The Catacombs', 'A dark series of tombs and passageways, filled with skeletons that continually resurrect unless defeated with specific weapons or by killing nearby necromancers.'),
('Tomb of the Giants', 'A pitch-black area deep underground, filled with giant skeletons and treacherous cliffs. The resting place of Gravelord Nito.'),
('Demon Ruins', 'A fiery area filled with the remnants of the Witch of Izalith''s failed attempt to recreate the First Flame. Home to numerous demons.'),
('Lost Izalith', 'The ruined city of the Witch of Izalith, now overrun by demons and home to the Bed of Chaos, one of the Lord Soul bearers.'),
('The Duke''s Archives', 'A vast library filled with knowledge and dangerous creatures. The domain of Seath the Scaleless, who went mad in his pursuit of the secret of the dragons'' immortality.'),
('Crystal Cave', 'A hidden area accessed through the Duke''s Archives, featuring invisible crystal walkways and crystal golems. The lair of Seath the Scaleless.'),
('New Londo Ruins', 'A flooded city, once home to powerful sorcerers known as the Four Kings. Now a haunted place filled with ghosts and darkwraiths.'),
('The Abyss', 'A realm of pure darkness, accessible only with the Covenant of Artorias ring. The final resting place of the Four Kings.'),
('Kiln of the First Flame', 'The final area of the game, where the First Flame burns. A desolate, ash-covered landscape where the Chosen Undead confronts Lord Gwyn.'),
('Northern Undead Asylum', 'The starting area of the game, a crumbling prison for the Undead. The Chosen Undead begins their journey here and can return later in the game.');


INSERT INTO RegionGraphNode (region_description, region_id) VALUES
('The central bonfire area of Firelink Shrine', (SELECT id FROM Region WHERE nome = 'Firelink Shrine')),
('The upper levels of the Undead Burg', (SELECT id FROM Region WHERE nome = 'Undead Burg')),
('The lower levels of the Undead Burg', (SELECT id FROM Region WHERE nome = 'Undead Burg')),
('The main church area of the Undead Parish', (SELECT id FROM Region WHERE nome = 'Undead Parish')),
('The Bell Gargoyle''s rooftop in the Undead Parish', (SELECT id FROM Region WHERE nome = 'Undead Parish')),
('The entrance to The Depths', (SELECT id FROM Region WHERE nome = 'The Depths')),
('The Gaping Dragon''s lair in The Depths', (SELECT id FROM Region WHERE nome = 'The Depths')),
('The upper wooden structures of Blighttown', (SELECT id FROM Region WHERE nome = 'Blighttown')),
('The poisonous swamp at the bottom of Blighttown', (SELECT id FROM Region WHERE nome = 'Blighttown')),
('The entrance to Sen''s Fortress', (SELECT id FROM Region WHERE nome = 'Sen''s Fortress')),
('The roof of Sen''s Fortress', (SELECT id FROM Region WHERE nome = 'Sen''s Fortress')),
('The grand entrance hall of Anor Londo', (SELECT id FROM Region WHERE nome = 'Anor Londo')),
('The cathedral interior of Anor Londo', (SELECT id FROM Region WHERE nome = 'Anor Londo')),
('The snowy courtyard of the Painted World', (SELECT id FROM Region WHERE nome = 'Painted World of Ariamis')),
('The main forest area of Darkroot Garden', (SELECT id FROM Region WHERE nome = 'Darkroot Garden')),
('The lakeside area of Darkroot Basin', (SELECT id FROM Region WHERE nome = 'Darkroot Basin')),
('The upper levels of The Catacombs', (SELECT id FROM Region WHERE nome = 'The Catacombs')),
('The deeper areas of the Tomb of the Giants', (SELECT id FROM Region WHERE nome = 'Tomb of the Giants')),
('The lava-filled areas of Demon Ruins', (SELECT id FROM Region WHERE nome = 'Demon Ruins')),
('The central chamber of Lost Izalith', (SELECT id FROM Region WHERE nome = 'Lost Izalith')),
('The main library area of The Duke''s Archives', (SELECT id FROM Region WHERE nome = 'The Duke''s Archives')),
('The treacherous pathways of Crystal Cave', (SELECT id FROM Region WHERE nome = 'Crystal Cave')),
('The flooded lower areas of New Londo Ruins', (SELECT id FROM Region WHERE nome = 'New Londo Ruins')),
('The dark void of The Abyss', (SELECT id FROM Region WHERE nome = 'The Abyss')),
('The ashen landscape of the Kiln of the First Flame', (SELECT id FROM Region WHERE nome = 'Kiln of the First Flame')),
('The crumbling corridors of Northern Undead Asylum', (SELECT id FROM Region WHERE nome = 'Northern Undead Asylum'));


INSERT INTO Bonfire (kindle_level, bonfire_active, warp_ok, bonfire_reset_status, region_graph_node_position) VALUES
(1, TRUE, TRUE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Firelink Shrine%')),
(1, TRUE, FALSE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%upper levels of the Undead Burg%')),
(1, TRUE, FALSE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%main church area of the Undead Parish%')),
(1, TRUE, FALSE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%entrance to The Depths%')),
(1, TRUE, FALSE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%poisonous swamp at the bottom of Blighttown%')),
(1, TRUE, TRUE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%entrance hall of Anor Londo%')),
(1, TRUE, FALSE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%snowy courtyard of the Painted World%')),
(1, TRUE, FALSE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%main forest area of Darkroot Garden%')),
(1, TRUE, FALSE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%upper levels of The Catacombs%')),
(1, TRUE, TRUE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%deeper areas of the Tomb of the Giants%')),
(1, TRUE, TRUE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%lava-filled areas of Demon Ruins%')),
(1, TRUE, TRUE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%central chamber of Lost Izalith%')),
(1, TRUE, TRUE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%main library area of The Duke''s Archives%')),
(1, TRUE, FALSE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%flooded lower areas of New Londo Ruins%')),
(1, TRUE, TRUE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%ashen landscape of the Kiln of the First Flame%')),
(1, TRUE, FALSE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%crumbling corridors of Northern Undead Asylum%'));

INSERT INTO RegionGraphEdge (origin_node, destination_node) VALUES
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Firelink Shrine%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%upper levels of the Undead Burg%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%upper levels of the Undead Burg%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%main church area of the Undead Parish%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%lower levels of the Undead Burg%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%entrance to The Depths%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%entrance to The Depths%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%upper wooden structures of Blighttown%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%main church area of the Undead Parish%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%entrance to Sen''s Fortress%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%roof of Sen''s Fortress%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%grand entrance hall of Anor Londo%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%cathedral interior of Anor Londo%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%snowy courtyard of the Painted World%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Firelink Shrine%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%main forest area of Darkroot Garden%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Firelink Shrine%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%upper levels of The Catacombs%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%deeper areas of the Tomb of the Giants%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%lava-filled areas of Demon Ruins%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%lava-filled areas of Demon Ruins%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%central chamber of Lost Izalith%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%grand entrance hall of Anor Londo%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%main library area of The Duke''s Archives%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%main library area of The Duke''s Archives%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%treacherous pathways of Crystal Cave%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Firelink Shrine%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%flooded lower areas of New Londo Ruins%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%flooded lower areas of New Londo Ruins%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%dark void of The Abyss%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Firelink Shrine%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%ashen landscape of the Kiln of the First Flame%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Firelink Shrine%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%crumbling corridors of Northern Undead Asylum%'));


INSERT INTO RegionGraphNode (region_description, region_id) VALUES
('The Taurus Demon''s bridge in Undead Burg', (SELECT id FROM Region WHERE nome = 'Undead Burg')),
('The Capra Demon''s narrow alley in Undead Burg', (SELECT id FROM Region WHERE nome = 'Undead Burg')),
('The Channeler''s archive in the Undead Parish', (SELECT id FROM Region WHERE nome = 'Undead Parish')),
('The rat-infested tunnels of The Depths', (SELECT id FROM Region WHERE nome = 'The Depths')),
('The dark cavern of the Gaping Dragon in The Depths', (SELECT id FROM Region WHERE nome = 'The Depths')),
('The rickety scaffolding of upper Blighttown', (SELECT id FROM Region WHERE nome = 'Blighttown')),
('Quelaag''s Domain at the base of Blighttown', (SELECT id FROM Region WHERE nome = 'Blighttown')),
('The deadly pendulum room in Sen''s Fortress', (SELECT id FROM Region WHERE nome = 'Sen''s Fortress')),
('The Giant Blacksmith''s forge in Anor Londo', (SELECT id FROM Region WHERE nome = 'Anor Londo')),
('Gwyndolin''s illusion chamber in Anor Londo', (SELECT id FROM Region WHERE nome = 'Anor Londo')),
('The bridge guarded by the Undead Dragon in Painted World', (SELECT id FROM Region WHERE nome = 'Painted World of Ariamis')),
('The Moonlight Butterfly''s bridge in Darkroot Garden', (SELECT id FROM Region WHERE nome = 'Darkroot Garden')),
('Sif''s grave site in Darkroot Garden', (SELECT id FROM Region WHERE nome = 'Darkroot Garden')),
('The Hydra''s lake in Darkroot Basin', (SELECT id FROM Region WHERE nome = 'Darkroot Basin')),
('The Pinwheel''s lair in The Catacombs', (SELECT id FROM Region WHERE nome = 'The Catacombs')),
('Patches'' betrayal point in Tomb of the Giants', (SELECT id FROM Region WHERE nome = 'Tomb of the Giants')),
('The Ceaseless Discharge''s domain in Demon Ruins', (SELECT id FROM Region WHERE nome = 'Demon Ruins')),
('The Centipede Demon''s arena in Demon Ruins', (SELECT id FROM Region WHERE nome = 'Demon Ruins')),
('The Bed of Chaos'' chamber in Lost Izalith', (SELECT id FROM Region WHERE nome = 'Lost Izalith')),
('The prison tower in The Duke''s Archives', (SELECT id FROM Region WHERE nome = 'The Duke''s Archives')),
('Seath''s crystal cave lair', (SELECT id FROM Region WHERE nome = 'Crystal Cave')),
('The ghost-infested buildings of New Londo Ruins', (SELECT id FROM Region WHERE nome = 'New Londo Ruins')),
('The Four Kings'' arena in The Abyss', (SELECT id FROM Region WHERE nome = 'The Abyss')),
('Gwyn''s final battle arena in Kiln of the First Flame', (SELECT id FROM Region WHERE nome = 'Kiln of the First Flame')),
('The Asylum Demon''s arena in Northern Undead Asylum', (SELECT id FROM Region WHERE nome = 'Northern Undead Asylum'));


INSERT INTO Bonfire (kindle_level, bonfire_active, warp_ok, bonfire_reset_status, region_graph_node_position) VALUES
(1, TRUE, FALSE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Quelaag''s Domain%')),
(1, TRUE, FALSE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Giant Blacksmith''s forge%')),
(1, TRUE, FALSE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Moonlight Butterfly''s bridge%')),
(1, TRUE, FALSE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Sif''s grave site%')),
(1, TRUE, TRUE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Ceaseless Discharge''s domain%')),
(1, TRUE, FALSE, FALSE, (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%prison tower in The Duke''s Archives%'));

INSERT INTO RegionGraphEdge (origin_node, destination_node) VALUES
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%upper levels of the Undead Burg%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Taurus Demon''s bridge%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%lower levels of the Undead Burg%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Capra Demon''s narrow alley%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%main church area of the Undead Parish%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Channeler''s archive%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%entrance to The Depths%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%rat-infested tunnels%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%rat-infested tunnels%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%dark cavern of the Gaping Dragon%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%upper wooden structures of Blighttown%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%rickety scaffolding of upper Blighttown%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%poisonous swamp at the bottom of Blighttown%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Quelaag''s Domain%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%entrance to Sen''s Fortress%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%deadly pendulum room%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%grand entrance hall of Anor Londo%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Giant Blacksmith''s forge%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%cathedral interior of Anor Londo%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Gwyndolin''s illusion chamber%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%snowy courtyard of the Painted World%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%bridge guarded by the Undead Dragon%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%main forest area of Darkroot Garden%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Moonlight Butterfly''s bridge%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%main forest area of Darkroot Garden%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Sif''s grave site%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%lakeside area of Darkroot Basin%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Hydra''s lake%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%upper levels of The Catacombs%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Pinwheel''s lair%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%deeper areas of the Tomb of the Giants%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Patches'' betrayal point%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%lava-filled areas of Demon Ruins%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Ceaseless Discharge''s domain%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%lava-filled areas of Demon Ruins%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Centipede Demon''s arena%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%central chamber of Lost Izalith%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Bed of Chaos'' chamber%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%main library area of The Duke''s Archives%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%prison tower%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%treacherous pathways of Crystal Cave%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Seath''s crystal cave lair%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%flooded lower areas of New Londo Ruins%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%ghost-infested buildings%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%dark void of The Abyss%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Four Kings'' arena%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%ashen landscape of the Kiln of the First Flame%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Gwyn''s final battle arena%')),
((SELECT position FROM RegionGraphNode WHERE region_description LIKE '%crumbling corridors of Northern Undead Asylum%'), 
 (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%Asylum Demon''s arena%'));



INSERT INTO Item (nome, equip, tipo, soul_valor, can_sell) VALUES
('Longsword', TRUE, 'Weapon', 500, TRUE),
('Zweihander', TRUE, 'Weapon', 1000, TRUE),
('Uchigatana', TRUE, 'Weapon', 800, TRUE),
('Estoc', TRUE, 'Weapon', 600, TRUE),
('Claymore', TRUE, 'Weapon', 1000, TRUE);

INSERT INTO Weapon (item_id, damage, attack_recovery, poise, stamina_cost, attack_tipo, attack_speed, weapon_tipo, scaling, upgrade_level, upgrade_status, equipped)
SELECT id, 80, 20, 10, 20, 'Slash', 100, 'Straight Sword', 'C/C/-/-', 0, 'Normal', FALSE FROM Item WHERE nome = 'Longsword'
UNION ALL
SELECT id, 130, 40, 30, 50, 'Slash', 60, 'Ultra Greatsword', 'C/D/-/-', 0, 'Normal', FALSE FROM Item WHERE nome = 'Zweihander'
UNION ALL
SELECT id, 90, 25, 15, 30, 'Slash', 110, 'Katana', 'D/B/-/-', 0, 'Normal', FALSE FROM Item WHERE nome = 'Uchigatana'
UNION ALL
SELECT id, 75, 15, 8, 15, 'Thrust', 120, 'Thrusting Sword', 'D/C/-/-', 0, 'Normal', FALSE FROM Item WHERE nome = 'Estoc'
UNION ALL
SELECT id, 110, 30, 20, 40, 'Slash', 80, 'Greatsword', 'C/C/-/-', 0, 'Normal', FALSE FROM Item WHERE nome = 'Claymore';

INSERT INTO Item (nome, equip, tipo, soul_valor, can_sell) VALUES
('Elite Knight Helm', TRUE, 'Armor', 1000, TRUE),
('Elite Knight Armor', TRUE, 'Armor', 2000, TRUE),
('Elite Knight Gauntlets', TRUE, 'Armor', 800, TRUE),
('Elite Knight Leggings', TRUE, 'Armor', 1200, TRUE);

INSERT INTO Armor (item_id, equipped, tipo, defense_valor, defense_tipo)
SELECT id, FALSE, 'Head', 20, 'Physical' FROM Item WHERE nome = 'Elite Knight Helm'
UNION ALL
SELECT id, FALSE, 'Chest', 40, 'Physical' FROM Item WHERE nome = 'Elite Knight Armor'
UNION ALL
SELECT id, FALSE, 'Hands', 15, 'Physical' FROM Item WHERE nome = 'Elite Knight Gauntlets'
UNION ALL
SELECT id, FALSE, 'Legs', 25, 'Physical' FROM Item WHERE nome = 'Elite Knight Leggings';

INSERT INTO Item (nome, equip, tipo, soul_valor, can_sell) VALUES
('Estus Flask', FALSE, 'Consumable', 0, FALSE),
('Humanity', FALSE, 'Consumable', 1000, TRUE),
('Green Blossom', FALSE, 'Consumable', 500, TRUE),
('Firebomb', FALSE, 'Consumable', 100, TRUE);

INSERT INTO Consumable (item_id, effect, duration, valor)
SELECT id, 'Restore HP', 0, 300 FROM Item WHERE nome = 'Estus Flask'
UNION ALL
SELECT id, 'Restore HP and become Human', 0, 1 FROM Item WHERE nome = 'Humanity'
UNION ALL
SELECT id, 'Increase Stamina Recovery', 60, 0 FROM Item WHERE nome = 'Green Blossom'
UNION ALL
SELECT id, 'Throw Fire Damage', 0, 50 FROM Item WHERE nome = 'Firebomb';

INSERT INTO Item (nome, equip, tipo, soul_valor, can_sell) VALUES
('Soul Arrow', TRUE, 'Magic', 1000, TRUE),
('Heal', TRUE, 'Magic', 1500, TRUE);

INSERT INTO Magic (item_id, tipo, stamina_cost, quantity, equipped)
SELECT id, 'Sorcery', 20, 30, FALSE FROM Item WHERE nome = 'Soul Arrow'
UNION ALL
SELECT id, 'Miracle', 30, 5, FALSE FROM Item WHERE nome = 'Heal';


INSERT INTO MagicEffect (magic_id, tipo)
SELECT m.id, 'Damage'
FROM Magic m
JOIN Item i ON m.item_id = i.id
WHERE i.nome = 'Soul Arrow'
UNION ALL
SELECT m.id, 'Heal'
FROM Magic m
JOIN Item i ON m.item_id = i.id
WHERE i.nome = 'Heal';

INSERT INTO AttributeEffect (magic_effect_id, nome, valor, duration)
SELECT me.id, 'Magic Damage', 100, 0
FROM MagicEffect me
JOIN Magic m ON me.magic_id = m.id
JOIN Item i ON m.item_id = i.id
WHERE i.nome = 'Soul Arrow'
UNION ALL
SELECT me.id, 'HP Restore', 200, 0
FROM MagicEffect me
JOIN Magic m ON me.magic_id = m.id
JOIN Item i ON m.item_id = i.id
WHERE i.nome = 'Heal';

-- Inserting Rings
INSERT INTO Item (nome, equip, tipo, soul_valor, can_sell) VALUES
('Ring of Favor and Protection', TRUE, 'Ring', 5000, TRUE),
('Havel''s Ring', TRUE, 'Ring', 5000, TRUE);

INSERT INTO Ring (item_id, is_broken, equipped)
SELECT id, FALSE, FALSE FROM Item WHERE nome = 'Ring of Favor and Protection'
UNION ALL
SELECT id, FALSE, FALSE FROM Item WHERE nome = 'Havel''s Ring';

INSERT INTO RingEffect (ring_id, attribute, valor)
SELECT r.id, 'HP', 20
FROM Ring r
JOIN Item i ON r.item_id = i.id
WHERE i.nome = 'Ring of Favor and Protection'
UNION ALL
SELECT r.id, 'Stamina', 20
FROM Ring r
JOIN Item i ON r.item_id = i.id
WHERE i.nome = 'Ring of Favor and Protection'
UNION ALL
SELECT r.id, 'Equip Load', 20
FROM Ring r
JOIN Item i ON r.item_id = i.id
WHERE i.nome = 'Ring of Favor and Protection'
UNION ALL
SELECT r.id, 'Equip Load', 50
FROM Ring r
JOIN Item i ON r.item_id = i.id
WHERE i.nome = 'Havel''s Ring';

-- Inserting Enemies
INSERT INTO Personagem (nome, tipo, hp_total, stamina_total, poise_resistance) VALUES
('Hollow Soldier', 'Enemy', 100, 100, 20),
('Balder Knight', 'Enemy', 200, 150, 40),
('Black Knight', 'Enemy', 500, 200, 80),
('Capra Demon', 'Boss', 1000, 300, 100),
('Ornstein', 'Boss', 2000, 500, 150);

INSERT INTO NPC (personagem_id, weakness, resistance, tipo, hp, respawn, hp_atual, stamina_atual)
SELECT id, 'Fire', 'None', 'Normal', 100, TRUE, 100, 100 FROM Personagem WHERE nome = 'Hollow Soldier'
UNION ALL
SELECT id, 'Lightning', 'Slash', 'Normal', 200, TRUE, 200, 150 FROM Personagem WHERE nome = 'Balder Knight'
UNION ALL
SELECT id, 'None', 'Fire', 'Mini-Boss', 500, FALSE, 500, 200 FROM Personagem WHERE nome = 'Black Knight'
UNION ALL
SELECT id, 'Fire', 'Slash', 'Boss', 1000, FALSE, 1000, 300 FROM Personagem WHERE nome = 'Capra Demon'
UNION ALL
SELECT id, 'Fire', 'Lightning', 'Boss', 2000, FALSE, 2000, 500 FROM Personagem WHERE nome = 'Ornstein';

-- Updating enemy positions
UPDATE NPC 
SET position = (
    SELECT position 
    FROM RegionGraphNode 
    WHERE region_description LIKE '%upper levels of the Undead Burg%'
    LIMIT 1
)
WHERE personagem_id = (SELECT id FROM Personagem WHERE nome = 'Hollow Soldier');

UPDATE NPC 
SET position = (
    SELECT position 
    FROM RegionGraphNode 
    WHERE region_description LIKE '%Undead Parish%'
    LIMIT 1
)
WHERE personagem_id = (SELECT id FROM Personagem WHERE nome = 'Balder Knight');

UPDATE NPC 
SET position = (
    SELECT position 
    FROM RegionGraphNode 
    WHERE region_description LIKE '%Undead Burg%'
    LIMIT 1
)
WHERE personagem_id = (SELECT id FROM Personagem WHERE nome = 'Black Knight');

UPDATE NPC 
SET position = (
    SELECT position 
    FROM RegionGraphNode 
    WHERE region_description LIKE '%Capra Demon''s narrow alley%'
    LIMIT 1
)
WHERE personagem_id = (SELECT id FROM Personagem WHERE nome = 'Capra Demon');

UPDATE NPC 
SET position = (
    SELECT position 
    FROM RegionGraphNode 
    WHERE region_description LIKE '%cathedral interior of Anor Londo%'
    LIMIT 1
)
WHERE personagem_id = (SELECT id FROM Personagem WHERE nome = 'Ornstein');