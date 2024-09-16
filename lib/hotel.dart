import 'package:flutter/material.dart';

class HotelCard extends StatefulWidget {
  final String imagePath;
  final String hotelName;
  final String price;
  final String location;
  final String distanceToCity;
  final String reviews;

  HotelCard({
    required this.imagePath,
    required this.hotelName,
    required this.price,
    required this.location,
    required this.distanceToCity,
    required this.reviews,
  });

  @override
  _HotelCardState createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final commonTextStyle = TextStyle(
      color: Colors.grey,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 16,
    );

    final hotelNameStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
    );

    final priceStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
      color: Colors.black,
    );

    final locationStyle = TextStyle(
      fontSize: 15,
      color: Colors.grey,
    );

    final perNightStyle = TextStyle(
      fontSize: 15,
      color: const Color.fromARGB(255, 10, 10, 10),
    );

    final locationIcon = Icon(
      Icons.location_on,
      color: Color.fromARGB(255, 80, 212, 168),
      size: 15,
    );

    final heartIcon = Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 208, 214, 215),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Color.fromARGB(255, 116, 200, 227),
          size: 24,
        ),
      ),
    );

    final stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Color.fromARGB(255, 80, 212, 168), size: 15),
        Icon(Icons.star, color: Color.fromARGB(255, 80, 212, 168), size: 15),
        Icon(Icons.star, color: Color.fromARGB(255, 80, 212, 168), size: 15),
        Icon(Icons.star, color: Color.fromARGB(255, 80, 212, 168), size: 15),
        const Icon(Icons.star_border_outlined,
            color: Color.fromARGB(255, 80, 212, 168), size: 15),
      ],
    );

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                    child: Image.asset(
                      widget.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: heartIcon,
                  ),
                ),
              ],
            ),
            SizedBox(height: 9),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.hotelName,
                  style: hotelNameStyle,
                ),
                Text(
                  widget.price,
                  style: priceStyle,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  widget.location,
                  style: locationStyle,
                ),
                locationIcon,
                SizedBox(width: 4),
                Text(
                  widget.distanceToCity,
                  style: locationStyle,
                ),
                Spacer(),
                Text(
                  'per night',
                  style: perNightStyle,
                ),
              ],
            ),
            Row(
              children: [
                stars,
                Text('${widget.reviews} Reviews', style: commonTextStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
