
import 'package:binomi/features/search/widget/app_bar_serch.dart';
import 'package:binomi/shared/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
// import 'package:binomi/features/Auth/Applications/api_auth.dart';

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
      body: const Column(
        children: [
          SizedBox(height: 40),
          AppBarSearch(),
          
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
