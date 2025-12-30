CREATE DATABASE app_users;
USE tutoriel4;
CREATE TABLE Utilisateur(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE,
    mot_de_passe VARCHAR(200)
);
INSERT INTO Utilisateur (nom, email, mot_de_passe)
VALUES 
('Alice', 'alice@test.com', '1234'),
('Bob', 'bob@test.com', 'passbob'),
('Charlie', 'charlie@test.com', 'passcharlie');

UPDATE Utilisateur
SET nom = 'Alice Dupont', email = 'alice.dupont@test.com'
WHERE id = 1;
DELETE FROM Utilisateur
WHERE id = 2;