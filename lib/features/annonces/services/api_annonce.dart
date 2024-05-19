import 'dart:convert';
import 'package:binomi/features/annonces/models/annonceAdd.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../models/annonce.dart';

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

    if (response.statusCode == 200) {
      return Annonce.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load annonce');
    }
  }

  Future<void> createAnnonce(AnnonceAdd annonce, List<XFile> photos) async {
    try {
      // Create a multipart request
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Add the form fields
      request.fields['title'] = annonce.title;
      request.fields['type'] = annonce.type;
      request.fields['gender'] = annonce.gender;
      request.fields['roomNumber'] = annonce.roomNumber.toString();
      request.fields['placeInRoom'] = annonce.placeInRoom.toString();
      request.fields['placeDisponible'] = annonce.placeDisponible.toString();
      request.fields['homeFacilities'] = json.encode(annonce.homeFacilities);
      request.fields['nearest'] = json.encode(annonce.nearest);
      request.fields['dateDisponibilite'] =
          annonce.dateDisponibilite.toString();
      request.fields['description'] = annonce.description;
      request.fields['location'] = annonce.location;
      request.fields['price'] = annonce.price.toString();
      request.fields['user_id'] = annonce.user_id.toString();

      // Add the photos
      for (var photo in photos) {
        request.files
            .add(await http.MultipartFile.fromPath('photos', photo.path));
      }

      // Send the request
      var response = await request.send();

      // Check the response status code
      if (response.statusCode == 201) {
        // Parse and return the response
        var jsonResponse = jsonDecode(await response.stream.bytesToString());
      } else {
        // Handle the error
        var errorResponse = await response.stream.bytesToString();
        throw Exception('Failed to create annonce: $errorResponse');
      }
    } catch (e) {
      // Handle any other exceptions
      print('Error creating annonce: $e');
      rethrow;
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
