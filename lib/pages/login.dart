// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0), // Space for the logo
            Center(
              child: Image.asset(
                'assets/images/Binomi_logo.png', // Replace with your logo image path
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(height: 20.0), // Space between title and inputs
            Expanded(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80.0),
                    //topRight: Radius.circular(10.0),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 60.0), // Space between login and inputs
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                      SizedBox(
                          height: 20.0), // Space between email and password
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: Icon(Icons.remove_red_eye_sharp),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                      SizedBox(height: 20.0), // Space between inputs and button
                      SigninButton(),
                      SizedBox(height: 20.0),
                      SignInDivider(),
                      SizedBox(height: 20.0),
                      SocialMediaButtons()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInDivider extends StatelessWidget {
  const SignInDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            color: Colors.black,
            height: 1.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'OR',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.black,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.g_mobiledata),
          onPressed: () {
            // Handle Google authentication
          },
        ),
        SizedBox(width: 20.0),
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 238, 238, 238), // Use color code #EEEEEE
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.facebook),
            color: Colors.black, // Set the icon color
            onPressed: () {
              // Handle Facebook authentication
            },
          ),
        )
      ],
    );
  }
}

class SigninButton extends StatelessWidget {
  const SigninButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50, // Align to bottom-center
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Colors.black), // Background color
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          // Text color
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        child: const Text(
          "Sign in",
        ),
      ),
    );
  }
}
