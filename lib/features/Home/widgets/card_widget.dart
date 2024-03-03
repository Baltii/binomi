import 'package:flutter/material.dart';

class ScrollCardHorizontalCard extends StatefulWidget {
  const ScrollCardHorizontalCard({
    Key? key,
    required this.image,
    required this.title,
    required this.adress,
    required this.room,
    required this.person,
    required this.price,
  }) : super(key: key);

  final String image, title, adress;
  final int room, person;
  final double price;

  @override
  _ScrollCardHorizontalCardState createState() =>
      _ScrollCardHorizontalCardState();
}

class _ScrollCardHorizontalCardState extends State<ScrollCardHorizontalCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail');
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20, top: 20 / 2),
        padding: const EdgeInsets.all(14.22),
        width: 255.9,
        height: 340.14,
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
            Container(
              width: 227.47,
              height: 177.71,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.22),
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 14.22,
              left: 14.22,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(9.48),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.22),
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_outline,
                    color: isFavorite ? Colors.red : Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 14.22,
              right: 14.22,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.22),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '4.5',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 14.22,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 190,
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
                          fontSize: 20,
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
      ),
    );
  }
}
