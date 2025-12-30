CREATE DATABASE IF NOT EXISTS gestion_articles;
USE gestion_articles;

DROP TABLE IF EXISTS Article;
CREATE TABLE Article(
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(40) NOT NULL,
    contenu TEXT NOT NULL,
    datePub DATE DEFAULT CURRENT_DATE
);

INSERT INTO Article (titre, contenu, datePub)
VALUES
('Chapitre1', 'Instruction pour sélectionner filtrer et trier des données dans une table', '2023-08-21'),
('Chapitre2', 'Instruction pour sélectionner filtrer et trier des données dans une table', '2025-12-26'),
('Chapitre3', 'Instruction pour sélectionner filtrer et trier des données dans une table', '2025-10-04'),
('Chapitre4', 'Instruction pour sélectionner filtrer et trier des données dans une table', '2023-06-26');

SELECT * FROM Article;

SELECT titre, datePub
FROM Article
WHERE YEAR(datePub) >= 2024
ORDER BY datePub ASC
LIMIT 4;