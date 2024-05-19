import 'dart:io';

import 'package:image_picker/image_picker.dart';

class AnnonceAdd {
  final String title;
  final String type;
  final String gender;
  final int roomNumber;
  final int placeInRoom;
  final int placeDisponible;
  final List<String> homeFacilities;
  final List<String> nearest;
  final String dateDisponibilite;
  final String description;
  final String location;
  final int price;
  final String user_id;

  AnnonceAdd({
    required this.title,
    required this.type,
    required this.gender,
    required this.roomNumber,
    required this.placeInRoom,
    required this.placeDisponible,
    required this.homeFacilities,
    required this.nearest,
    required this.dateDisponibilite,
    required this.description,
    required this.location,
    required this.price,
    required this.user_id,
  });

  factory AnnonceAdd.fromJson(Map<String, dynamic> json) {
    return AnnonceAdd(
      title: json['title'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      roomNumber: json['roomNumber'] as int,
      placeInRoom: json['placeInRoom'] as int,
      placeDisponible: json['placeDisponible'] as int,
      homeFacilities: (json['homeFacilities'] as List<String>),
      nearest: (json['nearest'] as List<String>),
      dateDisponibilite: json['dateDisponibilite'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      price: json['price'] as int,
      user_id: json['user_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'type': type,
      "gender": gender,
      'roomNumber': roomNumber,
      'placeInRoom': placeInRoom,
      'placeDisponible': placeDisponible,
      'homeFacilities': homeFacilities,
      'nearest': nearest,
      'description': description,
      'location': location,
      'dateDisponibilite': dateDisponibilite,
      'price': price,
      'user_id': user_id,
    };
  }
}
