-- Insertion d'un client
INSERT INTO client (id_client, nom_client, age, cp_client) VALUES (11, 'Test Client', 32, 12345);

-- Insertion d'une focaccia 
INSERT INTO focaccia (id_focaccia, nom_focaccia, prix_focaccia) VALUES (9, 'Test Focaccia', 11.5);

-- Insertion d'un menu
INSERT INTO menu (id_menu, nom_menu, prix_menu, id_focaccia) VALUES (9, 'Test Menu', 15.0, 9);

-- Insertion d'une boisson
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES (13, 'Test Boisson', 1);

-- Insertion d'une commande (client test achetant un menu test)
INSERT INTO paye (id_client, id_menu, jour) VALUES (11, 9, '2024-09-21');

-- Insertion d'une focaccia test dans la table achete
INSERT INTO achete (id_client, id_focaccia, jour) VALUES (11, 9, '2024-09-21');
