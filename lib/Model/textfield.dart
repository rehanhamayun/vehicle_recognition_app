import 'package:flutter/material.dart';
import 'package:vehicle_recognition/Model/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        fillColor: textFieldColor.withOpacity(0.4),
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 17,
          height: 2,
          color: Colors.grey.withOpacity(0.9),
        ),
      ),
    );
  }
}
