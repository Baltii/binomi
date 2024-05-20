import 'package:binomi/features/annonces/models/annonce.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:binomi/features/annonces/models/annonce.dart';
import 'package:binomi/features/annonces/services/api_annonce.dart';

class AnnonceDetail extends StatefulWidget {
  final String annonceId;

  const AnnonceDetail({Key? key, required this.annonceId}) : super(key: key);

  @override
  State<AnnonceDetail> createState() => _AnnonceDetailState();
}

class _AnnonceDetailState extends State<AnnonceDetail> {
  int selectedIndex = 0;
  bool isFavorite = false;
  Annonce? annonce;

  final CarouselController carouselController = CarouselController();
  final AnnonceService _annonceService = AnnonceService();

  int currentIndex = 0;

  Future<void> _loadAnnonceDetails() async {
    try {
      Annonce fetchedAnnonce =
          await _annonceService.getAnnonceById(widget.annonceId);
      setState(() {
        annonce = fetchedAnnonce;
      });
      // Afficher l'ID dans la console
      print('Annonce ID: ${fetchedAnnonce.id}');
      for (String image in fetchedAnnonce.photo) {
        print('Image URL: $image');
      }
    } catch (e) {
      print('Failed to load annonce: $e');
      // Show an error message to the user or handle it gracefully
    }
  }

  @override
  void initState() {
    super.initState();
    _loadAnnonceDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                if (annonce != null)
                  CarouselSlider(
                    items: annonce!.photo.map((imageName) {
                      return Image.network(
                        'http://10.0.2.2:3000/annonces/images/$imageName',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    }).toList(),
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
                if (annonce != null)
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
                if (annonce != null)
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: annonce!.photo.asMap().entries.map((entry) {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                annonce?.title ?? '',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 10), // Espace pour ajouter du contenu
            // Ajoutez votre contenu ici, par exemple :
            if (annonce != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Row(
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
                          const Padding(
                            padding: EdgeInsets.only(
                                right: 5), // Ajout de padding à droite
                            child: Icon(Icons.location_on,
                                color: Color(0xff7D7F88)),
                          ),
                          // Icône
                          Text(
                            annonce?.location ?? '',
                            style: const TextStyle(color: Color(0xff7D7F88)),
                          ), // Texte
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                                right: 5), // Ajout de padding à droite
                            child: Icon(Icons.hotel,
                                color: Color(0xff7D7F88)), // Icône
                          ),
                          Text(
                            '${annonce?.roomNumber ?? 0} room',
                            style: const TextStyle(color: Color(0xff7D7F88)),
                          ), // Texte
                        ],
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                                right: 5), // Ajout de padding à droite
                            child: Icon(Icons.person,
                                color: Color(0xff7D7F88)), // Icône
                          ),
                          Text(
                            '${annonce?.placeInRoom ?? 0} person',
                            style: const TextStyle(color: Color(0xff7D7F88)),
                          ), // Texte
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            const SizedBox(height: 40), // Espace pour ajouter du contenu
            if (annonce != null)
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
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "Property owner",
                        style:
                            TextStyle(fontSize: 10, color: Color(0xff7D7F88)),
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
            if (annonce != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Home facilities",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: annonce!.homeFacilities.map((facility) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(
                                Icons.circle_outlined,
                                color: Color(0xff7D7F88),
                                size: 8,
                              ),
                            ),
                            Text(
                              facility,
                              style: const TextStyle(color: Color(0xff7D7F88)),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Nearest public facilities",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: annonce!.nearest.map((facility) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(
                                Icons.circle_outlined,
                                color: Color(0xff7D7F88),
                                size: 8,
                              ),
                            ),
                            Text(
                              facility,
                              style: const TextStyle(color: Color(0xff7D7F88)),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            const SizedBox(height: 27), // Espace pour ajouter du contenu
            if (annonce != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20), // Espace pour ajouter du contenu
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "About location’s neighborhood",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10), // Espace pour ajouter du contenu
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      annonce?.description ?? '',
                      style: const TextStyle(
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
