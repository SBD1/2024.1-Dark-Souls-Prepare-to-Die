INSERT INTO Region (nome, description) VALUES
('Northern Undead Asylum', 'The Northern Undead Asylum situa-se no extremo Norte. Serve como uma prisão gigante para os mortos-vivos marcados com o Sinal Negro, permitindo-lhes renascer após a morte. Todos os mortos-vivos são encurralados e levados para o Asilo, onde devem permanecer até ao fim do mundo. Em lendas antigas, diz-se que um dia um morto-vivo em particular será escolhido (então conhecido como o morto-vivo escolhido) para escapar do asilo e ir em peregrinação a Lordran, terra dos deuses antigos. O morto-vivo escolhido é equipado com uma chave única.
Fugir de uma cela não garante o sucesso, pois o Demónio do Asilo vigia a porta principal do Asilo. O demónio guardião empunha um martelo esculpido em pedra de arcada. O Corvo (embora normalmente referido como um corvo) que espera do lado de fora é o mensageiro do Firelink, guiando os mortos-vivos para a terra dos deuses antigos.');

INSERT INTO RegionGraphNode(region_description,region_id) VALUES
('Basement Floor na entrada de Northern Undead Asylum',1),
('Sala do Chefe logo após abrir o portão de ao fim do corredor', 2);

INSERT INTO RegionGraphEdge(origin_node,destination_node) VALUES
(1,2) -- Basement Floor -> Boss Room; 

INSERT INTO Personagem (nome, tipo, hp_total, stamina_total, poise_resistance)
VALUES ('Kett', 'PC', 100, 50, 30);

-- Insere e retorna o ID gerado
WITH new_personagem AS (
    INSERT INTO Personagem (nome, tipo, hp_total, stamina_total, poise_resistance)
    VALUES ('Kett', 'PC', 100, 50, 30)
    RETURNING id
)
SELECT id FROM new_personagem;

INSERT INTO PC (personagem_id, class_id, gift, vitality, attunement, endurance, strength, dexterity, intelligence, faith, humanity, equip_load, attunement_slot, position, pc_level, hp_atual, stamina_atual)
VALUES (1, 1, 'Master Key', 6, 9, 14, 9, 11, 6, 9, 8, NULL, 1, 100, 50);

INSERT INTO PC (personagem_id, class_id, gift, vitality, attunement, endurance, strength, dexterity, intelligence, faith, humanity, equip_load, attunement_slot, position, pc_level, hp_atual, stamina_atual)
VALUES (1, 1, 'Master Key', 6, 9, 14, 9, 11, 6, 9, 8, NULL, 1, 100, 50);

INSERT INTO Class (nome, base_level, base_vit, base_dex, base_att, base_end, base_str, base_int, base_fai)
VALUES ('Thief', 6, 9, 14, 9, 11, 6, 9, 8);

