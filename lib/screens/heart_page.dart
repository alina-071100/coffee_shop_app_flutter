import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 251, 249, 249),
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(children: [
              const  SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "Favorit",
                    style: GoogleFonts.sora(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2F2D2C),
                    ),
                  ),
                ),
               const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const SizedBox(
                          height: 30,
                        ),
                       const Icon(
                          Iconsax.heart,
                          size: 40,
                          color: Colors.grey,
                        ),
                       const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Your favorit list is empty!",
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]))
        ]));
  }
}
