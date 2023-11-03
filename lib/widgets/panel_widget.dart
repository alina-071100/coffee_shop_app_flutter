import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;

  const PanelWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        controller: controller,
        children: [
          SizedBox(
            height: 10,
          ),
          buildHandle(),
          SizedBox(
            height: 16,
          ),
          buildAboutText(),
          SizedBox(height: 24),
        ],
      );

  Widget buildHandle() => Center(
        child: Container(
          height: 5,
          width: 45,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(12)),
        ),
      );

  Widget buildAboutText() => Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "10 minutes left",
              style: GoogleFonts.sora(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF303336),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Delivery to",
                  style: GoogleFonts.sora(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF808080)),
                ),
                Text(
                  " Jl. Kpg Sutoyo",
                  style: GoogleFonts.sora(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF303336),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 4,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Color(0xFF36C07E),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 4,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Color(0xFF36C07E),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                 const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 4,
                    width: 65,
                    decoration: BoxDecoration(
                        color: const Color(0xFF36C07E),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                 const  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 4,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color(0xFFFFFFFF),
                    border: Border.all(color: const Color(0xFFEAEAEA))),
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFDEDEDE))),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color(0xFFF9F9F9),
                          ),
                          child: Image.asset(
                            "assets/icons/motorbike.png",
                            color: const Color(0xFFC67C4E),
                            // height: 24,
                            // width: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, top: 14),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Delivered your order",
                              style: GoogleFonts.sora(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF303336),
                              ),
                            ),
                           const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "We deliver your goods to you in \n the shortes possible time.",
                              style: GoogleFonts.sora(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color:const  Color(0xFF808080),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
           const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/deliver.png',
                          ),
                        )),
                  ),
                 const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Johan Hawn",
                          style: GoogleFonts.sora(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const  Color(0xFF303336),
                          ),
                        ),
                       const SizedBox(height: 8),
                        Text(
                          "Personal Courier",
                          style: GoogleFonts.sora(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF808080),
                          ),
                        )
                      ],
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFFDEDEDE),
                        )),
                    child: const SizedBox(
                      height: 54,
                      width: 54,
                      child:  Icon(
                        Icons.phone_in_talk_rounded,
                        color: Color(0xFF808080),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
