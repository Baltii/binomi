import 'package:binomi/shared/widget/vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:binomi/features/Home/widgets/app_bar_home.dart';
import 'package:binomi/shared/bottom_nav_bar.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarHome(),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Favorites',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children:  const [
                
                VerticalCard(
                  image: 'assets/images/home2.jpg',
                  title: 'House S+4 for students',
                  adress: 'Rades, Ben Arous',
                  room: 2,
                  person: 4,
                  price: 150,
                ),
                VerticalCard(
                  image: 'assets/images/home2.jpg',
                  title: 'House S+1 for students',
                  adress: 'Rades, Ben Arous',
                  room: 2,
                  person: 4,
                  price: 150,
                ),
                VerticalCard(
                  image: 'assets/images/home2.jpg',
                  title: 'House S+2 for students',
                  adress: 'Rades, Ben Arous',
                  room: 2,
                  person: 4,
                  price: 150,
                ),
                VerticalCard(
                  image: 'assets/images/home2.jpg',
                  title: 'House S+3 for students',
                  adress: 'Rades, Ben Arous',
                  room: 2,
                  person: 4,
                  price: 150,
                ),
                VerticalCard(
                  image: 'assets/images/home2.jpg',
                  title: 'House S+5 for students',
                  adress: 'Rades, Ben Arous',
                  room: 2,
                  person: 4,
                  price: 150,
                ),
              ],
            ),
          ),
        ],
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
