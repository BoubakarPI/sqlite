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

ALTER TABLE CONSULTE RENAME date TO date_consulte;

INSERT INTO MEDECIN (numRPPS, nomM, prenomM, specialite, ville, adresse) VALUES
(123456789, 'Dupont', 'Jean', 'Cardiologie', 'Paris', '12 Rue de la Santé'),
(987654321, 'Martin', 'Marie', 'Pédiatrie', 'Lyon', '8 Avenue des Enfants'),
(456789123, 'Dubois', 'Pierre', 'Chirurgie', 'Marseille', '25 Rue du Scalpel');

INSERT INTO PATIENT (numSS, nomP) VALUES
(12345629, 'Yoy');

UPDATE PATIENT SET sexe = 'F' WHERE nomP = 'Yoy';

SELECT m2.*
FROM MEDECIN m1 JOIN MEDECIN m2 ON m1.specialite = m2.specialite AND m1.ville = m2.ville
WHERE m1.nomM = 'Dupont' AND m1.prenomM = 'Jean';


SELECT m2.*
FROM MEDECIN m1 JOIN MEDECIN m2 ON m1.specialite = m2.specialite AND m1.ville = m2.ville
WHERE m1.nomM = 'Dupont' AND m1.prenomM = 'Jean';

INSERT INTO PATIENT (numSS, nomP, prenomP, sexe, dateNaiss, numRPPS) VALUES
(1234567890, 'Durand', 'Sophie', 'F', '1990-05-15', 123456789),
(9876543210, 'Lefevre', 'Thomas', 'M', '1985-10-20', 987654321),
(4567891230, 'Moreau', 'Camille', 'F', '2000-02-10', 456789123);

INSERT INTO PATIENT (nomP, numSS, prenomP, sexe, dateNaiss, numRPPS) VALUES
('Moussa', 123456490, 'Tall', 'F', '1999-05-15', 123456789);


INSERT INTO CONSULTE (numOrd, date_consulte, diagnostic, numSS, numRPPS) VALUES
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

ALTER TABLE test DROP name;

DROP TABLE test;

SELECT MIN(numOrd) AS Minim
FROM CONSULTE
WHERE numOrd = (SELECT MIN(numOrd) FROM CONSULTE) ;

SELECT *
FROM CONSULTE
WHERE numOrd > (SELECT AVG(numOrd) FROM CONSULTE);


DELETE 
FROM CONSULTE
WHERE numOrd > 9;

DELETE 
FROM CONSULTE;

SELECT *
FROM CONSULTE;
UPDATE CONSULTE SET numRPPS = 456789123 WHERE numOrd = 10;

INSERT INTO CONSULTE VALUES(
    11, '2008-10-14', 'Palu', 58962454, 123456789
);


CREATE TABLE IF NOT EXISTS test(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INTEGER NOT NULL,
    gender VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL
)

ALTER TABLE test DROP phone;

ALTER TABLE test MODIFY gender gendre VARCHAR(255);


SELECT numOrd, COUNT(*)
FROM CONSULTE GROUP BY date;

SELECT * 
FROM MEDECIN;

SELECT nomP, prenomP
FROM PATIENT 
ORDER  BY nomP DESC;

-- 3

SELECT nomM, prenomM, COALESCE(specialite, 'généraliste') AS specialite 
FROM MEDECIN 
WHERE ville = 'Lyon';

-- 4

SELECT * 
FROM PATIENT 
WHERE dateNaiss > '1985-05-01';


-- 5

SELECT nomM, prenomM 
FROM MEDECIN 
WHERE specialite LIKE '%logue%';

-- 6

SELECT prenomP 
FROM PATIENT
WHERE nomP IN ('Dupont', 'Durant', 'MARTINE');

-- 7

SELECT COUNT(numRPPS) AS nombreM
FROM MEDECIN
WHERE ville = 'Lyon';

-- 8

SELECT *
FROM CONSULTE
WHERE numOrd IS NOT NULL;

-- 9

SELECT m2.* FROM MEDECIN m1 JOIN MEDECIN m2 ON m1.specialite = m2.specialite AND m1.ville = m2.ville
WHERE m1.nomM = 'Dupont' AND m1.prenomM = 'Jean';

-- 10

SELECT P.nomP, P.prenomP, M.nomM AS NomMedecin
FROM PATIENT AS P 
JOIN MEDECIN AS M ON (P.numRPPS = M.numRPPS)
ORDER BY P.nomP, P.prenomP;

SELECT P.nomP, P.prenomP, M.nomM, M.prenomM
FROM PATIENT AS P 
LEFT JOIN MEDECIN AS M ON (P.numRPPS = M.numRPPS)
ORDER BY P.nomP DESC, P.prenomP DESC;





-- SELECT COUNT(numRPPS) AS nbConsult, numRPPS AS LeMedecin
-- FROM CONSULTE WHERE date = '2008-10-14' GROUP BY numRPPS;

-- SELECT M.numRPPS AS NumeroMedecin, COUNT(C.numRPPS) AS nbConsult
-- FROM CONSULTE AS C JOIN MEDECIN AS M ON (C.numRPPS = M.numRPPS)
-- GROUP BY C.numRPPS HAVING nbConsult >= 4;



SELECT numRPPS, COUNT(*) AS nbConsult
FROM CONSULTE
WHERE date_consulte = '2008-10-14'
GROUP BY numRPPS;


SELECT C.numRPPS AS NumeroMedecin, COUNT(C.numRPPS) AS nbConsult 
FROM CONSULTE AS C JOIN MEDECIN AS M ON (C.numRPPS = M.numRPPS) 
WHERE date_consulte = '2008-10-14'
GROUP BY C.numRPPS;

-- 13
-- Best

SELECT numSS, COUNT(*) AS nbConsultations
FROM CONSULTE
GROUP BY numSS
ORDER BY nbConsultations DESC
LIMIT 1;


SELECT C.numSS AS NuméroPatient, COUNT(C.numSS) AS nbConsult 
FROM PATIENT P JOIN CONSULTE AS C ON (P.numSS = C.numSS)
GROUP BY C.numSS
ORDER BY nbConsult DESC
LIMIT 1;


-- 14

SELECT p.numSS, p.nomP, p.prenomP
FROM PATIENT p 
JOIN CONSULTE c ON p.numSS = c.numSS
JOIN MEDECIN m ON c.numRPPS = m.numRPPS
WHERE p.numRPPS != m.numRPPS;


SELECT P.numSS AS NuméroPatient, C.numRPPS AS NuméroMedecin
FROM CONSULTE AS C JOIN PATIENT P ON (C.numSS = P.numSS)
WHERE C.numRPPS != P.numSS
GROUP BY C.numSS;

-- 15 t
