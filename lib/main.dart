import 'package:flutter/material.dart';
import 'home.dart'; // นำเข้าคลาส HomePage

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
