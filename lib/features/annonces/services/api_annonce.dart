import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/annonce.dart';

class AnnonceService {
  static const String apiUrl = 'http://localhost:3000/annonces';

  Future<List<Annonce>> getAnnonces() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((json) => Annonce.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load annonces');
    }
  }

  Future<Annonce> getAnnonceById(String id) async {
    final response = await http.get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return Annonce.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load annonce');
    }
  }

  Future<Annonce> createAnnonce(Annonce annonce) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(annonce.toJson()),
    );

    if (response.statusCode == 201) {
      return Annonce.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create annonce');
    }
  }

  Future<void> updateAnnonce(Annonce annonce) async {
    final response = await http.put(
      Uri.parse('$apiUrl/${annonce.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(annonce.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update annonce');
    }
  }

  Future<void> deleteAnnonce(String id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete annonce');
    }
  }
}
