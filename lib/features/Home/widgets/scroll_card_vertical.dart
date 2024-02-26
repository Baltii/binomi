import 'package:flutter/material.dart';

class ScrollCardVertical extends StatefulWidget {
  const ScrollCardVertical({Key? key}) : super(key: key);

  @override
  _ScrollCardVerticalState createState() => _ScrollCardVerticalState();
}

class _ScrollCardVerticalState extends State<ScrollCardVertical> {
  int selectedIndexButton = 0;
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Text(
                'Recomanded Homes ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              HomeRecomandedCard(
                image: "assets/images/home1.jpg",
                title: "House S+4 for students",
                adress: "Rades, Ben Arous",
                room: 4,
                person: 4,
                price: 150,
              ),
              HomeRecomandedCard(
                image: "assets/images/home2.jpg",
                title: "House S+3 for students",
                adress: "Rades, Ben Arous",
                room: 3,
                person: 4,
                price: 150,
              ),
              HomeRecomandedCard(
                image: "assets/images/home1.jpg",
                title: "House S+4 for students",
                adress: "Rades, Ben Arous",
                room: 4,
                person: 4,
                price: 150,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeRecomandedCard extends StatefulWidget {
  const HomeRecomandedCard({
    Key? key,
    required this.image,
    required this.title,
    required this.adress,
    required this.room,
    required this.person,
    required this.price,
  }) : super(key: key);

  final String image, title, adress;
  final int price, room, person;

  @override
  _HomeRecomandedCardState createState() => _HomeRecomandedCardState();
}

class _HomeRecomandedCardState extends State<HomeRecomandedCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail');
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 20 / 2,
        ),
        padding: const EdgeInsets.only(left: 12.22, top: 12.22, bottom: 12.22),
        width: 359,
        height: 144,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.5),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 33.8,
              color: Colors.grey.withOpacity(0.2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: 103,
                  height: 145,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.22),
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 150,
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                          maxLines: 1, // Limite le titre à une ligne
                          overflow: TextOverflow
                              .ellipsis, // Ajoute "..." s'il dépasse la largeur
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Color(0xff7D7F88),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            widget.adress,
                            style: const TextStyle(color: Color(0xff7D7F88)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(
                            Icons.king_bed,
                            color: Color(0xff7D7F88),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${widget.room} rooms',
                            style: const TextStyle(color: Color(0xff7D7F88)),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.person,
                            color: Color(0xff7D7F88),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${widget.person} persons',
                            style: const TextStyle(color: Color(0xff7D7F88)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${widget.price}DT',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            '/Month',
                            style: TextStyle(color: Color(0xff7D7F88)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 5,
              left: 4,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 12,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '4.5',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(9.48),
                  decoration: BoxDecoration(
                    color: const Color(0xffEEEEEE),
                    borderRadius: BorderRadius.circular(14.22),
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_outline,
                    color: isFavorite ? Colors.red : Colors.black,
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
