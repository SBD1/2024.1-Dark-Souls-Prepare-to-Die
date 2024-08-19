-- Criar uma função para consultar itens em um inventário específico
CREATE OR REPLACE FUNCTION consultar_itens_em_inventario(inventory_id INT)
RETURNS TABLE(item_nome TEXT, item_tipo TEXT, quantity INT) AS $$
BEGIN
    RETURN QUERY
    SELECT i.nome AS item_nome, i.tipo AS item_tipo, ii.quantity
    FROM Item i
    JOIN InventoryItem ii ON i.id = ii.item_instance_id
    WHERE ii.inventory_id = inventory_id;
END;
$$ LANGUAGE plpgsql;

-- Criar uma função para consultar personagens em uma região
CREATE OR REPLACE FUNCTION consultar_personagens_em_regiao(region_id INT)
RETURNS TABLE(personagem_nome TEXT, tipo_personagem TEXT, regiao_nome TEXT) AS $$
BEGIN
    RETURN QUERY
    SELECT p.nome AS personagem_nome, p.tipo AS tipo_personagem, r.nome AS regiao_nome
    FROM Personagem p
    JOIN RegionGraphNode rg ON p.id = rg.position
    JOIN Region r ON rg.region_id = r.id
    WHERE r.id = region_id;
END;
$$ LANGUAGE plpgsql;

-- Criar uma função para consultar o inventário de um personagem específico
CREATE OR REPLACE FUNCTION consultar_inventario_de_personagem(personagem_id INT)
RETURNS TABLE(item_nome TEXT, item_tipo TEXT, quantidade INT) AS $$
BEGIN
    RETURN QUERY
    SELECT i.nome AS item_nome, i.tipo AS item_tipo, ii.quantity
    FROM InventoryItem ii
    JOIN Item i ON ii.item_instance_id = i.id
    JOIN Inventory inv ON ii.inventory_id = inv.id
    WHERE inv.personagem_id = personagem_id;
END;
$$ LANGUAGE plpgsql;

-- Criar uma função para consultar itens de um tipo específico
CREATE OR REPLACE FUNCTION consultar_itens_por_tipo(item_tipo TEXT)
RETURNS TABLE(item_nome TEXT, equip BOOLEAN, tipo TEXT) AS $$
BEGIN
    RETURN QUERY
    SELECT i.nome AS item_nome, i.equip, i.tipo
    FROM Item i
    WHERE i.tipo = item_tipo;
END;
$$ LANGUAGE plpgsql;

-- Criar uma função para consultar NPCs em uma região específica
CREATE OR REPLACE FUNCTION consultar_npcs_em_regiao(region_id INT)
RETURNS TABLE(npc_nome TEXT, npc_tipo TEXT) AS $$
BEGIN
    RETURN QUERY
    SELECT n.nome AS npc_nome, n.tipo AS npc_tipo
    FROM NPC n
    JOIN RegionGraphNode rg ON n.position = rg.position
    WHERE rg.region_id = region_id;
END;
$$ LANGUAGE plpgsql;

-- Criar uma função para consultar a vida (HP atual e total) de um personagem específico
CREATE OR REPLACE FUNCTION consultar_hp_personagem(personagem_id INT)
RETURNS TABLE(personagem_nome TEXT, hp_atual INT, hp_total INT) AS $$
BEGIN
    RETURN QUERY
    SELECT p.nome AS personagem_nome, p.hp_total AS hp_total, COALESCE(pc.hp_atual, npc.hp_atual) AS hp_atual
    FROM Personagem p
    LEFT JOIN PC pc ON p.id = pc.personagem_id
    LEFT JOIN NPC npc ON p.id = npc.personagem_id
    WHERE p.id = personagem_id;
END;
$$ LANGUAGE plpgsql;

-- Criar uma função para consultar a stamina (stamina atual e total) de um personagem específico
CREATE OR REPLACE FUNCTION consultar_stamina_personagem(personagem_id INT)
RETURNS TABLE(personagem_nome TEXT, stamina_atual INT, stamina_total INT) AS $$
BEGIN
    RETURN QUERY
    SELECT p.nome AS personagem_nome, COALESCE(pc.stamina_atual, npc.stamina_atual) AS stamina_atual, p.stamina_total AS stamina_total
    FROM Personagem p
    LEFT JOIN PC pc ON p.id = pc.personagem_id
    LEFT JOIN NPC npc ON p.id = npc.personagem_id
    WHERE p.id = personagem_id;
END;
$$ LANGUAGE plpgsql;

-- Criar uma função para consultar os atributos de uma arma específica
CREATE OR REPLACE FUNCTION consultar_atributos_weapon(weapon_id INT)
RETURNS TABLE(
    damage INT,
    attack_recovery INT,
    poise INT,
    stamina_cost INT,
    attack_tipo TEXT,
    attack_speed INT,
    weapon_tipo TEXT,
    scaling TEXT,
    upgrade_level INT,
    upgrade_status TEXT,
    equipped BOOLEAN
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        w.damage,
        w.attack_recovery,
        w.poise,
        w.stamina_cost,
        w.attack_tipo,
        w.attack_speed,
        w.weapon_tipo,
        w.scaling,
        w.upgrade_level,
        w.upgrade_status,
        w.equipped
    FROM Weapon w
    WHERE w.id = weapon_id;
END;
$$ LANGUAGE plpgsql;

-- Criar uma função para consultar os atributos de uma armadura específica
CREATE OR REPLACE FUNCTION consultar_atributos_armor(armor_id INT)
RETURNS TABLE(
    equipped BOOLEAN,
    tipo TEXT,
    defense_valor INT,
    defense_tipo TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        a.equipped,
        a.tipo,
        a.defense_valor,
        a.defense_tipo
    FROM Armor a
    WHERE a.id = armor_id;
END;
$$ LANGUAGE plpgsql;

-- Criar uma função para consultar os atributos de um anel específico
CREATE OR REPLACE FUNCTION consultar_atributos_ring(ring_id INT)
RETURNS TABLE(
    is_broken BOOLEAN,
    equipped BOOLEAN
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        r.is_broken,
        r.equipped
    FROM Ring r
    WHERE r.id = ring_id;
END;
$$ LANGUAGE plpgsql;

-- Criar uma função para consultar os atributos de uma magia específica
CREATE OR REPLACE FUNCTION consultar_atributos_magic(magic_id INT)
RETURNS TABLE(
    tipo TEXT,
    stamina_cost INT,
    quantity INT,
    equipped BOOLEAN
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        m.tipo,
        m.stamina_cost,
        m.quantity,
        m.equipped
    FROM Magic m
    WHERE m.id = magic_id;
END;
$$ LANGUAGE plpgsql;

-- Criar uma função para consultar os efeitos de magia específicos
CREATE OR REPLACE FUNCTION consultar_efeitos_magic(magic_id INT)
RETURNS TABLE(tipo TEXT) AS $$
BEGIN
    RETURN QUERY
    SELECT me.tipo
    FROM MagicEffect me
    WHERE me.magic_id = magic_id;
END;
$$ LANGUAGE plpgsql;

-- Criar uma função para consultar os efeitos de atributos de um efeito de magia específico
CREATE OR REPLACE FUNCTION consultar_efeitos_atributo(magic_effect_id INT)
RETURNS TABLE(nome TEXT, valor INT, duration INT) AS $$
BEGIN
    RETURN QUERY
    SELECT ae.nome, ae.valor, ae.duration
    FROM AttributeEffect ae
    WHERE ae.magic_effect_id = magic_effect_id;
END;
$$ LANGUAGE plpgsql;

-- Consultar arestas onde o nó é o nó de origem
SELECT
    rge.edge AS edge_id,
    rge.destination_node AS destination_node_id,
    rgn.region_description AS destination_node_description
FROM
    RegionGraphEdge rge
JOIN
    RegionGraphNode rgn
ON
    rge.destination_node = rgn.position
WHERE
    rge.origin_node = $1;

-- Consultar arestas onde o nó é o nó de destino
SELECT
    rge.edge AS edge_id,
    rge.origin_node AS origin_node_id,
    rgn.region_description AS origin_node_description
FROM
    RegionGraphEdge rge
JOIN
    RegionGraphNode rgn
ON
    rge.origin_node = rgn.position
WHERE
    rge.destination_node = $1;

-- Consultar Armas equipadas
SELECT i.id, i.nome, w.damage, w.attack_recovery, w.poise, w.stamina_cost, w.attack_tipo, w.attack_speed
FROM InventoryItem ii
JOIN Weapon w ON ii.item_instance_id = w.id
JOIN Item i ON w.item_id = i.id
WHERE ii.inventory_id IN (
    SELECT id FROM Inventory WHERE personagem_id = $1
) AND w.equipped = TRUE;

-- Consultar Magias equipadas
SELECT i.id, i.nome, m.tipo, m.stamina_cost, m.quantity
FROM InventoryItem ii
JOIN Magic m ON ii.item_instance_id = m.id
JOIN Item i ON m.item_id = i.id
WHERE ii.inventory_id IN (
    SELECT id FROM Inventory WHERE personagem_id = $1
) AND m.equipped = TRUE;

-- Consultar Anéis equipados
SELECT i.id, i.nome, r.is_broken, r.equipped
FROM InventoryItem ii
JOIN Ring r ON ii.item_instance_id = r.id
JOIN Item i ON r.item_id = i.id
WHERE ii.inventory_id IN (
    SELECT id FROM Inventory WHERE personagem_id = $1
) AND r.equipped = TRUE;

-- Consultar Armaduras equipadas
SELECT i.id, i.nome, a.defense_valor, a.defense_tipo
FROM InventoryItem ii
JOIN Armor a ON ii.item_instance_id = a.id
JOIN Item i ON a.item_id = i.id
WHERE ii.inventory_id IN (
    SELECT id FROM Inventory WHERE personagem_id = $1
) AND a.equipped = TRUE;

-- Criar uma função para consultar os atributos de uma Bonfire
CREATE OR REPLACE FUNCTION consultar_atributos_bonfire(bonfire_id INT)
RETURNS TABLE(
    kindle_level INT,
    bonfire_active BOOLEAN,
    warp_ok BOOLEAN,
    bonfire_reset_status BOOLEAN,
    region_graph_node_position INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        b.kindle_level,
        b.bonfire_active,
        b.warp_ok,
        b.bonfire_reset_status,
        b.region_graph_node_position
    FROM Bonfire b
    WHERE b.id = bonfire_id;
END;
$$ LANGUAGE plpgsql;

-- Consultar se um node possui uma Bonfire associada
SELECT
    rgn.position,
    rgn.region_description,
    rgn.region_id,
    b.id AS bonfire_id,
    b.kindle_level,
    b.bonfire_active,
    b.warp_ok,
    b.bonfire_reset_status
FROM RegionGraphNode rgn
LEFT JOIN Bonfire b
ON rgn.position = b.region_graph_node_position
WHERE rgn.position = $1;

-- Consultar nome, valor e se é possível vender um tipo de item específico
CREATE OR REPLACE FUNCTION consultar_atributos_item(item_id INT)
RETURNS TABLE (
    nome TEXT,
    soul_valor INT,
    can_sell BOOLEAN
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        i.nome,
        COALESCE(s.soul_valor, NULL) AS soul_valor,
        i.can_sell
    FROM 
        Item i
    LEFT JOIN
        Soul s ON i.id = s.item_id
    WHERE 
        i.id = item_id;
END;
$$ LANGUAGE plpgsql;
