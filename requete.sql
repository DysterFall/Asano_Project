Create database projet;
use projet;

/*Requetes*/


/*
Restaurant
*/
create table restaurant(
    id_restaurant int not null AUTO_INCREMENT,
    nom varchar(90),
    type_restaurant varchar(90),
    description_restaurant varchar(255),
    CONSTRAINT pk_restaurant PRIMARY KEY(id_restaurant)
);
ALTER TABLE restaurant ENGINE = InnoDB;


/*
restaurateur
*/
create table restaurateur(
    id_restaurateur int not null AUTO_INCREMENT,
    nom varchar(90),
    client_id int,  
   	restaurant_id int,
    FOREIGN KEY(restaurant_id) REFERENCES restaurant(id_restaurant),
    FOREIGN KEY(client_id) REFERENCES client(id_client),
   CONSTRAINT pk_restaurateur PRIMARY KEY (id_restaurateur)
   );
ALTER TABLE restaurateur ENGINE = InnoDB;

/*
Gallerie
*/

create table photos(
    id_photo int not null AUTO_INCREMENT,
    restaurant_id int,
    courte_desc varchar (90),
    url_photo varchar (255),
    FOREIGN key(restaurant_id) REFERENCES restaurant(id_restaurant),
    CONSTRAINT pk_photos PRIMARY key (id_photo)
);
ALTER TABLE photos ENGINE = InnoDB;


/*
Plats
*/

create table plats(
    id_plats int not null AUTO_INCREMENt,
    nom varchar(90),
    prix DECIMAL(10, 2),
    description_plats varchar(255),
    ingredients varchar(255),
    allergenes varchar(255),
    quantité int,
    restaurant_id int, 
    FOREIGN key(restaurant_id) REFERENCES restaurant(id_restaurant),
    CONSTRAINT pk_plays PRIMARY key(id_plats)
);
ALTER TABLE plats ENGINE = InnoDB;

/*
formules
*/

create table formules(
    id_formules int not null AUTO_INCREMENT,
    nom varchar(90),
    prix varchar(255),
    description_formules varchar(255),
    restaurant_id int,
    FOREIGN key (restaurant_id) REFERENCES restaurant(id_restaurant),
    CONSTRAINT pk_formules PRIMARY key(id_formules)
);
ALTER TABLE formules ENGINE = InnoDB;

/*
Formule composition
*/

create table compo_formules(
    id_compo_formules int not null AUTO_INCREMENT,
    formules_id int,
    plats_id int,
    FOREIGN key (formules_id) REFERENCES formules(id_formules),
    FOREIGN key(plats_id) REFERENCES plats(id_plats),
    CONSTRAINT pk_compo_formules PRIMARY key (id_compo_formules)
);
ALTER TABLE compo_formules ENGINE = InnoDB;


/*
formules limités
*/

create table limited_formules(
    id_limited_formules int not null AUTO_INCREMENT,
    formules_id int,
    date_début date,
    date_fin date,
    FOREIGN key (formules_id) REFERENCES formules(id_formules),
    CONSTRAINT pk_limited_formules PRIMARY key (id_limited_formules)
);
ALTER TABLE limited_formules ENGINE = InnoDB;

/*
Notes
*/

create table note(
    id_note int not null AUTO_INCREMENT,
    plats_id int,
    note int CHECK (note >= 1 AND note <= 5),
    commentaire varchar(255),
    FOREIGN key (plats_id) REFERENCES plats(id_plats),
    CONSTRAINT pk_note PRIMARY key(id_note)
);
ALTER TABLE note ENGINE = InnoDB;

/*
LES INSERTS
*/

/* Restaurant */
INSERT INTO restaurant (nom, description_restaurant, type_restaurant)
VALUES
    ('Restaurant 1', 'Description du Restaurant 1', 'Cuisine 1'),
    ('Restaurant 2', 'Description du Restaurant 2', 'Cuisine 2'),
    ('Restaurant 3', 'Description du Restaurant 3', 'Cuisine 3'),
    ('Restaurant 4', 'Description du Restaurant 4', 'Cuisine 4'),
    ('Restaurant 5', 'Description du Restaurant 5', 'Cuisine 5'),
    ('Restaurant 6', 'Description du Restaurant 6', 'Cuisine 6'),
    ('Restaurant 7', 'Description du Restaurant 7', 'Cuisine 7'),
    ('Restaurant 8', 'Description du Restaurant 8', 'Cuisine 8'),
    ('Restaurant 9', 'Description du Restaurant 9', 'Cuisine 9'),
    ('Restaurant 10', 'Description du Restaurant 10', 'Cuisine 10');

/*Photos*/
INSERT INTO Photos (restaurant_id, courte_desc, url_photo)
VALUES
    (1, 'Photo 1 du Restaurant 1', 'url_de_la_photo_1'),
    (1, 'Photo 2 du Restaurant 1', 'url_de_la_photo_2'),
    (2, 'Photo 1 du Restaurant 2', 'url_de_la_photo_3'),
    (2, 'Photo 2 du Restaurant 2', 'url_de_la_photo_4'),
    (3, 'Photo 1 du Restaurant 3', 'url_de_la_photo_5'),
    (3, 'Photo 2 du Restaurant 3', 'url_de_la_photo_6'),
    (4, 'Photo 1 du Restaurant 4', 'url_de_la_photo_7'),
    (4, 'Photo 2 du Restaurant 4', 'url_de_la_photo_8'),
    (5, 'Photo 1 du Restaurant 5', 'url_de_la_photo_9'),
    (5, 'Photo 2 du Restaurant 5', 'url_de_la_photo_10');

/*Plats*/
INSERT INTO plats (nom, prix, description_plats, ingredients, allergenes, quantité, restaurant_id)
VALUES
    ('Plat 1', 15.99, 'Description du Plat 1', 'Ingrédients du Plat 1', 'Allergènes du Plat 1', 50, 1),
    ('Plat 2', 12.50, 'Description du Plat 2', 'Ingrédients du Plat 2', 'Allergènes du Plat 2', 30, 1),
    ('Plat 3', 18.75, 'Description du Plat 3', 'Ingrédients du Plat 3', 'Allergènes du Plat 3', 40, 2),
    ('Plat 4', 14.99, 'Description du Plat 4', 'Ingrédients du Plat 4', 'Allergènes du Plat 4', 60, 2),
    ('Plat 5', 21.50, 'Description du Plat 5', 'Ingrédients du Plat 5', 'Allergènes du Plat 5', 25, 3),
    ('Plat 6', 17.25, 'Description du Plat 6', 'Ingrédients du Plat 6', 'Allergènes du Plat 6', 35, 3),
    ('Plat 7', 19.99, 'Description du Plat 7', 'Ingrédients du Plat 7', 'Allergènes du Plat 7', 45, 4),
    ('Plat 8', 13.75, 'Description du Plat 8', 'Ingrédients du Plat 8', 'Allergènes du Plat 8', 20, 4),
    ('Plat 9', 24.50, 'Description du Plat 9', 'Ingrédients du Plat 9', 'Allergènes du Plat 9', 55, 5),
    ('Plat 10', 22.99, 'Description du Plat 10', 'Ingrédients du Plat 10', 'Allergènes du Plat 10', 30, 5);

/*Formules*/
INSERT INTO Formules (nom, description_formules, prix, restaurant_id)
VALUES
    ('Formule 1 du Restaurant 1', 'Description de la Formule 1', 25.99, 1), 
    ('Formule 2 du Restaurant 1', 'Description de la Formule 2', 29.99, 1), 
    ('Formule 1 du Restaurant 2', 'Description de la Formule 1', 23.99, 2), 
    ('Formule 2 du Restaurant 2', 'Description de la Formule 2', 27.99, 2), 
    ('Formule 1 du Restaurant 3', 'Description de la Formule 1', 22.99, 3), 
    ('Formule 2 du Restaurant 3', 'Description de la Formule 2', 26.99, 3), 
    ('Formule 1 du Restaurant 4', 'Description de la Formule 1', 21.99, 4), 
    ('Formule 2 du Restaurant 4', 'Description de la Formule 2', 25.99, 4), 
    ('Formule 1 du Restaurant 5', 'Description de la Formule 1', 30.99, 5), 
    ('Formule 2 du Restaurant 5', 'Description de la Formule 2', 34.99, 5); 

/*Compos formules*/
INSERT INTO compo_formules (formules_id, plats_id)
VALUES
    (1, 1),   
    (1, 2),   
    (2, 3),   
    (2, 4),   
    (3, 5),   
    (3, 6),   
    (4, 7),
    (4, 8),   
    (5, 9),   
    (5, 10);  

/*limited formules*/
INSERT INTO limited_formules (formules_id, date_début, date_fin)
VALUES
    (1, '2017-01-01', '2023-01-31'),  
    (2, '20218-02-01', '2023-02-28'),  
    (3, '20219-03-01', '2023-03-31'),  
    (4, '2020-04-01', '2023-04-30'),  
    (5, '2022-05-01', '2023-05-31'),  
    (6, '2021-06-01', '2023-06-30'),  
    (7, '2015-07-01', '2023-07-31'),  
    (8, '20214-08-01', '2023-08-31'),  
    (9, '2017-09-01', '2023-09-30'),  
    (10, '2012-10-01', '2023-10-31');

/*Notes*/
INSERT INTO Note (plats_id, note, commentaire)
VALUES
    (1, 4, 'Très bon plat!'),
    (2, 5, 'Excellent plat!'),
    (3, 3, 'Pas mal du tout.'),
    (4, 4, 'Délicieux!'),
    (5, 2, 'Peut mieux faire.'),
    (6, 4, 'Bon goût.'),
    (7, 5, 'J adore ce plat!'),
    (8, 4, 'Vraiment savoureux.'),
    (9, 3, 'Un peu fade.'),
    (10, 5, 'Le meilleur plat que j ai jamais goûté!');

/*Requete 6*/



/*CLients*/
CREATE TABLE clients (
    id_client INT not null AUTO_INCREMENT,
    nom VARCHAR(90),
    prenom VARCHAR(90),
    email VARCHAR(255),
    mot_de_passe VARCHAR(255),
    date_anniversaire DATE,
    adresse varchar(255),
    email_valide boolean default false, 
    abus boolean default false,
    parrain_id int ,
    reduction_parrain DECIMAL(4,2) DEFAULT 0.05,
    reduction_anniversaire DECIMAL(4,2) DEFAULT 0.10,
    carnet_adresses varchar(255),
    CONSTRAINT pk_client PRIMARY key(id_client),
    CONSTRAINT fk_parrain FOREIGN KEY (parrain_id) REFERENCES Clients (id_client)
);
ALTER TABLE clients ENGINE = InnoDB;


/*Insert*/
INSERT INTO Clients (nom, prenom, email, mot_de_passe, date_anniversaire, adresse, email_valide, abus, parrain_id)
VALUES
    ('Jean', 'Dupont', 'jean.dupont@email.com', 'motdepasse1', '2002-04-15', '8 rue de la gare Paris', 1, 0, 1),
    ('Marie', 'Martin', 'marie.martin@email.com', 'motdepasse2', '2001-07-20', '15 rue des champs Paris ', 1, 0, NULL),
    ('Pierre', 'Lambert', 'pierre.lambert@email.com', 'motdepasse3', '1993-03-10', '4 rue du port Marseille', 1, 0, NULL),
    ('Sophie', 'Lefebvre', 'sophie.lefebvre@email.com', 'motdepasse4', '2003-05-12', '22 rue des invalides Paris', 1, 0, NULL),
    ('Thomas', 'Martin', 'thomas.martin@email.com', 'motdepasse5', '1987-08-25', '64 rue des pouilles Beauvais', 1, 0, NULL),
    ('Camille', 'Lavoie', 'camille.lavoie@email.com', 'motdepasse6', '1992-11-30', '27 avenue palace Paris', 1, 0, NULL),
    ('Lucie', 'Gagnon', 'lucie.gagnon@email.com', 'motdepasse7', '2000-04-05', '55 rue des portes Beauvais', 1, 0, 1),
    ('François', 'Tremblay', 'francois.tremblay@email.com', 'motdepasse8', '1998-06-15', '14 rue des ecoles Paris', 1, 0, 1),
    ('Isabelle', 'Dubois', 'isabelle.dubois@email.com', 'motdepasse9', '1981-12-01', '36 rue Jean Moulin Marseille', 1, 0, NULL),
    ('Éric', 'Leblanc', 'eric.leblanc@email.com', 'motdepasse10', '2004-09-10', '2 rue du stade Beauvais', 1, 0, 1);



/*commandes*/
CREATE TABLE commandes (
    id_commande INT not null AUTO_INCREMENT,
    client_id INT,
    livreur_id INT,
    date_commande DATE,
    date_livraison DATE,
    mode_paiement VARCHAR(20),  
    id_transaction VARCHAR(255),
    adresse_livraison varchar(255), 
    facture_id INT,
    FOREIGN KEY (client_id) REFERENCES Clients(id_client),
    FOREIGN KEY (livreur_id) REFERENCES Livreurs(id_livreur),
    FOREIGN KEY (facture_id) REFERENCES Factures(id_facture),
    CONSTRAINT pk_commande PRIMARY key(id_commande)
);
ALTER TABLE commandes ENGINE = InnoDB;


/*insert*/
INSERT INTO Commandes (client_id, livreur_id, date_commande, date_livraison, mode_paiement, id_transaction, adresse_livraison, facture_id)
VALUES
    (1, 1, '2020-02-01', '2020-02-02', 'Carte de crédit', 'TRAN001', '8 rue de la gare Paris', 1),
    (1, 1, '2020-02-13', '2020-02-15 ', 'PayPal', 'TRAN002', '15 rue des champs Paris', 2),
    (3, 3, '2020-02-16 ', '2020-02-21 ', 'Carte de crédit', 'TRAN003', '4 rue du port Marseille', 3),
    (4, 4, '2021-6-22', '2023-8-08 ', 'PayPal', 'TRAN004', '22 rue des invalides Paris', 4),
    (5, 5, '2021-7-05 ', '2023-9-09', 'Carte de crédit', 'TRAN005', '64 rue des pouilles Beauvais', 5),
    (6, 6, '2021-9-06 ', '2023-9-10', 'PayPal', 'TRAN006', '27 avenue palace Paris', 6),
    (7, 7, '2023-7-07 ', '2023-9-11 ', 'Carte de crédit', 'TRAN007', '55 rue des portes Beauvais', 7),
    (8, 8, '2021-10-08 ', '2023-10-12', 'PayPal', 'TRAN008', '14 rue des ecoles Paris', 8),
    (9, 9, '2022-10-09 ', '2022-10-13', 'Carte de crédit', 'TRAN009', '36 rue Jean Moulin Marseille', 9),
    (10, 10, '2023-6-25', '2023-9-14 ', 'PayPal', 'TRAN010', '2 rue du stade Beauvais', 10);

    /*Livreurs*/

    CREATE TABLE livreurs (
        id_livreur INT not null AUTO_INCREMENT ,
        nom VARCHAR(90),
        adresse varchar(255),
        type_permis VARCHAR(10),
        date_obtention_permis DATE,
        date_visite_medicale DATE,
        zone_livraison_geographique varchar(255),
        distance varchar(255),
        CONSTRAINT pk_livreur PRIMARY key(id_livreur)
    );
ALTER TABLE livreurs ENGINE = InnoDB;

    /*insert*/
    INSERT INTO Livreurs (nom, adresse, type_permis, date_obtention_permis, date_visite_medicale, zone_livraison_geographique, distance)
    VALUES
        ('Jean Dupont', 'Adresse : 123 Rue de la Livraison, Ville', 'Permis B', '2020-01-15', '2023-01-15', 'Zone A : Coordonnées géographiques','4000km'),
        ('Marie Martin', 'Adresse : 456 Avenue des Livraisons, Ville', 'Permis C', '2019-07-20', '2023-07-20', 'Zone B : Coordonnées géographiques', '1800km'),
        ('Pierre Lambert', 'Adresse : 789 Rue des Colis, Ville', 'Permis B', '2021-03-10', '2023-03-10', 'Zone C : Coordonnées géographiques', '2100km'),
        ('Sophie Lefebvre', 'Adresse : 1010 Boulevard de la Distribution, Ville', 'Permis C', '2018-05-12', '2023-05-12', 'Zone D : Coordonnées géographiques', '2400km'),
        ('Thomas Martin', 'Adresse : 222 Avenue des Paquets, Ville', 'Permis B', '2020-08-25', '2023-08-25', 'Zone E : Coordonnées géographiques', '2700km'),
        ('Camille Lavoie', 'Adresse : 333 Rue des Colis, Ville', 'Permis C', '2019-11-30', '2023-11-30', 'Zone F : Coordonnées géographiques', '3000km'),
        ('Lucie Gagnon', 'Adresse : 444 Rue de la Logistique, Ville', 'Permis B', '2022-04-05', '2023-04-05', 'Zone G : Coordonnées géographiques', '3300km' ),
        ('François Tremblay', 'Adresse : 555 Boulevard de la Livraison, Ville', 'Permis C', '2017-06-15', '2023-06-15', 'Zone H : Coordonnées géographiques', '3600km'),
        ('Isabelle Dubois', 'Adresse : 666 Avenue des Colis, Ville', 'Permis B', '2020-12-01', '2023-12-01', 'Zone I : Coordonnées géographiques', '3900km'),
        ('Éric Leblanc', 'Adresse : 777 Rue des Paquets, Ville', 'Permis C', '2019-09-10', '2023-09-10', 'Zone J : Coordonnées géographiques', '4200km');


/*factures*/
CREATE TABLE factures (
    id_facture INT NOT NULL AUTO_INCREMENT,
    commande_id INT NOT NULL,
    reglee BOOLEAN,
    FOREIGN KEY (commande_id) REFERENCES commandes(id_commande),
    CONSTRAINT pk_facture PRIMARY KEY (id_facture)
);
ALTER TABLE factures ENGINE = InnoDB;

/*Avoirs*/
CREATE TABLE Avoirs (
    id_avoir INT NOT NULL AUTO_INCREMENT,
    code VARCHAR(50),
    montant DECIMAL(3, 2) NOT NULL,
    avoir_utilisé BOOLEAN,
    client_id INT,
    CONSTRAINT pk_avoir PRIMARY KEY (id_avoir),
    FOREIGN key(client_id) REFERENCES clients(id_client)
);
ALTER TABLE Avoirs ENGINE = InnoDB;

/*Insert*/
INSERT INTO factures (commande_id, reglee)
VALUES
    (1, TRUE),
    (2, TRUE),
    (3, TRUE),
    (4, TRUE),
    (5, TRUE),
    (6, TRUE),
    (7, TRUE),
    (8, TRUE),
    (9, TRUE),
    (10, TRUE);

INSERT INTO Avoirs (code, montant, avoir_utilisé, client_id)
VALUES
    ('CODE001', 5.00, FALSE, 1),
    ('CODE002', 7.50, FALSE, 2),
    ('CODE003', 3.00, TRUE, 3),
    ('CODE004', 10.00, FALSE, 4),
    ('CODE005', 8.50, FALSE, 5),
    ('CODE006', 6.00, FALSE, 6),
    ('CODE007', 12.00, TRUE, 7),
    ('CODE008', 4.50, FALSE, 8),
    ('CODE009', 9.00, TRUE, 9),
    ('CODE010', 15.00, FALSE, 10);



/*Résultat requete 1*/
SELECT p.nom AS nom_du_plat, SUM(p.quantité) AS quantite_consommees FROM commandes cm
JOIN plats p ON cm.id_commande = p.id_plats
WHERE cm.date_commande BETWEEN '2023-06-20' AND '2023-09-22'
GROUP BY p.id_plats
ORDER BY quantite_consommees DESC
LIMIT 1;

/*Résultat requete 2*/
SELECT mode_paiement, COUNT(*) AS nombre_de_clients
FROM clients
INNER JOIN commandes ON clients.id_client = commandes.client_id
WHERE DATE_FORMAT(FROM_DAYS(TO_DAYS(NOW()) - TO_DAYS(date_anniversaire)), '%Y') BETWEEN 18 AND 22
AND adresse LIKE '%Paris%'
GROUP BY mode_paiement
ORDER BY nombre_de_clients DESC
LIMIT 1;


/*Résultat requete 3*/

SELECT SUBSTRING_INDEX(adresse_livraison, ' ', -1) AS ville, COUNT(*) AS nombre_de_commandes
FROM Commandes GROUP BY ville ORDER BY nombre_de_commandes DESC
LIMIT 1;

/*Résultat requete 4*/
SELECT restaurant.nom, AVG(note.note) AS moyenne
FROM restaurant
LEFT JOIN plats ON restaurant.id_restaurant = plats.restaurant_id
LEFT JOIN note ON plats.id_plats = note.plats_id
GROUP BY restaurant.id_restaurant
ORDER BY moyenne DESC
LIMIT 1;

/*Résultat requete 5*/
SELECT AVG(YEAR(CURDATE()) - YEAR(date_anniversaire)) AS age_moyen
FROM clients
WHERE adresse LIKE '%Beauvais%';

/*Résultat requete 6*/
SELECT livreur.nom AS nom_livreur, COUNT(client.id_commande) AS nombre_livraisons
FROM commandes client
INNER JOIN livreurs livreur ON client.livreur_id = livreur.id_livreur
WHERE DATE_FORMAT(client.date_livraison, '%Y-%m') = '2020-02'
GROUP BY livreur.nom;

/*Résultat requete 7*/
SELECT l.id_livreur, l.nom AS nom_livreur, SUM(DISTANCE) AS total_kilometres_2022
FROM livreurs l
JOIN commandes c ON l.id_livreur = c.livreur_id
WHERE YEAR(c.date_livraison) = 2022
GROUP BY l.id_livreur, l.nom;

/*Résultat requete 8*/
SELECT AVG(YEAR(CURDATE()) - YEAR(date_anniversaire)) AS moyenne_age
FROM clients
WHERE id_client IN (SELECT DISTINCT client_id FROM commandes WHERE YEAR(date_commande) = 2021);

/*Résultat requete 9*/
SELECT c.nom AS nom_client, c.prenom AS prenom_client, COUNT(*) AS nombre_de_commandes
FROM Commandes AS co
INNER JOIN Clients AS c ON co.client_id = c.id_client
WHERE YEAR(co.date_commande) = 2022
GROUP BY c.nom, c.prenom
ORDER BY COUNT(*) DESC
LIMIT 1;

/*Résultat requete 10*/
SELECT c.nom, c.prenom, SUM(CAST(a.montant AS DECIMAL(10, 2))) AS total_depense
FROM clients c
INNER JOIN commandes co ON c.id_client = co.client_id
INNER JOIN factures f ON co.id_commande = f.commande_id
INNER JOIN avoirs a ON c.id_client = a.client_id
WHERE a.avoir_utilisé = TRUE
GROUP BY c.id_client
ORDER BY total_depense DESC
LIMIT 1;

/*Résultat requete 11*/
SELECT
    COUNT(*) AS total_clients,
    SUM(CASE WHEN parrain_id IS NULL THEN 1 ELSE 0 END) AS clients_non_parraines,
    (SUM(CASE WHEN parrain_id IS NULL THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS pourcentage_non_parraines
FROM clients;

drop database projet;