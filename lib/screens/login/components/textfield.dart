import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final String labelText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
       validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Empty email';
                    }
                    return null;
       },
                         autofocus: false,

      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 213, 173, 147)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey[500],
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[500],
        ),
      ),

      
    );
  }
}
