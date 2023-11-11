import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      title: 'Welcome to App',
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      image: 'assets/onboarding_1.png',
    ),
    OnboardingItem(
      title: 'Explore Features',
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      image: 'assets/onboarding_2.png',
    ),
    OnboardingItem(
      title: 'Get Started',
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      image: 'assets/onboarding_3.png',
    ),
    OnboardingItem(
      title: 'Easy to Use',
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      image: 'assets/onboarding_4.png',
    ),
    OnboardingItem(
      title: 'Ready to Go',
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      image: 'assets/onboarding_5.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: _onboardingItems,
            ),
          ),
          OnboardingIndicator(
            count: _onboardingItems.length,
            currentIndex: _currentIndex,
          ),
        ],
      ),
    );
  }
}

class OnboardingItem extends StatelessWidget {
  final String title;
  final String text;
  final String image;

  OnboardingItem({
    required this.title,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 24.0),
        Image.asset(image),
      ],
    );
  }
}

class OnboardingIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  OnboardingIndicator({required this.count, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          count,
          (index) {
            return Container(
              margin: EdgeInsets.all(5.0),
              width: 10.0,
              height: 10.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == index
                    ? Colors.blue
                    : Colors.grey.withOpacity(0.6),
              ),
            );
          },
        ),
      ),
    );
  }
}
