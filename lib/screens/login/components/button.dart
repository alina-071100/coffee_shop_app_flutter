import 'package:coffee_shop_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String? title;
  final Function()? onTap;

   MyButton({super.key, required this.onTap,this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        // margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color:AppTheme.buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child:  Center(
          child: Text(
            title??"",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
