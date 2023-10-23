import 'package:coffee_shop_app/test.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/home_image2.png'),
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 315,
              height: 129,
              child: Text(
                "Coffee so good, your taste buds will love it.",
                textAlign: TextAlign.center,
                style: GoogleFonts.sora(
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 0.34,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 315,
              height: 44,
              child: Text(
                "The best grain, the finest roast, the powerful flavor.",
                textAlign: TextAlign.center,
                style: GoogleFonts.sora(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFA9A9A9),
                  letterSpacing: 0.14,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TestTest()));
              },
              child: Container(
                  width: 315,
                  height: 62,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFFC67C4E),
                  ),
                  child: Center(
                    child: Text(
                      'Get Started',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sora(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
