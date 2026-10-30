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
# Réponses aux questions du TP - StockFacile

## Partie 03 : Q3.2
- **(1) Que se passe-t-il si on écrit deux fois DatabaseHelper() dans le code ? Combien d'objets sont créés ?**
  Un seul objet est créé. Grâce au constructeur `factory` et au pattern Singleton, l'instance unique (`_instance`) est réutilisée à chaque appel. `DatabaseHelper() == DatabaseHelper()` renvoie toujours vrai.

- **(2) Que fait l'opérateur `??=` ?**
  Il assigne une valeur à une variable uniquement si cette variable est actuellement `null`. Si elle contient déjà une connexion active, il ne fait rien.

- **(3) Pourquoi le `PRAGMA foreign_keys = ON` est-il placé dans `onConfigure` et non dans `onCreate` ?**
  Parce que `onConfigure` s'exécute à **chaque** ouverture de la base de données, tandis que `onCreate` ne s'exécute qu'au tout premier lancement (lors de la création initiale du fichier `.db`). SQLite désactivant les clés étrangères par défaut à chaque nouvelle connexion, il faut les réactiver systématiquement.

- **(4) Combien de fois `onCreate` est-il appelé dans toute la vie de l'application ?**
  Il n'est appelé qu'**une seule fois** (au tout premier lancement, lors de la création initiale du fichier de base de données).