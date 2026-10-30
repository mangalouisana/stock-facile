import 'package:sqflite/sqflite.dart';
import '../models/categorie.dart';
import 'database_helper.dart';

class CategorieDao {
  static const String table = 'categories';

  Future<int> insererCategorie(Categorie categorie) async {
    // 1. Récupère l'instance unique de la base de données de manière asynchrone
    final Database db = await DatabaseHelper().database;

    // 2. Insère les données de la catégorie (converties en Map) dans la table et récupère l'ID généré
    final int id = await db.insert(table, categorie.toMap());

    // 3. Retourne l'identifiant (id) de la nouvelle ligne créée dans la base
    return id;
  }
}
