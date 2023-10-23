import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.all(Radius.circular(15)),
        color: Color(0xFF313131),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 15),
          prefixIcon: Icon(
            Iconsax.search_normal_1,
            color: Colors.white,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFC67C4E),
              ),
              width: 44,
              height: 44,
              child: Icon(
                Iconsax.setting_4,
                color: Colors.white,
              ),
            ),
          ),
          border: InputBorder.none,
          hintText: 'Search coffee',
          hintStyle: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF989898),
          ),
        ),
      ),
    );
  }
}
