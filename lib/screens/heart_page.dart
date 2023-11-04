import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color.fromARGB(255, 251, 249, 249),
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "Bag",
                    style: GoogleFonts.sora(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2F2D2C),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ]))
        ]));
  }
}
