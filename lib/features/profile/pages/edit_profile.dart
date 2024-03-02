import 'package:flutter/material.dart';
import 'package:binomi/features/profile/widget/app_bar_settings.dart';
import 'package:binomi/shared/bottom_nav_bar.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const AppBarSettings(),
            const SizedBox(height: 130),
            Row(
              children: [
                Expanded(
                    child: _buildContainer(
                  [
                    _buildRowInformation('Account Information', Icons.edit),
                  ],
                  borderRadiusTopLeft: 25.0,
                   onPressed: () {
                    // Ajoutez ici votre logique pour le onPressed
                    print('Change Password container pressed');
                  },
                )),
                Expanded(
                  child: _buildContainer(
                    [
                      _buildRowInformation('Hobbies', Icons.favorite_outline),
                    ],
                    borderRadiusTopRight:
                        25.0, // Exemple de radius pour le coin supérieur droit
                         onPressed: () {
                      // Ajoutez ici votre logique pour le onPressed
                      print('Change Password container pressed');
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: _buildContainer(
                  [
                    _buildRowInformation('Social Links', Icons.link),
                  ],
                  borderRadiusBottomLeft:
                      25.0, // Exemple de radius pour le coin inférieur gauche
                       onPressed: () {
                    // Ajoutez ici votre logique pour le onPressed
                    print('Change Password container pressed');
                  },
                )),
                Expanded(
                    child: _buildContainer(
                  [
                    _buildRowInformation('Change Password', Icons.password),
                  ],
                  borderRadiusBottomRight:
                      25.0, // Exemple de radius pour le coin inférieur droit
                       onPressed: () {
                    // Ajoutez ici votre logique pour le onPressed
                    print('Change Password container pressed');
                  },
                )),
              ],
            ),
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

Widget _buildContainer(
    List<Widget> children, {
    double borderRadiusTopLeft = 0.0,
    double borderRadiusTopRight = 0.0,
    double borderRadiusBottomLeft = 0.0,
    double borderRadiusBottomRight = 0.0,
    
    VoidCallback? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 182.0,
        height: 189.0,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadiusTopLeft),
            topRight: Radius.circular(borderRadiusTopRight),
            bottomLeft: Radius.circular(borderRadiusBottomLeft),
            bottomRight: Radius.circular(borderRadiusBottomRight),
          ),
          border: Border.all(
            width: 0.2,
            color: const Color.fromARGB(255, 151, 151, 151),
          )
        ),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }


  Widget _buildRowInformation(String content, IconData iconData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Icon(
          iconData,
          size: 60,
        ),
        const SizedBox(height: 20),
        Text(
          content,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.visible,
          maxLines: null,
        ),
      ],
    );
  }
}
