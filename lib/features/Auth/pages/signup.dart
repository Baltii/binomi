import 'package:binomi/features/Auth/services/api_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiClient _apiClient = ApiClient();
  bool _showPassword = false;
  final storage = FlutterSecureStorage();

  Future<void> SignupUsers() async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Processing Data'),
      backgroundColor: Colors.green.shade300,
    ));
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushNamed(context, '/home');
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  Widget buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    bool obscureText = false,
    IconData? suffixIcon,
    bool enabled = true,
    FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: () {},
              )
            : null,
      ),
      enabled: enabled,
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100.0),
            Expanded(
              child: Card(
                elevation: 5,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(123.0),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/Binomi_logo.png',
                        width: 50.12,
                        height: 30.46,
                      ),
                      const Text(
                        'Create a new account.',
                        style: TextStyle(
                          fontSize: 38.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 60.0),
                      Row(
                        children: [
                          Expanded(
                            child: buildTextFormField(
                              controller: firstNameController,
                              labelText: 'First Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: buildTextFormField(
                              controller: lastNameController,
                              labelText: 'Last Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your last name';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      buildTextFormField(
                        controller: emailController,
                        labelText: 'Email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      buildTextFormField(
                        controller: phoneController,
                        labelText: 'Phone',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      buildTextFormField(
                        controller: passwordController,
                        labelText: 'Password',
                        obscureText: !_showPassword,
                        suffixIcon: _showPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      SigninButton(
                        onPressed: SignupUsers,
                      ),
                      const SizedBox(height: 20.0),
                      const SignInDivider(),
                      const SizedBox(height: 20.0),
                      const SocialMediaButtons(),
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
  const SignInDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
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
  const SocialMediaButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.g_mobiledata),
          onPressed: () {
            // Handle Google authentication
          },
        ),
        const SizedBox(width: 20.0),
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 238, 238, 238),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.facebook),
            color: Colors.black,
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
        child: const Text("Create"),
      ),
    );
  }
}
