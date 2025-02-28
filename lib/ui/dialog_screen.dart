import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:closet_ui/common_widget/custom_button.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.done, color: Colors.white),
          ),
          Text(
            "Order Successful",
            style: GoogleFonts.robotoCondensed(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            "Your order #987533456789 is successfully placed",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          CustomButton(
            label: "Track my order",
            onpress: () {
              Navigator.of(context).pop();
            },
          ),
          CustomButton(
            label: "Go Back",
            onpress: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
