import 'package:binomi/features/Home/widgets/scroll_card_horizontal.dart';
import 'package:binomi/features/Home/widgets/scroll_card_vertical.dart';

import 'package:binomi/shared/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
// import 'package:binomi/features/Auth/Applications/api_auth.dart';

class Home extends StatefulWidget {
  // final String accesstoken;
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  // final ApiClient _apiClient = ApiClient();
  // Future<Map<String, dynamic>> getUserData() async {
  //   dynamic userRes;
  //   userRes = await _apiClient.getUserProfileData(widget.accesstoken);
  //   return userRes;
  // }
  int selectedIndexButton = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.fromLTRB(20, 40, 20, 10), // Added top margin
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffEEEEEE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              hintStyle: TextStyle(
                                  color: Color(0xff7D7F88), fontSize: 12),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.clear), // Added another icon
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.22),
                  child: const Image(
                    image: AssetImage('assets/images/moi3.jpg'),
                    fit: BoxFit.cover,
                    width: 47.39,
                    height: 47.39,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Mayssa',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text(
                  'What are you looking for?',
                  style: TextStyle(
                    color: Color(0xff7D7F88),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ScrollCardHorizontal(),
                  SizedBox(height: 20),
                  ScrollCardVertical(),
                  SizedBox(
                    // Ajout d'un espace pour afficher la barre de navigation inférieure
                    height: kBottomNavigationBarHeight,
                  ),
                ],
              ),
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
