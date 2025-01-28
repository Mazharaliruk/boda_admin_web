import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final Widget icon;
 final TextEditingController? controller;

 const  InputField({
    super.key,
    this.controller,
    required this.onChanged, // Required callback for onChanged
    required this.onSubmitted,
    required this.icon, required String hintText, // Required callback for onSubmitted
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged, // Call the onChanged callback
      onFieldSubmitted: onSubmitted, // Call the onSubmitted callback
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        hintText: "Type here...",
        hintStyle: GoogleFonts.onest(
          color: const Color(0xff6B6B6F),
          fontSize: 16,
        ),
        suffixIcon: IconButton(
          icon: icon,
          onPressed: () {

            onSubmitted(""); // You may need to adjust this based on your needs
          },
        ),
      ),
    );
  }
}
