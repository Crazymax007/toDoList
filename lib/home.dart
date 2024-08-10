import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'list.dart'; // นำเข้าคลาส ListPage

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
                        height: 0.9,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'your',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 80,
                        fontWeight: FontWeight.w700,
                        height: 0.9,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'time',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 80,
                        fontWeight: FontWeight.w700,
                        height: 0.9,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(top: 250),
                  child: Text(
                    "We are born to be happy, \nnot to race with other people \non everything we do",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: StartButton(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget StartButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ListPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      child: Container(
        child: Center(
          child: Text(
            "Get Started",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 35,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
