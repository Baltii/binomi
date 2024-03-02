import 'package:flutter/material.dart';

class AppBarSettings extends StatelessWidget {
  const AppBarSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, // Couleur de fond de l'app bar
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconButton(
            icon: Icons.arrow_back_ios,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ClipRRect(
                  borderRadius: BorderRadius.circular(14.22),
                  child: const Image(
                    image: AssetImage('assets/images/moi3.jpg'),
                    fit: BoxFit.cover,
                    width: 47.39,
                    height: 47.39,
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(239, 255, 255, 255),
        borderRadius: BorderRadius.circular(14.22),
      ),
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: IconButton(
        icon: Icon(icon),
        iconSize: 21,
        onPressed: onPressed,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
    );
  }
}
