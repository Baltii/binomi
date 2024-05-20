// ignore_for_file: prefer_interpolation_to_compose_strings, unnecessary_null_comparison

import 'dart:convert';

import 'package:binomi/features/Auth/services/api_auth.dart';
import 'package:binomi/features/profile/widget/app_bar_profile.dart';
import 'package:binomi/features/profile/widget/hero_profile.dart';
import 'package:binomi/features/profile/widget/profile_information.dart';
import 'package:binomi/shared/bottom_nav_bar.dart';
import 'package:binomi/shared/models/User.dart';
import 'package:dio/src/response.dart';
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

  final ApiClient _userService = ApiClient();
  User? _user;

  @override
  void initState() {
    super.initState();
    getUserById();
  }

  void getUserById() async {
    try {
      User user = await _userService.getUser('65cd5d05f9f89ba184fe8168');
      print(user);
      setState(() {
        _user = user;
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            AppBarProfile(),
            SizedBox(height: 20),
            _user != null
                ? HeroProfile(
                    title: _user!.firstName,
                    adress: '',
                  )
                : Center(
                    child:
                        CircularProgressIndicator()), // Show a loading indicator while fetching data
            SizedBox(height: 20),
            ProfileInformation(),
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
