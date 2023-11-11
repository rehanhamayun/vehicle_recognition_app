import 'package:flutter/material.dart';
import 'package:vehicle_recognition/Model/constants.dart';

class HorizontalCardScroll extends StatelessWidget {
  final List<String> reviews = [
    "This app is amazing and help me identify various \n vehicles! \n \n ⭐⭐⭐⭐⭐ ",
    "I love the design!  \n ⭐⭐⭐⭐⭐",
    "Great user experience! \n ⭐⭐⭐⭐⭐",
    "Highly recommended! \n ⭐⭐⭐⭐⭐",
    "Fantastic work! \n ⭐⭐⭐⭐⭐",
  ];

  HorizontalCardScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: reviews.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.white,
            elevation: 1.0,
            child: Container(
              //width: double.infinity, // Adjust the card width as needed
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Review ${index + 1}",
                    style: texter,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    reviews[index],
                    style: text1,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
