import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatefulWidget {
  String? title;
  IconData? suffixIcon;
  void Function()? functionBackIcon;
  void Function()? functionLikeIcon;
  Icon? icon;
  CustomAppBar(
      {super.key,
      this.title,
      this.suffixIcon,
      this.icon,
      this.functionBackIcon,
      this.functionLikeIcon});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isFavorited = false;

  void toggleLike() {
    setState(() {
      isFavorited = !isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: widget.functionBackIcon,
            // width: 38,
            // height: 38,
            // borderRadius: 10,
            child: const Icon(
              Iconsax.arrow_left_24,
              color: Colors.black,
              size: 24,
            ),
          ),
          Text(
            widget.title ?? "",
            textAlign: TextAlign.center,
            style: GoogleFonts.sora(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2F2D2C),
            ),
          ),
          widget.suffixIcon != null
              ? InkWell(
                  onTap: widget.functionLikeIcon,
                  child: widget.icon ??
                      Icon(
                        widget.suffixIcon ?? Icons.favorite,
                        color: Color.fromARGB(255, 22, 22, 22),
                        size: 24,
                      ),
                )
              : const SizedBox(
                  width: 24,
                ),
        ],
      ),
    );
  }
}
