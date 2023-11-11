
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class CameraGallery extends StatefulWidget {
  const CameraGallery({super.key});

  @override
  State<CameraGallery> createState() => _CameraGalleryState();
}

class _CameraGalleryState extends State<CameraGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: MaterialButton(
              color: Colors.red,
              onPressed: () {
                cameraScan();
              },
              child: Text(
                "Scan Image",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          //
          const SizedBox(
            height: 20,
          ),

          Center(
            child: MaterialButton(
              color: Colors.red,
              onPressed: () {
                imagePicker();
              },
              child: Text(
                "Pick Image from Gallery",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future imagePicker() async {
  await ImagePicker().pickImage(source: ImageSource.gallery);
}

Future cameraScan() async {
  await ImagePicker().pickImage(source: ImageSource.camera);
}
