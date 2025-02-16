 import 'dart:convert';

import 'package:api_postl3/models/produit.dart';
 import 'package:http/http.dart' as http;

Future<List<Produit>>  fetchProduits()  async{
  final response = await http.get(Uri.parse('http://examen.test/api.php'));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return jsonResponse.map((json) => Produit.fromJson(json)).toList();
    
  } else {
    throw Exception('Failed to load data');
  }

}