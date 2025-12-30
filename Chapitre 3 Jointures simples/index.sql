CREATE DATABASE IF NOT EXISTS learning_hub;
USE learning_hub;

CREATE TABLE IF NOT EXISTS Utilisateur(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Article(
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(100) NOT NULL,
    contenu TEXT NOT NULL,
    datePub DATE NOT NULL,
    vues INT DEFAULT 0,
    id_auteur INT NOT NULL,
    CONSTRAINT fk_article_auteur FOREIGN KEY (id_auteur) 
        REFERENCES Utilisateur(id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    INDEX idx_auteur (id_auteur),
    INDEX idx_date_pub (datePub)
);

INSERT INTO Utilisateur (nom) VALUES
('Kris'),
('Jessica'),
('Melonie'),
('Ibrahim');

INSERT INTO Article (titre, contenu, datePub, vues, id_auteur) VALUES
('Chapitre1', 'Instruction pour sélectionner filtrer et trier des données dans une table', '2023-08-21', 7, 2),
('Chapitre2', 'Instruction pour sélectionner filtrer et trier des données dans une table', '2025-12-26', 6, 1),
('Chapitre3', 'Instruction pour sélectionner filtrer et trier des données dans une table', '2025-10-04', 7, 3),
('Chapitre4', 'Instruction pour sélectionner filtrer et trier des données dans une table', '2023-06-26', 8, 1);

SELECT a.titre, u.nom AS auteur
FROM Article a
INNER JOIN Utilisateur u ON a.id_auteur = u.id
WHERE u.nom = 'Kris';

SELECT 
    a.titre,
    a.datePub,
    u.nom AS auteur
FROM Article a
INNER JOIN Utilisateur u ON a.id_auteur = u.id
ORDER BY a.datePub DESC;