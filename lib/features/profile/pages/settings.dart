import 'package:binomi/features/profile/widget/app_bar_settings.dart';
import 'package:binomi/shared/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
// import 'package:binomi/features/Auth/Applications/api_auth.dart';

class Settings extends StatefulWidget {
  // final String accesstoken;
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const AppBarSettings(),
          const SizedBox(height: 60),
          _buildContainer([
            _buildRowInformation('Edit profile information', Icons.info),
            const SizedBox(height: 20),
            _buildRowInformation('Notifications', Icons.notifications),
            const SizedBox(height: 20),
            _buildRowInformation('Language', Icons.language),
            const SizedBox(height: 20),
          ]),
          const SizedBox(height: 20),
          _buildContainer([
            _buildRowInformation('Change password', Icons.password),
            const SizedBox(height: 20),
            _buildRowInformation('Theme', Icons.dark_mode),
            const SizedBox(height: 20),
          ]),
          const SizedBox(height: 20),
          _buildContainer([
            _buildRowInformation('Help & Support', Icons.help),
            const SizedBox(height: 20),
            _buildRowInformation('Contact us', Icons.contacts),
            const SizedBox(height: 20),
            _buildRowInformation('Privacy policy', Icons.privacy_tip),
            const SizedBox(height: 20),
            _buildRowInformation('Log out', Icons.logout),
            const SizedBox(height: 20),
          ]),
        ],
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

  Widget _buildContainer(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: children,
        ),
      ),
    );
  }
  Widget _buildRowInformation(String content, IconData iconData) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 25,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            content,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            overflow:
                TextOverflow.visible, // Définition de l'overflow à visible
            maxLines: null, // Permet au texte de revenir à la ligne
          ),
        ),
      ],
    );
  }
}
