import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({super.key, required this.dropDownKey});

  final GlobalKey<DropdownSearchState> dropDownKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownSearch<String>(
        key: dropDownKey,
        selectedItem: "Nepal",
        items:
            (filter, infiniteScrollProps) => [
              "Nepal",
              "India",
              "China",
              "Bhutan",
            ],
        decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
            fillColor: Color(0xFFE8E8E8),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(width: 1, color: Color(0xFFAD16AA)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(width: 1, color: Color(0xFFE9E9E9)),
            ),
          ),
        ),
      ),
    );
  }
}
