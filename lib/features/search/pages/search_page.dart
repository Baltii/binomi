
import 'package:binomi/features/search/widget/app_bar_serch.dart';
import 'package:binomi/shared/bottom_nav_bar.dart';
import 'package:binomi/shared/widget/vertical_card.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  // final String accesstoken;
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Container(
        height: 1000,
        child: Stack(
          
          children: [
            Image.asset(
              'assets/images/home1.jpg',
              width: double.infinity, // Utilisez toute la largeur de l'écran
              height: 262.01,
              fit: BoxFit
                  .cover, // Assurez-vous que l'image couvre toute la hauteur
            ),
            const Positioned(
              top: 40, // Ajustez cette valeur pour déplacer l'AppBar vers le bas
              left: 0,
              right: 0,
              child: AppBarSearch(),
            ),
            Positioned(
              top:
                  222.01, // Ajustez cette valeur pour déplacer le conteneur vers le bas de l'image
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                height: MediaQuery.of(context).size.height -
                    262.01 -
                    40, // Hauteur restante de l'écran après l'image et l'AppBar
                child: ListView(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal : 18.0),
                      child: Text('Showing 5 results' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w900),),
                    ),
                    VerticalCard(image: 'assets/images/home2.jpg', title: 'House S+4 for students', adress: 'Rades, Ben Arous', room: 2, person: 4, price: 150),
                                        VerticalCard(
                        image: 'assets/images/home2.jpg',
                        title: 'House S+1 for students',
                        adress: 'Rades, Ben Arous',
                        room: 2,
                        person: 4,
                        price: 150),
                    VerticalCard(
                        image: 'assets/images/home2.jpg',
                        title: 'House S+2 for students',
                        adress: 'Rades, Ben Arous',
                        room: 2,
                        person: 4,
                        price: 150),
                                            VerticalCard(
                        image: 'assets/images/home2.jpg',
                        title: 'House S+3 for students',
                        adress: 'Rades, Ben Arous',
                        room: 2,
                        person: 4,
                        price: 150),

                    VerticalCard(
                        image: 'assets/images/home2.jpg',
                        title: 'House S+5 for students',
                        adress: 'Rades, Ben Arous',
                        room: 2,
                        person: 4,
                        price: 150),


                                    ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        onIndexChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }


}
