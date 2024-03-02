import 'package:binomi/features/profile/widget/app_bar_profile.dart';
import 'package:binomi/features/profile/widget/hero_profile.dart';
import 'package:binomi/features/profile/widget/profile_information.dart';
import 'package:binomi/shared/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
// import 'package:binomi/features/Auth/Applications/api_auth.dart';

class UserProfile extends StatefulWidget {
  // final String accesstoken;
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: const Column(
        children: [
          SizedBox(height: 30),
          AppBarProfile(),
          SizedBox(height: 20),
          HeroProfile(),
          SizedBox(height: 20),
          ProfileInformation(),
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
