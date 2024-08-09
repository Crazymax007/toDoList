import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // นำเข้าแพ็กเกจ Google Fonts

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 70.0),
          color: const Color.fromARGB(255, 27, 26, 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ข้อความ "Take your time" อยู่ที่เดิม
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Take',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 80,
                        fontWeight: FontWeight.w700,
                        height: 0.9, // ปรับระยะห่างระหว่างบรรทัด
                        color: Colors.white, // เพิ่มสีขาวให้กับข้อความ
                      ),
                    ),
                    Text(
                      'your',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 80,
                        fontWeight: FontWeight.w700,
                        height: 0.9, // ปรับระยะห่างระหว่างบรรทัด
                        color: Colors.white, // เพิ่มสีขาวให้กับข้อความ
                      ),
                    ),
                    Text(
                      'time',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 80,
                        fontWeight: FontWeight.w700,
                        height: 0.9, // ปรับระยะห่างระหว่างบรรทัด
                        color: Colors.white, // เพิ่มสีขาวให้กับข้อความ
                      ),
                    ),
                  ],
                ),
              ),
              // ข้อความกลาง
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(
                      top: 250), // ปรับระยะห่างจากขอบซ้ายและขวา
                  child: Text(
                    "We are born to be happy, \nnot to race with other people \non everything we do",
                    textAlign: TextAlign.start, // จัดตำแหน่งข้อความที่เริ่มต้น
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: 20, // ปรับขนาดข้อความตามที่ต้องการ
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // เพิ่มสีขาวให้กับข้อความ
                    ),
                  ),
                ),
              ),

              // ปุ่มอยู่ที่ล่างสุด
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      // แสดงกล่องข้อความป๊อปอัพ
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Note'),
                            content: const Text('ยังไม่ได้ทำนะจ๊ะ'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // ปิดกล่องข้อความ
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 10), // ปรับขนาดของปุ่มให้เหมาะสม
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // ขอบโค้ง
                      ),
                    ),
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      child: Center(
                        child: Text(
                          "Get Started",
                          textAlign: TextAlign.center, // จัดตำแหน่งข้อความกลาง
                          overflow: TextOverflow.ellipsis, // จัดการกับข้อความยาว
                          style: GoogleFonts.cormorantGaramond(
                            fontSize: 35,
                            fontWeight: FontWeight.w800,
                            color: Colors.black, // เพิ่มสีดำให้กับข้อความ
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
