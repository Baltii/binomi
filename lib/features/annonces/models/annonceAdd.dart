
import 'package:image_picker/image_picker.dart';

class AnnonceAdd {
  final String id;
  final String title;
  final String type;
  final String gender;
  final List<XFile> photo;
  final int roomNumber;
  final int placeInRoom;
  final int placeDisponible;
  final List<String> homeFacilities;
  final List<String> nearest;
  final String description;
  final String location;
  final DateTime dateDisponibilite;
  final double price;
  final String userId;

  AnnonceAdd({
    required this.id,
    required this.title,
    required this.type,
    required this.gender,
    required this.photo,
    required this.roomNumber,
    required this.placeInRoom,
    required this.placeDisponible,
    required this.homeFacilities,
    required this.nearest,
    required this.description,
    required this.location,
    required this.dateDisponibilite,
    required this.price,
    required this.userId,
  });

  factory AnnonceAdd.fromJson(Map<String, dynamic> json) {
    return AnnonceAdd(
      id: json['_id'],
      title: json['title'],
      type: json['type'],
      gender: json['gender'],
      photo: List<XFile>.from(json['photo']),
      roomNumber: json['roomNumber'],
      placeInRoom: json['placeInRoom'],
      placeDisponible: json['placeDisponible'],
      homeFacilities: List<String>.from(json['homeFacilities']),
      nearest: List<String>.from(json['nearest']),
      description: json['description'],
      location: json['location'],
      dateDisponibilite: DateTime.parse(json['dateDisponibilite']),
      price: json['price'].toDouble(),
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'type': type,
      "gender": gender,
      'photo': photo,
      'roomNumber': roomNumber,
      'placeInRoom': placeInRoom,
      'placeDisponible': placeDisponible,
      'homeFacilities': homeFacilities,
      'nearest': nearest,
      'description': description,
      'location': location,
      'dateDisponibilite': dateDisponibilite.toIso8601String(),
      'price': price,
      'user_id': userId,
    };
  }
}
