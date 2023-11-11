import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle_recognition/Controller/user_controller.dart';
import 'package:vehicle_recognition/Model/bottom_bar.dart';
import 'package:vehicle_recognition/Model/constants.dart';
import 'package:vehicle_recognition/Model/textfield.dart';
import 'package:vehicle_recognition/Model/user_model.dart';
import 'package:vehicle_recognition/View/Auth/sign_up.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late SharedPreferences prefs; // Declare SharedPreferences variable

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences(); // Initialize SharedPreferences in initState
  }

  Future<void> initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> loginUser() async {
    const String apiUrl = 'http://localhost:3000/signin';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Login successful
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String? fullName = responseData['name'];
        final String token = responseData['token'];

        final user = User(fullName: fullName.toString());
        context.read<UserController>().setUser(user);

        // Save the token locally using SharedPreferences
        prefs.setString('token', token);

        // Navigate

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MyHomePage()));

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Succesful!'),
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

        print('User logged in successfully');
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Error'),
            content: const Text('An error occurred during login'),
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
        // Login failed
        // print('Login failed. Error: ${response.statusCode}');
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Error'),
          content: Text('An error occurred during login: $e'),
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
      print('Error during login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign In',
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 0,
            ),
            SizedBox(
              height: 180,
              width: double.infinity,
              // color: Colors.green,
              child: Image.asset("assets/images/bob.png"),
            ),
            CustomTextField(controller: emailController, hintText: "Email"),
            const SizedBox(height: 16.0),
            CustomTextField(
                controller: passwordController, hintText: "password"),
            const SizedBox(height: 32.0),
            InkWell(
              onTap: () {
                loginUser();
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
                    "Login",
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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
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
                            builder: (context) => const RegisterScreen()));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            //

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
