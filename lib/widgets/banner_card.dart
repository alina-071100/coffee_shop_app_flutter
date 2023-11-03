import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerCard extends StatefulWidget {
  const BannerCard({super.key});

  @override
  State<BannerCard> createState() => _BannerCardState();
}


class _BannerCardState extends State<BannerCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 145,
          width: double.infinity,
          
          decoration: BoxDecoration(
              color: Colors.red,
              image: const DecorationImage(
                  filterQuality: FilterQuality.medium,
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/coffee_cup.png')),
              borderRadius: BorderRadius.circular(16)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 23, top: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 60,
                  height: 26,
                  decoration: BoxDecoration(
                    color: const Color(0xFFED5151),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                      child: Text(
                    "Promo",
                    style: GoogleFonts.sora(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ))),
              const SizedBox(
                height: 8,
              ),
              Container(
                  alignment: Alignment.bottomLeft,
                  width: 213,
                  height: 37,
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        spreadRadius: -7,
                        color: Colors.black,
                        offset: Offset(-6, 10)),
                  ]),
                  child: Text(
                    "Buy one get",
                    style: GoogleFonts.sora(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              const SizedBox(
                height: 2,
              ),
              Container(
                  width: 160,
                  height: 37,
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        spreadRadius: -7,
                        color: Colors.black,
                        offset: Offset(-6, 10)),
                  ]),
                  child: Text(
                    "one FREE",
                    style: GoogleFonts.sora(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
