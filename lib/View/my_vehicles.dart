import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicle_recognition/Model/constants.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Vehicles",
          style: texter,
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return CardItem(
            title: 'Vehicle $index',
            description: 'Details of Vehicle \nRaring Score \nSpeed ',
          );
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String description;

  const CardItem({super.key, 
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //
        showDialog(
          context: context,
          builder: (context) => const CustomDialog(),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(16.0),
        child: ListTile(
          title: Text(title),
          subtitle: Text(description),
        ),
      ),
    );
  }
}

// Trading Card
class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [Colors.red, Colors.white38]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'BUGATTI CHIRON 1234 ',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 0.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/images/bob.png",
                    height: 80,
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 150,
                child: Image.asset(
                  "assets/images/buggati.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "The Bugatti Chiron is a mid-engine two-seater sports car designed and developed in Germany",
                style: text4,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Engine Size:",
                    style: text3,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "V8 engine",
                    style: text4,
                  ),
                ],
              ),
              //
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Top Speed:",
                    style: text3,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "380 km/h (236 mph) ",
                    style: text4,
                  ),
                ],
              ),
              //
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Gear Box:",
                    style: text3,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "7-speed dual-clutch automatic",
                    style: text4,
                  ),
                ],
              ),
//
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Fuel Consumption:",
                    style: text3,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "22.5 L/100 km",
                    style: text4,
                  ),
                ],
              ),
              //
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Style:",
                    style: text3,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Sports Car",
                    style: text4,
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.withOpacity(
                  0.7,
                )),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text(
                  'Close',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
