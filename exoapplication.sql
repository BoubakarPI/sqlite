CREATE TABLE MEDECIN (
    numRPPS INTEGER PRIMARY KEY,
    nomM VARCHAR(255) NOT NULL,
    prenomM VARCHAR(255) NOT NULL,
    specialite VARCHAR(255) NOT NULL,
    ville VARCHAR(255) NOT NULL,
    adresse VARCHAR(255) NOT NULL
);

CREATE TABLE PATIENT (
    numSS INTEGER PRIMARY KEY,
    nomP CHAR(50),
    prenomP CHAR(50),
    sexe CHAR(1),
    dateNaiss DATE,
    numRPPS INTEGER,
    FOREIGN KEY (numRPPS) REFERENCES MEDECIN(numRPPS)

);

INSERT INTO MEDECIN (numRPPS, nomM, prenomM, specialite, ville, adresse) VALUES
(123456789, 'Dupont', 'Jean', 'Cardiologie', 'Paris', '12 Rue de la Santé'),
(987654321, 'Martin', 'Marie', 'Pédiatrie', 'Lyon', '8 Avenue des Enfants'),
(456789123, 'Dubois', 'Pierre', 'Chirurgie', 'Marseille', '25 Rue du Scalpel');


INSERT INTO PATIENT (numSS, nomP, prenomP, sexe, dateNaiss, numRPPS) VALUES
(1234567890, 'Durand', 'Sophie', 'F', '1990-05-15', 123456789),
(9876543210, 'Lefevre', 'Thomas', 'M', '1985-10-20', 987654321),
(4567891230, 'Moreau', 'Camille', 'F', '2000-02-10', 456789123);

SELECT * MEDECIN;

SELECT nomP, prenomP 
FROM PATIENT GROUP BY nomP

SELECT nomP, prenomP, specialite 
FROM MEDECIN
WHERE ville = 'Lyon';
