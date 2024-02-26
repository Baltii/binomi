// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:binomi/features/Auth/services/api_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiClient _apiClient = ApiClient();
  bool _showPassword = false;
  final storage = new FlutterSecureStorage();

  Future<void> loginUsers() async {
    //show snackbar to indicate loading
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Processing Data'),
      backgroundColor: Colors.green.shade300,
    ));
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushNamed(context, '/home');
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    //get response from ApiClient
    // dynamic res = await _apiClient.login(
    //   emailController.text,
    //   passwordController.text,
    // );

    // ScaffoldMessenger.of(context).hideCurrentSnackBar();

    // //if there is no error, get the user's accesstoken and pass it to HomeScreen
    // if (res['ErrorCode'] == null) {
    // await storage.write(key: 'token', value: res.token);
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => Home(accesstoken: accessToken)));
    // } else {
    //   //if an error occurs, show snackbar with error message
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text('Error: ${res['Message']}'),
    //     backgroundColor: Colors.red.shade300,
    //   ));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        key: _formKey,
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
                        controller: emailController,
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
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() => _showPassword = !_showPassword);
                            },
                            child: Icon(
                              _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                      SizedBox(height: 20.0), // Space between inputs and button
                      SigninButton(
                        onPressed: loginUsers,
                      ),
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
  final VoidCallback onPressed;

  const SigninButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: onPressed,
        child: const Text("Sign in"),
      ),
    );
  }
}
