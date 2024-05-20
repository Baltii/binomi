import 'dart:convert';

import 'package:binomi/features/annonces/models/annonceAdd.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../models/annonce.dart';

import 'dart:io';

class AnnonceService {
  static const String apiUrl = 'http://10.0.2.2:3000/annonces';

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
    print("the id $id");
    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return Annonce.fromJson(json);
      } catch (e) {
        throw Exception('Failed to parse annonce: $e');
      }
    } else {
      throw Exception(
          'Failed to load annonce with status code ${response.statusCode}');
    }
  }

  Future<AnnonceAdd> createAnnonce(
      AnnonceAdd annonce, List<XFile> photos) async {
    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

    // Add the annonce data as fields
    request.fields['title'] = annonce.title;
    // Add other fields as needed

    // Add the photos
    for (var photo in photos) {
      request.files.add(await http.MultipartFile.fromPath(
        'photos',
        photo.path,
      )); // Adjust the content type as per your images
    }

    // Send the request
    var response = await request.send();

    // Check the response status code
    if (response.statusCode == 201) {
      // Parse and return the response
      var jsonResponse = jsonDecode(await response.stream.bytesToString());
      return AnnonceAdd.fromJson(jsonResponse);
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
