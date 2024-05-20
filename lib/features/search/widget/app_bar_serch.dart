import 'package:binomi/features/search/widget/bottom_sheet_filter.dart';
import 'package:flutter/material.dart';

class AppBarSearch extends StatelessWidget {
  final Function(String) onSearch;
  final TextEditingController searchController;

  const AppBarSearch({
    Key? key,
    required this.onSearch,
    required this.searchController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                        hintStyle:
                            TextStyle(color: Color(0xff7D7F88), fontSize: 12),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      onSearch(searchController.text);
                    },
                  ),
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
