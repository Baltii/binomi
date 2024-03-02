import 'package:flutter/material.dart';

class HeroProfile extends StatefulWidget {
  const HeroProfile({Key? key}) : super(key: key);

  @override
  _HeroProfileState createState() => _HeroProfileState();
}

class _HeroProfileState extends State<HeroProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
     
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/moi3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Mayssa Ben Fredj',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Adresse',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
