import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:vehicle_recognition/View/Camera/camera.dart';
import 'package:vehicle_recognition/View/home_page.dart';
import 'package:vehicle_recognition/View/my_vehicles.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const RecognizeScreen(),
    const CameraScreen(),
    const MyVehiclesScreen(),
    const SupportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: 5, // 5 items, including the camera icon
            tabBuilder: (int index, bool isActive) {
              Color color = isActive ? Colors.red : Colors.grey;
              IconData? iconData;

              if (index == 0) {
                iconData = CupertinoIcons.home;
              } else if (index == 1) {
                iconData = CupertinoIcons.search;
              } else if (index == 2) {
                iconData = CupertinoIcons.camera_fill; // Camera icon
              } else if (index == 3) {
                iconData = CupertinoIcons.car_detailed;
              } else if (index == 4) {
                iconData = CupertinoIcons.settings_solid;
              }

              String label = '';
              switch (index) {
                case 0:
                  label = 'Home';

                  break;
                case 1:
                  label = 'Recognize';
                  break;
                case 2:
                  label = 'Camera';
                  break;
                case 3:
                  label = 'My Vehicles';
                  break;
                case 4:
                  label = 'Support';
                  break;
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    iconData,
                    color: color,
                  ),
                  Text(
                    label,
                    style: TextStyle(color: color),
                  ),
                ],
              );
            },
            activeIndex: _currentIndex,
            gapLocation: GapLocation.none,
            notchSmoothness: NotchSmoothness.defaultEdge,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            }));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: HomePage(),
    );
  }
}

class RecognizeScreen extends StatelessWidget {
  const RecognizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Recognize Page'),
    );
  }
}

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CameraGallery();
  }
}

class MyVehiclesScreen extends StatelessWidget {
  const MyVehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyListView();
  }
}

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Support Page'),
    );
  }
}
