import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_recognition/Controller/user_controller.dart';
import 'package:vehicle_recognition/View/Auth/sign_in.dart';
import 'package:vehicle_recognition/View/Subscription/premium.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userP = context.watch<UserController>();
    final user = userP.user;

    final fullName = user?.fullName ?? 'Guest!';

    //double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(
          0.04,
        ),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            child: Container(
              child: const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(CupertinoIcons.profile_circled),
              ),
            ),
          ),
        ],
        title: Text(
          "Hi, ${fullName.toString()}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
        ),
      ),
      //
      body: Column(
        children: [
          Container(
            height: height * 0.15,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.04),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: TextField(
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                  hintText: "Search for Vehicles",
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.8),
                    fontSize: 18,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //
          SizedBox(
            height: height * 0.01,
          ),

          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PremiumSPY()));
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  height: height * 0.1,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      colors: [
                        Colors.black,
                        Colors.brown,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            "assets/images/new-email.png",
                            height: 50,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Column(
                            children: [
                              Text(
                                "FREE Premium Account",
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Tap to upgrade your account!",
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
