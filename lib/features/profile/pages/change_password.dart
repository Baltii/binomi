import 'package:flutter/material.dart';
import 'package:binomi/features/profile/widget/app_bar_settings.dart';
import 'package:binomi/shared/bottom_nav_bar.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  int selectedIndex = 0;
  bool _showCurrentPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const AppBarSettings(),
            const SizedBox(height: 30),
            const Text('Change Password',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 110),
            _buildPasswordTextField('Current Password', _showCurrentPassword,
                (value) => setState(() => _showCurrentPassword = value)),
            _buildPasswordTextField('New Password', _showNewPassword,
                (value) => setState(() => _showNewPassword = value)),
            _buildPasswordTextField('Confirm Password', _showConfirmPassword,
                (value) => setState(() => _showConfirmPassword = value)),
            const SizedBox(height: 20),
            _buildButton('Save', Colors.black, Colors.white ,  true),
            const SizedBox(height: 10),
            _buildButton('Invalid condition', Colors.black, Colors.white , false),
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

  Widget _buildPasswordTextField(
      String labelText, bool showPassword, Function(bool) togglePassword) {
    return Column(
      children: [
        TextField(
          obscureText: !showPassword,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: GestureDetector(
              onTap: () {
                togglePassword(!showPassword);
              },
              child: Icon(
                showPassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        const SizedBox(height: 30.0),
      ],
    );
  }

  Widget _buildButton(
      String text, Color backgroundColor, Color textColor, bool isSuccess) {
    return SizedBox(
      width: 384,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          _showBottomSheet(context, isSuccess);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

 void _showBottomSheet(BuildContext context, bool isSuccess) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          height: 386,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                isSuccess ? Icons.check_circle_outline : Icons.error_outline,
                color: Colors.black,
                size: 115,
              ),
              SizedBox(height: 30),
              Text(
                isSuccess
                    ? 'Your password has been successfully changed.'
                    : 'An error occurred when changing your password.',
                textAlign: TextAlign.center,
                style: const  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 
                  ElevatedButton(
                    onPressed: () {
                      isSuccess ? 
                      Navigator.pushReplacementNamed(
                        context,
                       '/profile'
                      ) : Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(horizontal: 60.0 , vertical:20.0),

                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.39),
                        ),
                      ),
                    ),
                    child: Text(
                      isSuccess ? 'Return to profile' : 'Try Again',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

}
