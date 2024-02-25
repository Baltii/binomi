// ignore_for_file: prefer_const_constructors
import 'package:binomi/features/annonces/pages/annonce-detail/annonce-detail.dart';
import 'package:binomi/pages/home.dart';
import 'package:device_preview/device_preview.dart';
import 'package:binomi/pages/login.dart';
import 'package:binomi/pages/welcome.dart';
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
        '/': (context) => Welcome(),
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        '/detail' : (context) => AnnonceDetail(),
        // Add more routes as needed
      },
    );
  }
}
