import 'package:binomi/features/annonces/models/annonce.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AnnonceDetail extends StatefulWidget {
  // final Annonce annonce;

  const AnnonceDetail({Key? key}) : super(key: key);

  @override
  State<AnnonceDetail> createState() => _AnnonceDetailState();
}

class _AnnonceDetailState extends State<AnnonceDetail> {
  int selectedIndex = 0;
  bool isFavorite = false;
  List<Map<String, String>> imageList = [
    {"id": "1", "image_path": 'assets/images/home1.jpg'},
    {"id": "2", "image_path": 'assets/images/home2.jpg'},
    {"id": "3", "image_path": 'assets/images/backgroundApp.png'},
    {"id": "4", "image_path": 'assets/images/home2.jpg'},
    {"id": "5", "image_path": 'assets/images/home1.jpg'},
  ];
  final CarouselController carouselController = CarouselController();
  late int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  items: imageList
                      .map(
                        (item) => Image.asset(
                          item['image_path']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      )
                      .toList(),
                  carouselController: carouselController,
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    height: 500,
                    aspectRatio: 2,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                Positioned(
                  top: 17,
                  left: 2,
                  right: 2,
                  child: Container(
                    color: Colors.transparent, // Couleur de fond de l'app bar
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildIconButton(
                          icon: Icons.arrow_back_ios,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Text(
                          'Detail',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        _buildIconButton(
                          icon: isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () =>
                            carouselController.animateToPage(entry.key),
                        child: Container(
                          width: currentIndex == entry.key ? 40 : 6,
                          height: 6.0,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 3.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentIndex == entry.key
                                ? const Color(0xffF5F5F5)
                                : const Color.fromARGB(129, 238, 238, 238),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), // Espace pour ajouter du contenu
            // Ajoutez votre contenu ici, par exemple :
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'House S+2 for Students (Girls)',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 10), // Espace pour ajouter du contenu
            // Ajoutez votre contenu ici, par exemple :
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: 5), // Ajout de padding à droite
                          child:
                              Icon(Icons.star, color: Colors.yellow), // Icône
                        ),
                        Text(
                          "4.8 (66 reviews)",
                          style: TextStyle(color: Color(0xff7D7F88)),
                        ), // Texte
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: 5), // Ajout de padding à droite
                          child:
                              Icon(Icons.location_on, color: Color(0xff7D7F88)),
                        ),
                        // Icône
                        Text(
                          "Tunis, Tunisia",
                          style: TextStyle(color: Color(0xff7D7F88)),
                        ), // Texte
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: 5), // Ajout de padding à droite
                          child: Icon(Icons.hotel,
                              color: Color(0xff7D7F88)), // Icône
                        ),
                        Text(
                          "2 room",
                          style: TextStyle(color: Color(0xff7D7F88)),
                        ), // Texte
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: 5), // Ajout de padding à droite
                          child: Icon(Icons.person,
                              color: Color(0xff7D7F88)), // Icône
                        ),
                        Text(
                          "4 person",
                          style: TextStyle(color: Color(0xff7D7F88)),
                        ), // Texte
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40), // Espace pour ajouter du contenu
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal:
                          10.0), // Ajouter un margin à gauche de l'image
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(23.69),
                    child: const Image(
                      image: AssetImage('assets/images/moi3.jpg'),
                      fit: BoxFit.cover,
                      width: 47.39,
                      height: 47.39,
                    ),
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mayssa Ben Fredj",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "Property owner",
                      style: TextStyle(fontSize: 10, color: Color(0xff7D7F88)),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff33A5E5).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(14.22),
                  ),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(right: 20),
                  child: const Icon(Icons.phone, color: Color(0xff33A5E5)),
                )
              ],
            ),
            const SizedBox(height: 20), // Espace pour ajouter du contenu

            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Home facilities",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20), // Espace pour ajouter du contenu
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10), // Ajout de padding à droite
                      child: Icon(Icons.car_crash,
                          color: Color(0xff7D7F88)), // Icône
                    ),
                    Text(
                      "Free parking",
                      style: TextStyle(color: Color(0xff7D7F88)),
                    ),
                  ],
                ),
                SizedBox(height: 10), // Espace pour ajouter du contenu

                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10), // Ajout de padding à droite
                      child: Icon(Icons.air, color: Color(0xff7D7F88)), // Icône
                    ),
                    Text(
                      "Air conditioner",
                      style: TextStyle(color: Color(0xff7D7F88)),
                    ),
                  ],
                ),
                SizedBox(height: 10), // Espace pour ajouter du contenu

                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10), // Ajout de padding à droite
                      child:
                          Icon(Icons.wifi, color: Color(0xff7D7F88)), // Icône
                    ),
                    Text(
                      "Free wifi",
                      style: TextStyle(color: Color(0xff7D7F88)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10), // Espace pour ajouter du contenu
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Adress ",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10), // Espace pour ajouter du contenu
                Text(
                  "Cité olympique Rades , ben Arouss",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff7D7F88),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 17), // Espace pour ajouter du contenu
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20), // Espace pour ajouter du contenu
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Nearest public facilities",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 10), // Espace pour ajouter du contenu
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10), // Ajout de padding à droite
                      child: Icon(Icons.shopify, color: Color(0xff7D7F88)),
                    ),
                    // Icône
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Minimarket",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "200m",
                          style: TextStyle(
                              color: Color(0xff7D7F88),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                    // Texte
                  ],
                )
              ],
            ),
            const SizedBox(height: 27), // Espace pour ajouter du contenu
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20), // Espace pour ajouter du contenu
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "About location’s neighborhood",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 10), // Espace pour ajouter du contenu
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "The house is located in a quiet area, close to all amenities, and is suitable for students. It is a 5-minute walk from the Faculty of Sciences of Tunis and the Faculty of Medicine. The house is fully furnished and equipped. It has 2 bedrooms, a living room, a kitchen, a bathroom, and a terrace. The house is located in a quiet area, close to all amenities, and is suitable for students. It is a 5-minute walk from the Faculty of Sciences of Tunis and the Faculty of Medicine. The house is fully furnished and equipped. It has 2 bedrooms, a living room, a kitchen, a bathroom, and a terrace.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff7D7F88),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(239, 255, 255, 255),
        borderRadius: BorderRadius.circular(14.22),
      ),
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: IconButton(
        icon: Icon(icon),
        iconSize: 21,
        onPressed: onPressed,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
    );
  }
}
