import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypeToggle extends StatefulWidget {
  const TypeToggle({super.key});

  @override
  State<TypeToggle> createState() => _TypeToggleState();
}

class _TypeToggleState extends State<TypeToggle> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      height: 50,
      decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedTab = 0;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                width: 180,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selectedTab == 0 ?const Color(0xffC67C4E) :  Color(0xfffff),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Deliver",
                  style: GoogleFonts.sora(
                    color: selectedTab == 0 ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedTab = 1;
              });
            },
            child: Container(
              width: 160,
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:
                    selectedTab == 1 ? const Color(0xffC67C4E) :const Color(0xfffff),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Pick Up",
                style: GoogleFonts.sora(
                  color:
                      selectedTab == 1 ? Colors.white : const Color(0xFF2F2D2C),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
