import 'package:flutter/material.dart';
import 'hotel.dart';

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HotelCard(
                imagePath: 'hotel1.png',
                hotelName: 'Grand Royal Hotel',
                price: '\$180', 
                location: 'Wembley, London',
                distanceToCity: '2km to city',
                reviews: '58',
              ),
              SizedBox(height: 16),
              HotelCard(
                imagePath: 'hotel2.png',
                hotelName: 'Queen Hotel',
                price: '\$220',
                location: 'Wembley, London',
                distanceToCity: '2km to city',
                reviews: '80',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MainApp());
}
