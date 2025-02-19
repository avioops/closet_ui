import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  CustomButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.055,
        child: ElevatedButton(
          onPressed: () {
            print("Button Pressed");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFAD16AA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
