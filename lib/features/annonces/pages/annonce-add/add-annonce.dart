import 'dart:io';

import 'package:binomi/features/annonces/models/annonceAdd.dart';
import 'package:binomi/features/annonces/services/api_annonce.dart';
import 'package:binomi/features/annonces/widgets/app_bar_add_annonce.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

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
  final TextEditingController _dateDisponibilite = TextEditingController();
  String? _selectedType;
  String? _selectedGender;
  List<String> _selectedfacilts = [];
  List<String> _selectedNearest = [];
  List<String> _types = ['Appartemnt', 'House', 'Studio'];
  List<String> _genders = ['Man', 'Woman'];
  List<String> _nears = ['Supermarket', 'University', 'School'];
  List<String> _homeFacils = [
    'Wifi',
    'Free Electricity',
    'Free Water',
    'Parking',
    'Kitchen',
    'Free Laundry',
    'Gym',
    'Pool',
    'Garden',
    'Balcony',
    'Terrace',
    'Air Conditioning',
    'Free Heating',
    'Free TV',
    'Free Fridge',
    'Free Microwave',
    'Free Oven',
    'Free Dishwasher',
    'Free Washing Machine',
    'Free Dryer',
    'Free Towels',
    'Free Bed Linen',
    'Free Desk',
    'Free Chair',
    'Free Closet',
    'Free Shelves',
    'Free Bedside Table',
    'Free Bedside Lamp',
    'Free Mirror',
    'Free Curtains',
    'Free Blinds',
    'Free Carpet',
    'Free Sofa',
    'Free Armchair',
    'Free Coffee Table',
    'Free Dining Table',
    'Free Dining Chair',
    'Free Stool',
    'Free Bar Stool',
    'Free TV Stand',
    'Free TV Table',
    'Free TV Cabinet',
    'Free TV Shelf',
    'Free TV Wall Mount',
    'Free TV Wall Bracket',
    'Free TV Wall Unit'
  ];

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
    _dateDisponibilite.dispose();
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

  void _showMultiSelect(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true, // required for min/max child size
      context: context,
      builder: (ctx) {
        return MultiSelectBottomSheet(
          items: _homeFacils.map((e) => MultiSelectItem(e, e)).toList(),
          initialValue: [_homeFacils[0]],
          onConfirm: (results) {
            _selectedfacilts = results.cast<String>();
          },
          maxChildSize: 0.7,
        );
      },
    );
  }

  void _nearestShowMultiSelect(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true, // required for min/max child size
      context: context,
      builder: (ctx) {
        return MultiSelectBottomSheet(
          items: _nears.map((e) => MultiSelectItem(e, e)).toList(),
          initialValue: [_nears[0]],
          onConfirm: (results) {
            _selectedNearest = results.cast<String>();
            print(_selectedNearest);
          },
          maxChildSize: 0.7,
        );
      },
    );
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
                    return 'Please enter price';
                  }
                  return null;
                },
              ),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Select a type',
                  border: OutlineInputBorder(),
                ),
                value: _selectedType,
                onChanged: (newValue) {
                  setState(() {
                    _selectedType = newValue;
                  });
                },
                items: _types.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a type';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Select a gender',
                  border: OutlineInputBorder(),
                ),
                value: _selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    _selectedGender = newValue;
                  });
                },
                items: _genders.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a Gender';
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: _dateDisponibilite,
                decoration: const InputDecoration(
                  labelText: 'Date Disponibilite',
                ),
                readOnly: true,
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        pickedDate.toString().split(' ').first;
                    _dateDisponibilite.text = formattedDate;
                  }
                },
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please select a date';
                //   }
                //   return null;
                // },
              ),

              ElevatedButton(
                onPressed: () => _showMultiSelect(context),
                child: Text('Choose Home Facilities'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => _nearestShowMultiSelect(context),
                child: Text('Choose Nearest Places'),
              ),
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
                        // You might want to generate a unique ID here
                        title: _titleController.text,
                        type: _selectedType!,
                        gender: _selectedGender!,
                        roomNumber: int.parse(_roomNumberController.text),
                        placeInRoom: int.parse(_placeInRoomController.text),
                        placeDisponible:
                            int.parse(_placeDisponibleController.text),
                        homeFacilities: _selectedfacilts,
                        nearest: _selectedNearest,
                        description: _descriptionController.text,
                        location: _locationController.text,
                        dateDisponibilite: _dateDisponibilite.text,
                        price: int.parse(_priceController.text),
                        user_id: '65cd5d05f9f89ba184fe8168',
                      );
                      _annonceService
                          .createAnnonce(newAnnonce, _imageFiles!)
                          .then((annonce) {
                     _showSuccessDialog();
                        print('New Annonce: $newAnnonce');
                      }).catchError((error) {
                        print('Error creating annonce: $error');
                      });
                    
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
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Annonce added successfully!'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((_) {
      // Reset the form fields after closing the dialog
      _formKey.currentState!.reset();
      setState(() {
        _imageFiles = null;
        _selectedType = null;
        _selectedGender = null;
        _selectedfacilts = [];
        _selectedNearest = [];
        _dateDisponibilite.clear();
      });
    });
  }

}

