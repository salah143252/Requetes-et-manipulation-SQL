1️_ Afficher le nombre de tâches par projet

SELECT p.nom_projet, COUNT(t.id_tache) AS nb_taches
FROM PROJET p
LEFT JOIN TACHE t ON p.id_projet = t.id_projet
GROUP BY p.id_projet, p.nom_projet;


2️_ Afficher la durée de chaque projet en jours

SELECT nom_projet,
DATEDIFF(date_fin, date_debut) AS duree_en_jours
FROM PROJET;

3️_ Afficher les tâches en retard

SELECT *
FROM TACHE
WHERE date_limite < CURDATE()
AND statut <> 'archivé';

4️_ Afficher le nombre de projets par employé

SELECT e.Nom, e.Prenom, COUNT(p.id_projet) AS nb_projets
FROM EMPLOYE e
LEFT JOIN PROJET p ON e.id_EMPLOYE = p.id_EMPLOYE
GROUP BY e.id_EMPLOYE, e.Nom, e.Prenom;

5_ Afficher lmployé qui a réalisé le plus grand nombre de tâches

SELECT e.Nom, e.Prenom, COUNT(t.id_tache) AS nb_taches
FROM EMPLOYE e
JOIN TACHE t ON e.id_EMPLOYE = t.id_EMPLOYE
GROUP BY e.id_EMPLOYE, e.Nom, e.Prenom
ORDER BY nb_taches DESC
LIMIT 1;


6_Afficher la dernière tâche ajoutée pour chaque projet

SELECT p.nom_projet, t.description, t.date_limite
FROM TACHE t
JOIN PROJET p ON t.id_projet = p.id_projet
WHERE t.id_tache IN (
    SELECT MAX(id_tache)
    FROM TACHE
    GROUP BY id_projet
);