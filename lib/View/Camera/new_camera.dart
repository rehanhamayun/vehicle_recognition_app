import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';




class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  final photos = <File>[];

  void openCamera() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CameraCamera(
              onFile: (file) {
                photos.add(file);
                Navigator.pop(context);
                setState(() {});
              },
            )));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: photos.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: size.width,
            child: kIsWeb
                ? Image.network(photos[index].path)
                : Image.file(
              photos[index],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openCamera,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}