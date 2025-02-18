import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? textController;
  final TextInputType keyboardType;
  final String labelText;

  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.textController,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.robotoCondensed(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF323232),
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          keyboardType: keyboardType,
          controller: textController,
          decoration: InputDecoration(
            isDense: true,
            fillColor: Color(0xFFE8E8E8),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(width: 1, color: Color(0xFFAD16AA)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(width: 1, color: Color(0xFFE9E9E9)),
            ),

            hintText: hintText,
            hintStyle: GoogleFonts.robotoCondensed(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
        ),
      ],
    );
  }
}
