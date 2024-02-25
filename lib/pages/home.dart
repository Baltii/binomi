import 'package:binomi/shared/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(20, 40, 20, 10), // Added top margin
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color:const Color(0xffEEEEEE),
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
                                 hintStyle: TextStyle(color: Color(0xff7D7F88)),
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
            // Add other widgets below if needed
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
