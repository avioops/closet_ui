import 'dart:developer';

import 'package:closet_ui/common_widget/custom_button.dart';
import 'package:closet_ui/common_widget/custom_dropdown.dart';
import 'package:closet_ui/common_widget/custom_text_form_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutPage2 extends StatelessWidget {
  const CheckOutPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = -1; // No option selected initially
  final dropDownKey = GlobalKey<DropdownSearchState>();

  final List<String> PaymentTitle = [
    "Cash on Delivery",
    "Credit Card",
    "Paypal",
  ];

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.black, backgroundColor: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(PaymentTitle.length, (index) {
                  bool isSelected =
                      selectedIndex == index; // ✅ Moved inside the widget
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // ✅ Corrected setState
                      });
                    },
                    child: buildPaymentCard(
                      title: PaymentTitle[index],

                      location:
                          [
                            "assets/image/CashCoin.png",
                            "assets/image/CreditCard2Front.png",
                            "assets/image/Vector.png",
                          ][index],
                      isSelected: isSelected, // ✅ Pass selected state
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                  hintText: 'Example Name',
                  keyboardType: TextInputType.text,
                  labelText: 'Card Holder Name',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                  hintText: 'XXXXXXXXXXXXXX',
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  labelText: 'Card Number',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFormField(
                        hintText: 'Enter Here',
                        keyboardType: TextInputType.datetime,
                        labelText: 'Month/Year',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFormField(
                        hintText: 'Enter here',
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: false,
                        ),
                        labelText: 'CCV',
                      ),
                    ),
                  ),
                ],
              ),
              CustomDropDownButton(dropDownKey: dropDownKey),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Checkbox(
                      activeColor: Color(0xFF3B63CD),
                      value: isChecked,
                      onChanged: (newValue) {
                        setState(() {
                          log("this is true");
                          isChecked = newValue!;
                        });
                      },
                    ),
                  ),
                  Text(
                    "Save this Card",
                    style: TextStyle(
                      fontFamily: "GoogleFonts.robotoCondensed",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF323232),
                    ),
                  ),
                ],
              ),
              CustomButton(label: 'Make Payment'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPaymentCard({
    required String title,
    required String location,
    required bool isSelected, // ✅ Added parameter
  }) {
    return Container(
      height: 110,
      width: 110,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? const Color(0xFFAD16AA) : const Color(0xFF808080),
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            location,
            height: 32,
            width: 32,
            color: isSelected ? Color(0xFFAD16AA) : Color(0xFF808080),
          ),
          Text(
            title,
            style: GoogleFonts.robotoCondensed(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF323232),
            ),
            textAlign: TextAlign.center, // ✅ Aligns text properly
          ),
        ],
      ),
    );
  }
}
