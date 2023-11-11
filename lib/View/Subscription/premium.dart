import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicle_recognition/Model/bottom_bar.dart';
import 'package:vehicle_recognition/Model/constants.dart';
import 'package:vehicle_recognition/Model/offers.dart';
import 'package:vehicle_recognition/Model/review.dart';

class PremiumSPY extends StatefulWidget {
  const PremiumSPY({super.key});

  @override
  State<PremiumSPY> createState() => _PremiumSPYState();
}

class _PremiumSPYState extends State<PremiumSPY> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Column(
        children: [
          Container(
            color: Colors.grey.withOpacity(0.07),
            height: height * 0.24,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Text(
                        "I-SPY Premium",
                        style: texter,
                      ),
                    ),
                    //
                    const SizedBox(
                      width: 20,
                    ),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(elevation: 0),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyHomePage()));
                        },
                        child: Text(
                          "Skip",
                          style: texter,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Premium Status",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "APP OF THE",
                          style: text1,
                        ),
                        Text(
                          "DAY #1",
                          style: GoogleFonts.poppins(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    //

                    Column(
                      children: [
                        Text(
                          "BEST-CARS",
                          style: text1,
                        ),
                        Text(
                          "APP ",
                          style: GoogleFonts.poppins(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          //

          SizedBox(
            height: height * 0.18,
            width: double.infinity,
            //color: Colors.green,
            child: HorizontalCardScroll(),
          ),
          //

          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: SizedBox(
              height: height * 0.3,
              width: double.infinity,
              child: const CardList(),
            ),
          ),
          //

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              height: height * 0.07,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Remind me when trial ends",
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Icon(
                    CupertinoIcons.alarm,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          //
          const SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: height * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    "Try for Free",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //

          Center(
            child: Text(
              "After the 3-day free trial period you'll be charged  \n Rs.1650 per 1-week unless you cancel before the \n trial expires.",
              style: GoogleFonts.poppins(
                color: Colors.black87,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
