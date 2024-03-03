import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final ValueChanged<int> onIndexChanged;

  const BottomNavigationBarWidget({Key? key, required this.onIndexChanged})
      : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  // Définissez une liste d'URL correspondant à chaque icône
  final List<String> _navigationUrls = ['/', '/search', '/favorites', '/profile'];

  // Méthode pour changer l'index sélectionné
  void selectIndex(int index) {
    setState(() {
      selectedIndex = index;
    });

    // Récupérez l'URL correspondant à l'index sélectionné
    String selectedRoute = _navigationUrls[index];

    // Naviguez vers l'URL correspondante
    Navigator.pushNamed(context, selectedRoute);
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Obtenez l'URL actuelle
    String currentRoute = ModalRoute.of(context)!.settings.name!;

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(Icons.home, 0, currentRoute),
            buildNavItem(Icons.map, 1, currentRoute),
            buildNavItem(Icons.favorite, 2, currentRoute),
            buildNavItem(Icons.person, 3, currentRoute),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(IconData icon, int index, String currentRoute) {
    final isSelected = _navigationUrls[index] == currentRoute;

    return GestureDetector(
      onTap: () {
        selectIndex(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 36,
        width: 36,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isSelected ? const Color.fromARGB(59, 51, 164, 229) : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xff33A5E5) : Colors.white,
              size: 20,
            ),
            if (isSelected) const SizedBox(height: 4),
            if (isSelected)
              Container(
                height: 2,
                width: 14,
                color: const Color(0xff33A5E5),
              ),
          ],
        ),
      ),
    );
  }
}
