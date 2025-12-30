CREATE DATABASE gestion_articles;
USE gestion_articles;

CREATE TABLE Article(
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(100) NOT NULL,
    auteur VARCHAR(50),
    contenu TEXT NOT NULL,
    datePub DATE,
    vues INT DEFAULT 0
);

INSERT INTO Article (titre, auteur, contenu, datePub, vues)
VALUES
('Introduction à SQL', 'Mohammed', 'Guide complet pour débuter avec les bases de données relationnelles', '2024-01-15', 125),
('Les jointures expliquées', 'Fatima', 'Comment utiliser INNER JOIN, LEFT JOIN et RIGHT JOIN efficacement', '2024-03-22', 89),
('Optimisation des requêtes', 'Mohammed', 'Techniques avancées pour améliorer les performances de vos requêtes', '2024-06-10', 156),
('Gestion des transactions', 'Karim', 'Comprendre COMMIT, ROLLBACK et les niveaux d\'isolation', '2024-09-18', 73);

SELECT * FROM Article;

SELECT COUNT(*) AS nombre_total FROM Article;

SELECT MAX(datePub) AS article_recent FROM Article;

SELECT auteur, COUNT(*) AS nombre_articles
FROM Article
GROUP BY auteur
HAVING COUNT(*) >= 2;

SELECT AVG(vues) AS moyenne_vues FROM Article;

SELECT auteur, SUM(vues) AS total_vues
FROM Article
GROUP BY auteur
ORDER BY total_vues DESC;