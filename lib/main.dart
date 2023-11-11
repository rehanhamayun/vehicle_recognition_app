import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_recognition/Controller/user_controller.dart';
import 'package:vehicle_recognition/Model/bottom_bar.dart';
import 'package:vehicle_recognition/Onboarding/onboarding.dart';
import 'package:vehicle_recognition/View/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: OnboardingScreen(),
      ),
    );
  }
}
