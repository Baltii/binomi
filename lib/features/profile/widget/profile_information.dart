import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProfileInformation extends StatefulWidget {
  const ProfileInformation({Key? key}) : super(key: key);

  @override
  _ProfileInformationState createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: 2, // Nombre d'éléments dans le carousel
            itemBuilder: (BuildContext context, int index, int realIndex) {
              Widget content;
              if (index == 0) {
                content = Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20.0),
                      
                      child: Column(
                        children: [
                          _buildRowInformation(
                              'example@example.com', Icons.email_outlined),
                          const SizedBox(height: 15),
                          _buildRowInformation(
                              '+216 58063153', Icons.phone_android_outlined),
                          const SizedBox(height: 15),
                          _buildRowInformation(
                              '17 street 2256, City Olympics , Rades 2072',
                              Icons.location_on_outlined),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildSocialIcon(
                                iconData: Icons.facebook_outlined,
                                onPressed: () {
                                  // Navigation vers le lien
                                },
                              ),
                              const SizedBox(width: 5),
                              _buildSocialIcon(
                                iconData: Icons.facebook_outlined,
                                onPressed: () {
                                  // Navigation vers le lien
                                },
                              ),
                              const SizedBox(width: 5),
                            ],
                          ),
                        ],
                      ),
                    ));
              } else {
                content = Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                   
                    child: Column(
                      children: [
                        _buildCustomText(
                          'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu\'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 10, // Espacement entre les éléments
                          runSpacing: 10,
                          children: [
                            _buildCategoryContainer('Music'),
                            _buildCategoryContainer('Gaming'),
                            _buildCategoryContainer('Gaming'),
                            _buildCategoryContainer('Gaming'),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
              return content;
            },
            options: CarouselOptions(
              height: 280, // Hauteur du carousel
              scrollPhysics: const BouncingScrollPhysics(),
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),

        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPoint(0),
            _buildPoint(1),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildCategoryContainer(String text) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: _buildCustomText(
        text,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildPoint(int index) {
    return Icon(
      Icons.fiber_manual_record,
      size: 12,
      color: _currentIndex == index ? Colors.black : Colors.grey,
    );
  }

  Widget _buildRowInformation(String content, IconData iconData) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 25,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            content,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            overflow:
                TextOverflow.visible, // Définition de l'overflow à visible
            maxLines: null, // Permet au texte de revenir à la ligne
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon({
    required IconData iconData,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(6.0),
        child: Icon(
          iconData,
          size: 25,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildCustomText(
    String text, {
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
