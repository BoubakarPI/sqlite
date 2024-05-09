-- CREATE TABLE utilisateurs (
--     nom VARCHAR(255) NOT NULL,
--     prenom VARCHAR(255) NOT NULL,
--     sexe VARCHAR(1) NOT NULL,
--     date_naissance DATE NOT NULL
-- )

-- INSERT INTO utilisateurs (nom, prenom, sexe, date_naissance)
-- VALUES ('Moussa', 'Toés', 'M', '2004');

-- CREATE TABLE rangSocial (
--     id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
--     salaire INTEGER NOT NULL,
--     classe VARCHAR(255) NOT NULL
-- );

 CREATE TABLE users (
     id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
     nom VARCHAR(255) NOT NULL,
     prenom VARCHAR(255) NOT NULL,
     classe_id INTEGER,
     FOREIGN KEY (classe_id) REFERENCES rangSocial(id)
 );

DROP TABLE users;

INSERT INTO rangSocial (salaire, classe)
VALUES (150000, 'Assez bien'), (200000, 'Moyenne'), (500000, 'Haute');

INSERT INTO users (nom, prenom, classe_id)
VALUES ('Ali', 'Toé', 1), ('Moussa', 'Yaya', 2), ('Bata', 'Bagué', 3);

SELECT * 
FROM users JOIN rangSocial ON users.classe_id = rangSocial.id;

SELECT * FROM users;