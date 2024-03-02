import 'package:flutter/material.dart';

class AppBarSearch extends StatelessWidget {
  const AppBarSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, // Couleur de fond de l'app bar
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconButton(
            icon: Icons.arrow_back_ios,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color:  Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle:
                            TextStyle(color: Color(0xff7D7F88), fontSize: 12),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.clear), // Added another icon
                ],
              ),
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
