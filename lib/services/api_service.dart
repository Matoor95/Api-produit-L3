 import 'dart:convert';

import 'package:api_postl3/models/produit.dart';
 import 'package:http/http.dart' as http;

Future<List<Produit>>  fetchProduits()  async{
  final response = await http.get(Uri.parse('http://examen.test/api.php'));
   if (response.statusCode == 200) {
    // Étape 1 : Décoder le JSON complet
    final Map<String, dynamic> data = json.decode(response.body);
    
    // Étape 2 : Vérifier la structure
    if (data['success'] == true && data['produits'] is List) {
      List<dynamic> produitsData = data['produits'];
      return produitsData.map((json) => Produit.fromJson(json)).toList();
    } else {
      throw Exception('Structure de données invalide');
    }
  } else {
    throw Exception('Failed to load data');
  }

}