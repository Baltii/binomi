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
  int selectedIndex = 0;

  void selectIndex(int index) {
    setState(() {
      selectedIndex = index;
      widget.onIndexChanged(
          index); // Notify the parent widget about the index change
    });
  }

  @override
  Widget build(BuildContext context) {
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
            buildNavItem(Icons.home, 0),
            buildNavItem(Icons.map, 1),
            buildNavItem(Icons.favorite, 2),
            buildNavItem(Icons.person, 3),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(IconData icon, int index) {
    final isSelected = selectedIndex == index;

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
