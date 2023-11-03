import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color backgroundColor = Colors.black;
  static const Color backgroundColor2 = Color(0xFFF9F9F9);

  static const Color textColor = Colors.white;

  static const Color buttonColor = Color(0xFFC67C4E);
  static const Color button2Color = Colors.white;

  static const Color gardientColor = Color(0xFF131313);
  static const Color gardient2Color = Color(0xFF313131);

  static const Color orange2Color = Color(0xffD17742);
  static const Color gray1Color = Color(0xff4C4F54);
  static const Color gray2Color = Color(0xff52575D);
  static const Color gray3Color = Color(0xff83868D);
  static const Color iconColor = Color(0xff53585C);
  static const Color iconActiveColor = Color(0xffCE7943);
  static const Color switchTextColor = Color(0xFF2F4B4E);

  static const Color starColor = Colors.yellow;

  // Page Indicator

  static TextStyle homeTitle = GoogleFonts.sora(
      color: Colors.white,
      fontSize: 34,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.34);

  static TextStyle homeSubtile = GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: const Color(0xFFA9A9A9),
    letterSpacing: 0.14,
  );

  static TextStyle bottomText = GoogleFonts.sora(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle menueTetxtTitle = GoogleFonts.sora(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: const Color(0xFFB7B7B7),
    letterSpacing: 0.12,
  );

  static TextStyle locationText = GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFDDDDDD),
  );
  static TextStyle largeText = GoogleFonts.sora(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF2F2D2C),
  );

  static TextStyle coffeeWithText = GoogleFonts.sora(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF9B9B9B),
  );

  static TextStyle coffeePriceText = GoogleFonts.sora(
    fontWeight: FontWeight.w600,
    color: const Color(0xFF2F4B4E),
    fontSize: 18,
  );

  static TextStyle priceText = GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF9B9B9B),
  );

  static TextStyle priceValue = GoogleFonts.sora(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: const Color(0xFFC67C4E));

  static TextStyle coffeeNameText = GoogleFonts.sora(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF2F2D2C),
  );

  static TextStyle readeMoreText = GoogleFonts.sora(
    fontSize: 14,
    height: 1.65,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF9B9B9B),
  );

  static TextStyle subtileLarge = GoogleFonts.sora(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xFF303336),
  );

  // Reviews Ratings
  static const Color reviewIconColor = Color(0xffD98046);
  // Style
  static TextStyle tileLarge = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  // Search
  static const Color searchCursorColor = Color(0xff52575D);
  static const Color searchBacgroundColor = Color(0xff141821);
  static TextStyle searchTextStyle = GoogleFonts.roboto(
    color: const Color(0xff52575D),
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  // Carda Large TextStyle
  static const Color cardChipBackgroundColor = Color(0xff131218);
  static TextStyle cardChipTextStyle = GoogleFonts.roboto(
    color: const Color(0xffA99A97),
    fontSize: 12,
    fontWeight: FontWeight.w800,
  );
  static TextStyle cardTitleLarge = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );
  static TextStyle cardTitleMedium = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w800,
  );
  static TextStyle cardTitleSmall = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle cardSubtitleLarge = GoogleFonts.roboto(
    color: const Color(0xffA99A97),
    fontSize: 14,
    fontWeight: FontWeight.w800,
  );
  static TextStyle cardSubtitleMedium = GoogleFonts.roboto(
    color: const Color(0xff83868D),
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
  static TextStyle cardSubtitleSmall = GoogleFonts.roboto(
    color: const Color(0xff83868D),
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  // // Price TextStyle
  // static TextStyle priceCurrencySmall = GoogleFonts.roboto(
  //   color: const Color(0xffD98046),
  //   fontSize: 18,
  //   fontWeight: FontWeight.w500,
  // );
  // static TextStyle priceValueSmall = GoogleFonts.roboto(
  //   color: Colors.white,
  //   fontSize: 18,
  //   fontWeight: FontWeight.w500,
  // );
  // static TextStyle priceCurrencyLarge = GoogleFonts.roboto(
  //   color: const Color(0xffD98046),
  //   fontSize: 24,
  //   fontWeight: FontWeight.bold,
  // );
  // static TextStyle priceTitleLarge = GoogleFonts.roboto(
  //   color: const Color(0xff979696),
  //   fontSize: 18,
  //   fontWeight: FontWeight.w400,
  // );
  // static TextStyle priceValueLarge = GoogleFonts.roboto(
  //   color: Colors.white,
  //   fontSize: 24,
  //   fontWeight: FontWeight.bold,
  // );

  // // Description TextStyle
  // static TextStyle descriptionTitle = GoogleFonts.roboto(
  //   color: const Color(0xff93969B),
  //   fontSize: 18,
  //   fontWeight: FontWeight.w800,
  // );
  // static TextStyle descriptionContent = GoogleFonts.roboto(
  //   color: Colors.white,
  //   fontSize: 14,
  //   fontWeight: FontWeight.w400,
  //   height: 1.4,
  // );
  // static TextStyle descriptionReadMore = GoogleFonts.roboto(
  //   color: const Color(0xffD07540),
  //   fontSize: 14,
  //   fontWeight: FontWeight.w400,
  // );

  // // Chips TextStyle
  // static TextStyle chipActive = GoogleFonts.roboto(
  //   color: const Color(0xffD98046),
  //   fontSize: 14,
  //   fontWeight: FontWeight.bold,
  // );
  // static TextStyle chipInactive = GoogleFonts.roboto(
  //   color: const Color(0xff4C4F54),
  //   fontSize: 14,
  //   fontWeight: FontWeight.bold,
  // );

//   // Buttons Style
//   static const Color buttonBackground1Color = Color(0xffD98046);
//   static const Color buttonBackground2Color = Color(0xff141823);
//   static const Color buttonBorderColor = Color(0xffD17742);
//   static TextStyle buttonTextStyle = GoogleFonts.roboto(
//     color: Colors.white,
//     fontSize: 18,
//     fontWeight: FontWeight.w800,
//   );
//   static TextStyle buttonActiveTextStyle = GoogleFonts.roboto(
//     color: const Color(0xffD17742),
//     fontSize: 18,
//     fontWeight: FontWeight.w800,
//   );
//   static TextStyle buttonInactiveTextStyle = GoogleFonts.roboto(
//     color: const Color(0xffA6A2A2),
//     fontSize: 18,
//     fontWeight: FontWeight.w800,
//   );
// }
}
