# Réponses aux questions du TP StockFacile - Partie 01

## Q1.3
- **Stockage de `disponible` et `date_ajout`** : 
  - SQLite ne gérant pas nativement les types `BOOLEAN` et `DATETIME`, on stocke `disponible` sous forme d'entier (`INTEGER`) où `1` représente le vrai (true) et `0` le faux (false). Pour `date_ajout`, on utilise le type `TEXT` en stockant la date au format standard international ISO 8601 (ex: `'2026-10-01T09:00:00'`).
- **Rôles des contraintes** :
  - **`AUTOINCREMENT`** : Garantit que chaque nouvel enregistrement reçoit automatiquement un identifiant unique incrémenté (1, 2, 3...), évitant les doublons de clés primaires.
  - **`UNIQUE` sur `nom`** : Empêche l'insertion de deux catégories portant exactement le même nom.
  - **`CHECK (prix >= 0)`** : Empêche l'insertion ou la modification d'un produit avec un prix négatif, garantissant la validité métier des données.
- **`ON DELETE RESTRICT`** :
  - Signifie qu'il est strictement interdit de supprimer une catégorie si des produits y sont encore rattachés. Cela protège l'intégrité référentielle de la base de données en bloquant la suppression en cascade.
  Réponse à la question du TP : Pourquoi écrit-on 'Huile d''olive' avec deux apostrophes ?

En SQL, une chaîne de caractères est délimitée par des apostrophes simples ('). Si le texte contient lui-même une apostrophe (comme dans d'olive ou d'orange), il faut doubler l'apostrophe ('') pour que SQL comprenne qu'il s'agit d'un caractère littéraire et non de la fin de la chaîne de texte.