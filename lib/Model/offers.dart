import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hover and Click Cards'),
        ),
        body: const CardList(),
      ),
    );
  }
}

class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  final List<Color> _cardColors = [
    Colors.white.withOpacity(0.8),
    Colors.white.withOpacity(0.8),
    Colors.white.withOpacity(0.8),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          buildCard(0, 'Lifetime', 'This is the content for Card 1'),
          buildCard(
            1,
            'Lifetime',
            'This is the content for Card 2',
          ),
          buildCard(2, '3 Days Free Trial', 'This is the content for Card 3'),
        ],
      ),
    );
  }

  Widget buildCard(int index, String header, String content) {
    return InkWell(
      onHover: (hovered) {
        setState(() {
          _cardColors[index] = hovered ? Colors.lightBlue : Colors.white;
        });
      },
      onTap: () {
        setState(() {
          _cardColors[index] = Colors.green; // Change the color when clicked
        });
      },
      child: Card(
        elevation: 0,
        color: _cardColors[index],
        child: Container(
          height: 60,
          width: double.infinity,
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  header,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // SizedBox(height: 8.0),
              Center(
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
