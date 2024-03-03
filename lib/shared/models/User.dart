// ignore_for_file: file_names

class User {
  String firstName;
  String lastName;
  String email;
  String password;
  // String photoProfile;
  String phoneNumber;
  int age;
  String gender;
  Map<String, dynamic> address;
  String cin;
  List<String> hobbies;
  String description;
  String sickness;
  String role;
  bool isActive;
  DateTime dateCreation;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    // required this.photoProfile,
    required this.phoneNumber,
    required this.age,
    required this.gender,
    required this.address,
    required this.cin,
    required this.hobbies,
    required this.description,
    required this.sickness,
    required this.role,
    required this.isActive,
    required this.dateCreation,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      // photoProfile: json['photoProfile'],
      phoneNumber: json['phoneNumber'],
      age: json['age'],
      gender: json['gender'],
      address: json['address'],
      cin: json['cin'],
      hobbies: List<String>.from(json['hobbies']),
      description: json['description'],
      sickness: json['sickness'],
      role: json['role'],
      isActive: json['isActive'],
      dateCreation: DateTime.parse(json['dateCreation']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      // 'photoProfile': photoProfile,
      'phoneNumber': phoneNumber,
      'age': age,
      'gender': gender,
      'address': address,
      'cin': cin,
      'hobbies': hobbies,
      'description': description,
      'sickness': sickness,
      'role': role,
      'isActive': isActive,
      'dateCreation': dateCreation.toIso8601String(),
    };
  }
}
