import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vehicle_recognition/Model/constants.dart';
import 'package:vehicle_recognition/Model/textfield.dart';
import 'package:vehicle_recognition/View/Auth/sign_in.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> registerUser() async {
    const String apiUrl = 'http://localhost:3000/register';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': nameController.text,
          'phoneNumber': phoneNumberController.text,
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 201) {
        // Registration successful
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'User Registered',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            content: const Text('You can sign In now!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
        print('User registered successfully');
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Signup Error'),
            content: const Text('An error occurred while signing up'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );

        print('Registration failed. Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during registration: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 60,
            ),
            CustomTextField(controller: nameController, hintText: "Full Name"),
            const SizedBox(height: 16.0),
            CustomTextField(
                controller: phoneNumberController, hintText: "Phone No."),
            const SizedBox(height: 16.0),
            CustomTextField(controller: emailController, hintText: "Email"),
            const SizedBox(height: 16.0),
            CustomTextField(
                controller: passwordController, hintText: "password"),
            const SizedBox(height: 32.0),
            InkWell(
              onTap: () {
                registerUser();
              },
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(
                    17,
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                "OR",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: textFieldColor,
                ),
                borderRadius: BorderRadius.circular(
                  17,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //  crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Image.asset(
                    "assets/images/google.png",
                    height: 24,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Sign in With Google",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
