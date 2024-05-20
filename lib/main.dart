import 'package:binomi/features/Auth/pages/signup.dart';
import 'package:binomi/features/Auth/services/api_auth.dart';
import 'package:binomi/features/annonces/pages/annonce-add/add-annonce.dart';
import 'package:binomi/features/annonces/pages/annonce-detail/annonce-detail.dart';
import 'package:binomi/features/Home/pages/home.dart';
import 'package:binomi/features/favorite/page/favorite.dart';
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
    const MyApp(),
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
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) {
              return AnnonceDetail(annonceId: args);
            },
          );
        }

        // Define other routes here
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => Login());
          case '/search':
            return MaterialPageRoute(builder: (context) => SearchPage());
          case '/add_annonce':
            return MaterialPageRoute(builder: (context) => AddAnnonceForm());
          case '/profile':
            return MaterialPageRoute(builder: (context) => UserProfile());
          case '/settings':
            return MaterialPageRoute(builder: (context) => Settings());
          case '/edit-profile':
            return MaterialPageRoute(builder: (context) => EditProfile());
          case '/notifications':
            return MaterialPageRoute(builder: (context) => Notifications());
          case '/language':
            return MaterialPageRoute(builder: (context) => Language());
          case '/change_password':
            return MaterialPageRoute(builder: (context) => ChangePassword());
          case '/welcome':
            return MaterialPageRoute(builder: (context) => Welcome());
          case '/favorites':
            return MaterialPageRoute(builder: (context) => Favorite());
          case '/signup':
            return MaterialPageRoute(builder: (context) => Signup());
          default:
            return MaterialPageRoute(builder: (context) => Home());
        }
      },
    );
  }
}
