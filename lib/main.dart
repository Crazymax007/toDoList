import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,  // เพิ่ม alignment ให้ Text อยู่กลางจอ
        color: Color.fromARGB(255, 0, 0, 0), // แก้ไขค่า alpha ให้เป็น 255 เพื่อให้สีดำสนิท
        child: const Text(
          "Take",
          style: TextStyle(color: Colors.white, fontSize: 24), // เพิ่มขนาดฟอนต์ให้ใหญ่ขึ้น
        ),
      ),
    );
  }
}
