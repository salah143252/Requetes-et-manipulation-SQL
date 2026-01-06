CREATE DATABASE gestion_projets;
USE gestion_projets;


CREATE TABLE employe (
    id_emp INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    role VARCHAR(50)
);


CREATE TABLE projet (
    id_projet INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(200) NOT NULL,
    date_deb DATE,
    date_fin DATE,
    statut VARCHAR(50),
    id_chef_projet INT,
    FOREIGN KEY (id_chef_projet) REFERENCES employe(id_emp)
);


CREATE TABLE tache (
    id_tache INT PRIMARY KEY AUTO_INCREMENT,
    description TEXT,
    date_limite DATE,
    etat VARCHAR(50),
    priorite VARCHAR(20),
    id_employe INT,
    id_projet INT,
    FOREIGN KEY (id_employe) REFERENCES employe(id_emp),
    FOREIGN KEY (id_projet) REFERENCES projet(id_projet)
);



INSERT INTO employe (nom, prenom, email, role) VALUES
('BENKIRANE', 'Rachid', 'r.benkirane@gmail.com', 'Développeur'),
('ALAMI', 'AHMED', 'ahmed.alami@gmail.com', 'Développeur'),
('CHAKIR', 'Imane', 'imane.chakir@gmail.com', 'Testeur'),
('ElALAOUI', 'Zineb', 'z.alaoui@gmail.com', 'Chef de projet');

INSERT INTO projet (id_projet, nom, date_deb, date_fin, statut, id_chef_projet) VALUES
(123, 'APP mobile', '2025-01-09', '2025-12-28', 'En cours', 4),
(234, 'Site E-commerce Beauty', '2025-02-12', '2026-01-28', 'En cours', 4),
(98, 'Plateforme RH', '2025-03-01', '2025-11-15', 'En cours', 4);


INSERT INTO tache (description, date_limite, etat, priorite, id_projet, id_employe) VALUES
('Design interface utilisateur', '2025-03-20', 'Terminée', 'Haute', 234, 1),
('Développement backend', '2025-04-10', 'En cours', 'Moyenne', 234, 2),
('Tests fonctionnels', '2025-05-01', 'Terminée', 'Basse', 98, 3),
('Rédaction documentation', '2025-06-15', 'Non commencée', 'Basse', 123, 1);

SELECT nom, date_deb, date_fin FROM projet;

SELECT * FROM employe WHERE nom LIKE 'EL%';

SELECT * FROM tache WHERE id_projet = 234 ORDER BY priorite ASC;

SELECT * FROM projet WHERE date_fin < '2026-04-01';

SELECT * FROM employe WHERE role = 'Développeur';

SELECT * FROM tache WHERE id_projet = 98 AND etat = 'Terminée';

SELECT p.nom AS projet, p.date_deb, p.date_fin, e.nom AS nomChef, e.prenom AS prenomChef
FROM projet p
JOIN employe e ON p.id_chef_projet = e.id_emp;

SELECT t.* FROM tache t
JOIN projet p ON t.id_projet = p.id_projet
WHERE p.nom = 'Site E-commerce Beauty';

SELECT COUNT(*) AS nb_taches_terminees
FROM tache t
JOIN projet p ON t.id_projet = p.id_projet
WHERE p.nom = 'Site E-commerce Beauty' AND t.etat = 'Terminée';

SELECT COUNT(*) AS nb_projets_2025
FROM projet
WHERE YEAR(date_fin) = 2025 AND statut = 'Terminée';
UPDATE projet
SET date_fin = '2026-05-16'
WHERE id_projet = 234;

UPDATE tache
SET etat = 'Terminée'
WHERE id_tache = 98;
DELETE FROM tache
WHERE id_projet = 123 AND etat = 'Non commencée';

DELETE FROM employe
WHERE nom = 'ALAMI' AND prenom = 'AHMED';
