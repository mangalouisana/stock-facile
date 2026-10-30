-- Activation des clés étrangères
PRAGMA foreign_keys = ON;

-- Table des catégories
CREATE TABLE IF NOT EXISTS categories (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nom TEXT NOT NULL UNIQUE,
  description TEXT
);

-- Table des produits
CREATE TABLE IF NOT EXISTS produits (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nom TEXT NOT NULL,
  prix REAL NOT NULL,
  quantite INTEGER NOT NULL,
  disponible INTEGER NOT NULL DEFAULT 1,
  date_ajout TEXT NOT NULL,
  categorie_id INTEGER NOT NULL,
  FOREIGN KEY (categorie_id) REFERENCES categories (id) ON DELETE CASCADE
);