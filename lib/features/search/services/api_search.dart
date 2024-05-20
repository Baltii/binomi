import 'dart:convert';
import 'package:binomi/features/annonces/models/annonceAdd.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../annonces/models/annonce.dart';

class SearchService {
  static const String apiUrl = 'http://10.0.2.2:3000/annonces';

   Future<List<Annonce>> searchAnnonces(String keyword) async {
        print("le mot clee $keyword");

    final response =
        await http.get(Uri.parse('$apiUrl/search?keyword=$keyword'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Annonce> annonces =
          body.map((dynamic item) => Annonce.fromJson(item)).toList();
                print(annonces);

      return annonces;

    } else {
      throw Exception('Failed to load annonces');
    }
  }

  
    

 

 
}
