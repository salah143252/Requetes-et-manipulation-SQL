CREATE DATABASE projet_blog;
USE projet_blog;

CREATE TABLE Utilisateur(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(20) NOT NULL
);

CREATE TABLE Article(
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(40) NOT NULL,
    auteur VARCHAR(35),
    contenu TEXT NOT NULL,
    datePub DATE,
    vues INT,
    id_auteur INT NOT NULL,
    FOREIGN KEY (id_auteur) REFERENCES Utilisateur(id)
);

INSERT INTO Utilisateur (id, nom)
VALUES
(1,'Karim'),
(2,'Leila'),
(3,'Omar'),
(4,'Zineb');

INSERT INTO Article (id, titre, auteur, contenu, datePub, vues, id_auteur)
VALUES
(1, 'Les bases PHP', 'Leila','Guide complet pour apprendre les fondamentaux du langage PHP', '2024-02-10', 145, 2),
(2, 'HTML et CSS', 'Karim','Introduction au développement web avec HTML5 et CSS3', '2024-09-18', 238, 1),
(3, 'JavaScript moderne', 'Omar','Maîtriser ES6 et les nouvelles fonctionnalités JavaScript', '2024-05-30', 192, 3),
(4, 'React pour débutants', 'Karim','Créer des applications web interactives avec React', '2023-11-12', 311, 1);

START TRANSACTION;
INSERT INTO Article (titre, auteur, contenu, datePub, vues, id_auteur)
VALUES ('Node.js avancé', 'Alice', 'Développement backend avec Node.js et Express', '2025-12-28', 12, 4);

UPDATE Utilisateur
SET nom = 'Alice'
WHERE id = 4;
COMMIT;