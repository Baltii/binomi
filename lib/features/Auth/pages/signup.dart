import 'package:binomi/features/Auth/services/api_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiClient _apiClient = ApiClient();

  Future<void> signupUser() async {
    //show snackbar to indicate loading
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Processing Data'),
      backgroundColor: Colors.green.shade300,
    ));
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushNamed(context, '/login');
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    //get response from ApiClient
    // dynamic res = await _apiClient.registerUser(
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
    return const Placeholder();
  }
}
