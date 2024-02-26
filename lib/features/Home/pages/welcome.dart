// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/backgroundApp.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            40, 100, 40, 50), // Adjust padding values as needed
        child: Stack(
          children: [
            // Text with "We bring"
            Align(
              alignment: Alignment.topLeft, // Align to top-left
              child: RichText(
                text: TextSpan(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    TextSpan(
                      // "We bring"
                      text: "We bring\n",
                      style: TextStyle(
                        fontSize: 24, // Adjust as needed
                        fontWeight: FontWeight.w400, // Add bold weight
                        color: Color(0x84FFFFFF),
                        // Adjust as needed
                      ),
                    ),
                    TextSpan(
                      // "the best ..."
                      text: "the best place with the best mate.",
                      style: TextStyle(
                        fontSize: 52, // Adjust as needed
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1,
                        height: 1,
                        color: Colors.white, // Adjust as needed
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Button with "Get Started"
            Stack(
              children: const [
                Align(
                    alignment: Alignment.bottomCenter, child: WelcomeButton()),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50, // Align to bottom-center
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        child: const Text(
          "Start your search",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
