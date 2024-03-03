// ignore_for_file: library_private_types_in_public_api

import 'package:binomi/features/Home/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class ScrollCardHorizontal extends StatefulWidget {
  // final List<Annonce> annonces;
  const ScrollCardHorizontal({super.key});

  @override
  _ScrollCardHorizontalState createState() => _ScrollCardHorizontalState();
}

class _ScrollCardHorizontalState extends State<ScrollCardHorizontal> {
  int selectedIndexButton = 0;
  final List<String> buttonLabels = ['Nearest', 'Popular', 'Top Rates'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Text(
                'Let\'s Find The Best Home',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: List.generate(
              buttonLabels.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndexButton = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  margin: const EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(
                    color: selectedIndexButton == index ? Colors.black : null,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    buttonLabels[index],
                    style: TextStyle(
                      color: selectedIndexButton == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: _annonces
        //           .where(
        //               (annonce) => annonce != null) // Filter out null elements
        //           .map((annonce) {
        //       return ScrollCardHorizontalCard(
        //         image: 'assets/images/home1.jpg',
        //         title: annonce.title,
        //         adress: annonce.location,
        //         room: annonce.roomNumber,
        //         person: annonce.placeInRoom,
        //         price: annonce.price,
        //       );
        //     }).toList(),
        //   ),
        // ),
      ],
    );
  }
}
