import 'package:binomi/features/Home/widgets/card_widget.dart';
import 'package:binomi/features/Home/widgets/scroll_card_horizontal.dart';
import 'package:binomi/features/annonces/models/annonce.dart';

import 'package:binomi/features/annonces/services/api_annonce.dart';
import 'package:binomi/features/profile/pages/user_profile.dart';
import 'package:binomi/features/profile/widget/profile_information.dart';

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
  int selectedIndexButton = 0;
  // final ApiClient _apiClient = ApiClient();
  // Future<Map<String, dynamic>> getUserData() async {
  //   dynamic userRes;
  //   userRes = await _apiClient.getUserProfileData(widget.accesstoken);
  //   return userRes;
  // }
  final AnnonceService _annonceService = AnnonceService();
  List<Annonce> _annonces = [];

  Future<void> _loadAnnonces() async {
    try {
      List<Annonce> annonces = await _annonceService.getAnnonces();

      setState(() {
        _annonces = annonces;
      });
    } catch (e) {
      print('Failed to load annonces: $e');
      // Handle error gracefully, e.g., show an error message
    }
  }

  @override
  void initState() {
    super.initState();
    _loadAnnonces();
  }

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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserProfile()));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.22),
                    child: const Image(
                      image: AssetImage('assets/images/moi3.jpg'),
                      fit: BoxFit.cover,
                      width: 47.39,
                      height: 47.39,
                    ),
                  ),
                )
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
          ScrollCardHorizontal(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _annonces
                  .where(
                      (annonce) => annonce != null) // Filter out null elements
                  .map((annonce) {
                return ScrollCardHorizontalCard(
                  image: 'assets/images/home1.jpg',
                  title: annonce.title,
                  adress: annonce.location,
                  room: annonce.roomNumber,
                  person: annonce.placeInRoom,
                  price: annonce.price,
                );
              }).toList(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_annonce');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
