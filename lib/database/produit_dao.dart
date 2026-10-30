import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../database/database_helper.dart';
import '../database/categorie_dao.dart';
import '../database/produit_dao.dart';
import '../models/categorie.dart';
import '../models/produit.dart';

class TestsScreen extends StatelessWidget {
  const TestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Banc d\'essai - StockFacile')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ElevatedButton(
            onPressed: () async {
              final db = await DatabaseHelper().database;
              final resultat = await db.rawQuery(
                'SELECT COUNT(*) AS nb FROM categories',
              );
              debugPrint('Nombre de catégories : ${resultat.first['nb']}');
            },
            child: const Text('Ouvrir la base'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              final nouvelle = Categorie(
                nom: 'Électroménager',
                description: 'Petits appareils',
              );
              try {
                final id = await CategorieDao().insererCategorie(nouvelle);
                debugPrint('Catégorie insérée avec l\'id $id');
              } on DatabaseException catch (e) {
                if (e.isUniqueConstraintError()) {
                  debugPrint('Erreur : Cette catégorie existe déjà.');
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cette catégorie existe déjà'),
                      ),
                    );
                  }
                } else {
                  debugPrint('Erreur SQLite : $e');
                }
              }
            },
            child: const Text('Test : ajouter une catégorie'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              final produit = Produit(
                nom: 'Stylo bleu',
                prix: 0.5,
                quantite: 100,
                disponible: true,
                dateAjout: DateTime.now(),
                categorieId: 4,
              );
              final id = await ProduitDao().insererProduit(produit);
              debugPrint('Produit inséré avec l\'id $id');
            },
            child: const Text('Test : ajouter un produit'),
          ),
        ],
      ),
    );
  }
}
