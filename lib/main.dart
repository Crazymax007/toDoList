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
      body: SizedBox.expand(
        child: Container(
          padding: const EdgeInsets.only(top: 40.0, left: 10.0),
          color: const Color.fromARGB(255, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Take',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                  height: 0.9, // ปรับระยะห่างระหว่างบรรทัด
                ),
              ),
              const Text(
                'your',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                  height: 0.9, // ปรับระยะห่างระหว่างบรรทัด
                ),
              ),
              const Text(
                'time',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                  height: 0.9, // ปรับระยะห่างระหว่างบรรทัด
                ),
              ),
              const Text(
                "We are born to be happy not to race with other people on everything we do",
                style: TextStyle(color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {
                  // ฟังก์ชันที่เรียกเมื่อปุ่มถูกกด
                  print('Button Pressed!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blue, // เปลี่ยนจาก primary เป็น backgroundColor
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15), // ขนาดของปุ่ม
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // ขอบโค้ง
                  ),
                ),
                child: const Text('Press Me'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
