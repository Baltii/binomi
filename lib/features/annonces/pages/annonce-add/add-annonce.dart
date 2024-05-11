import 'dart:io';

import 'package:binomi/features/annonces/models/annonce.dart';
import 'package:binomi/features/annonces/models/annonceAdd.dart';
import 'package:binomi/features/annonces/services/api_annonce.dart';
import 'package:binomi/features/annonces/widgets/app_bar_add_annonce.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class AddAnnonceForm extends StatefulWidget {
  @override
  _AddAnnonceFormState createState() => _AddAnnonceFormState();
}

class _AddAnnonceFormState extends State<AddAnnonceForm> {
  final AnnonceService _annonceService = AnnonceService();
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFiles;

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late String _typeController;
  late String _genderController;
  late TextEditingController _roomNumberController;
  late TextEditingController _placeInRoomController;
  late TextEditingController _placeDisponibleController;
  late TextEditingController _descriptionController;
  late TextEditingController _locationController;
  late TextEditingController _priceController;
  late List<String> _homeFacilities;
  late List<String> _nearest;
  late DateTime _dateDisponibilite;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _typeController = "";
    _genderController = "";
    _roomNumberController = TextEditingController();
    _placeInRoomController = TextEditingController();
    _placeDisponibleController = TextEditingController();
    _descriptionController = TextEditingController();
    _locationController = TextEditingController();
    _priceController = TextEditingController();
    _homeFacilities = [];
    _nearest = [];
    _dateDisponibilite = DateTime.now();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _roomNumberController.dispose();
    _placeInRoomController.dispose();
    _placeDisponibleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _pickImages() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        maxWidth: 1920,
        maxHeight: 1200,
        imageQuality: 80,
      );
      setState(() {
        _imageFiles = images;
      });
    } catch (e) {
      print('Error picking images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const AppBarAddAnnonce(),
              // Widget pour afficher les images sélectionnées
              if (_imageFiles != null)
                Column(
                  children: _imageFiles!.map((imageFile) {
                    return Image.file(File(imageFile.path));
                  }).toList(),
                ),
              // Bouton pour ajouter des images
              ElevatedButton(
                onPressed: _pickImages,
                child: Text("Pick images"),
              ),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _roomNumberController,
                decoration: const InputDecoration(labelText: 'Room Number'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter room number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _placeInRoomController,
                decoration: const InputDecoration(labelText: 'Place in Room'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter place in room';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _placeDisponibleController,
                decoration:
                    const InputDecoration(labelText: 'Place Disponible'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter place disponible';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Adresse'),
                keyboardType: TextInputType.streetAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Adresse';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              // You can add TextFormField for other attributes similarly
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Create the Annonce object
                      AnnonceAdd newAnnonce = AnnonceAdd(
                        id: DateTime.now()
                            .toString(), // You might want to generate a unique ID here
                        title: _titleController.text,
                        type: '',
                        gender: '',
                        roomNumber: int.parse(_roomNumberController.text),
                        placeInRoom: int.parse(_placeInRoomController.text),
                        placeDisponible:
                            int.parse(_placeDisponibleController.text),
                        homeFacilities: _homeFacilities,
                        nearest: _nearest,
                        description: _descriptionController.text,
                        location: _locationController.text,
                        dateDisponibilite: _dateDisponibilite,
                        price: double.parse(_priceController.text),
                        userId: '65cd5d05f9f89ba184fe8168',
                      );
                      _annonceService
                          .createAnnonce(newAnnonce, _imageFiles!)
                          .then((annonce) {
                        // You can now use the newAnnonce object as needed
                        // For example, you can send it to a database or perform any other action
                        print('New Annonce: $newAnnonce');
                      }).catchError((error) {
                        print('Error creating annonce: $error');
                      });
                      // You can now use the newAnnonce object as needed
                      // For example, you can send it to a database or perform any other action
                    }
                  },
                  child: const Text("Add Annonce"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
