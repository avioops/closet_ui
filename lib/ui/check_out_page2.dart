import 'dart:developer';
import 'package:closet_ui/common_widget/custom_button.dart';
import 'package:closet_ui/common_widget/custom_dropdown.dart';
import 'package:closet_ui/common_widget/custom_text_form_field.dart';
import 'package:closet_ui/ui/dialog_screen.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutPage2 extends StatelessWidget {
  final VoidCallback onNext; // Callback for moving to the next step

  CheckOutPage2({super.key, required this.onNext}); // Constructor

  @override
  Widget build(BuildContext context) {
    return CheckOutPage2Screen(onNext: onNext);
  }
}

// ✅ Renamed this class to prevent conflict with `HomeScreen` in StepperDemoLearn
class CheckOutPage2Screen extends StatefulWidget {
  final VoidCallback onNext;

  const CheckOutPage2Screen({super.key, required this.onNext});

  @override
  State<CheckOutPage2Screen> createState() => _CheckOutPage2ScreenState();
}

class _CheckOutPage2ScreenState extends State<CheckOutPage2Screen> {
  int selectedIndex = -1; // No option selected initially
  final dropDownKey = GlobalKey<DropdownSearchState>();
  final List<String> paymentTitles = [
    "Cash on Delivery",
    "Credit Card",
    "Paypal",
  ];
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(paymentTitles.length, (index) {
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: buildPaymentCard(
                        title: paymentTitles[index],
                        location:
                            [
                              "assets/image/CashCoin.png",
                              "assets/image/CreditCard2Front.png",
                              "assets/image/Vector.png",
                            ][index],
                        isSelected: isSelected,
                      ),
                    ),
                  );
                }),
              ),
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
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: false,
                ),
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
                      hintText: 'MM/YY',
                      keyboardType: TextInputType.datetime,
                      labelText: 'Expiry Date',
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFormField(
                      hintText: 'CVV',
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: false,
                      ),
                      labelText: 'CVV',
                    ),
                  ),
                ),
              ],
            ),
            CustomDropDownButton(dropDownKey: dropDownKey),
            Row(
              children: [
                Checkbox(
                  activeColor: const Color(0xFF3B63CD),
                  value: isChecked,
                  onChanged: (newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                ),
                const Text(
                  "Save this Card",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF323232),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: CustomButton(label: 'Go Back', onpress: () {})),
                Expanded(
                  child: CustomButton(
                    label: 'Make Payment',
                    onpress: () {
                      widget
                          .onNext(); // ✅ Call the callback to move to the next step
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentCard({
    required String title,
    required String location,
    required bool isSelected,
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
        children: [
          Image.asset(
            location,
            height: 32,
            width: 32,
            color:
                isSelected ? const Color(0xFFAD16AA) : const Color(0xFF808080),
          ),
          Text(
            title,
            style: GoogleFonts.robotoCondensed(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF323232),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
