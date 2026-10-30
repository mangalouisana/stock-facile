-- Q1.5.1 : Tous les produits
SELECT * FROM produits;

-- Q1.5.2 : Les produits en rupture de stock
SELECT * FROM produits WHERE quantite = 0;

-- Q1.5.3 : Les produits triés du plus cher au moins cher
SELECT * FROM produits ORDER BY prix DESC;

-- Q1.5.4 : Le nom de chaque produit avec le nom de sa catégorie (INNER JOIN)
SELECT p.nom AS produit, c.nom AS categorie 
FROM produits p
INNER JOIN categories c ON p.categorie_id = c.id;

-- Q1.5.5 : Le nombre de produits par catégorie
SELECT c.nom AS categorie, COUNT(p.id) AS nombre_produits
FROM categories c
LEFT JOIN produits p ON c.id = p.categorie_id
GROUP BY c.id, c.nom;

-- Q1.5.6 : La valeur totale du stock
SELECT SUM(prix * quantite) AS valeur_totale_stock FROM produits;
INSERT INTO categories (nom, description) VALUES ('Électroménager', 'Petits appareils');