import 'package:flutter/material.dart';
import 'package:praktikum_9/camera_screen.dart';
import 'package:praktikum_9/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImagePickerScreen(
        ImageSourceType.camera,
      ),

      // MyCameraScreen()
    );
  }
}
