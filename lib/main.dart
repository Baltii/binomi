// ignore_for_file: prefer_const_constructors
import 'package:binomi/features/Auth/services/api_auth.dart';
import 'package:binomi/features/annonces/pages/annonce-detail/annonce-detail.dart';
import 'package:binomi/features/Home/pages/home.dart';
import 'package:binomi/features/profile/pages/change_password.dart';
import 'package:binomi/features/profile/pages/edit_profile.dart';
import 'package:binomi/features/profile/pages/language.dart';
import 'package:binomi/features/profile/pages/settings.dart';
import 'package:binomi/features/profile/pages/user_profile.dart';
import 'package:binomi/features/search/pages/search_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:binomi/features/Auth/pages/login.dart';
import 'package:binomi/features/Home/pages/welcome.dart';
import 'package:binomi/features/profile/pages/notifications.dart';

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final ApiClient _apiClient = ApiClient();
    return MaterialApp(
      title: 'Binomi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        //textTheme: GoogleFonts.robotoTextTheme(
        //Theme.of(context).textTheme,
        //),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SearchPage(),
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        '/detail': (context) => AnnonceDetail(),
        '/profile': (context) => UserProfile(),
        '/settings': (context) => Settings(),
        '/edit-profile': (context) => EditProfile(),
        '/notifications': (context) => Notifications(),
        '/language': (context) => Language(),
        '/change_password': (context) => ChangePassword(),

        // Add more routes as needed
      },
    );
  }
}
