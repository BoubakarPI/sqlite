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

CREATE TABLE CONSULTE (
    numOrd INTEGER PRIMARY KEY,
    date DATE,
    diagnostic VARCHAR(255),
    numSS INTEGER,
    numRPPS INTEGER,
    FOREIGN KEY (numSS) REFERENCES PATIENT(numSS),
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


INSERT INTO CONSULTE (numOrd, date, diagnostic, numSS, numRPPS) VALUES
(1, '2023-01-05', 'Rhume', 1234567890, 123456789),
(2, '2023-02-10', 'Entorse', 9876543210, 987654321),
(3, '2008-10-14', 'Grippe', 4567891230, 456789123),
(4, '2023-04-20', 'Angine', 1234567890, 123456789),
(5, '2008-10-14', 'Fracture', 9876543210, 123456789),
(6, '2023-06-30', 'Sinusite', 4567891230, 456789123),
(7, '2023-07-05', 'Bronchite', 1234567890, 123456789),
(8, '2023-10-14', 'Allergie', 9876543210, 987654321),
(9, '2023-09-15', 'Asthme', 4567891230, 456789123),
(10, '2023-10-20', 'Rhinite', 1234567890, 123456789);


SELECT date, COUNT(numOrd)
FROM CONSULTE GROUP BY date;

SELECT * MEDECIN;

SELECT nomP, prenomP 
FROM PATIENT GROUP BY nomP

SELECT nomM, prenomM, specialite 
FROM MEDECIN
WHERE ville = 'Lyon';

SELECT * 
FROM PATIENT 
WHERE dateNaiss > DATE(01-05-1985);

SELECT nomM, prenomM 
FROM MEDECIN 
WHERE specialite LIKE '%logue%';

SELECT prenomP 
FROM PATIENT
WHERE nomP IN ('Dupont', 'Durant', 'MARTINE');

SELECT COUNT(numRPPS) AS nombreM
FROM MEDECIN;

SELECT *
FROM CONSULTE
WHERE numOrd = NULL ;

SELECT *
FROM MEDECIN
WHERE specialite = () AND ville = 

SELECT P.nomP, P.prenomP, M.nomM AS NomMedecin
FROM PATIENT AS P JOIN MEDECIN AS M ON (P.numRPPS = M.numRPPS)
ORDER BY P.nomP, P.prenomP;

SELECT P.nomP, P.prenomP, M.nomM, M.prenomM
FROM PATIENT AS P JOIN MEDECIN AS M ON (P.numRPPS = M.numRPPS)
ORDER BY P.nomP, P.prenomP;

SELECT M.numRPPS, COUNT(C.numRPPS) AS nbConsult
FROM MEDECIN AS M JOIN CONSULTE AS C ON (M.numRPPS = C.numRPPS)
WHERE C.date = 2008-10-14 GROUP BY C.numRPPS;