class Annonce {
  final String id;
  final String title;
  final List<String> photo;
  final int roomNumber;
  final int placeInRoom;
  final int placeDisponible;
  final List<String> homeFacilities;
  final Map<String, dynamic> nearest;
  final String description;
  final String location;
  final DateTime dateDisponibilite;
  final double price;
  final String userId;

  Annonce({
    required this.id,
    required this.title,
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

  factory Annonce.fromJson(Map<String, dynamic> json) {
    return Annonce(
      id: json['_id'],
      title: json['title'],
      photo: List<String>.from(json['photo']),
      roomNumber: json['roomNumber'],
      placeInRoom: json['placeInRoom'],
      placeDisponible: json['placeDisponible'],
      homeFacilities: List<String>.from(json['homeFacilities']),
      nearest: Map<String, dynamic>.from(json['nearest']),
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
