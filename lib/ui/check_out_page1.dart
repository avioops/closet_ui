// import 'package:closet_ui/common_widget/custom_button.dart';
// import 'package:closet_ui/common_widget/custom_dropdown.dart';
// import 'package:closet_ui/common_widget/custom_text_form_field.dart';
// import 'package:closet_ui/ui/check_out_page2.dart';
// import 'package:flutter/material.dart';
// import 'package:dropdown_search/dropdown_search.dart';

// class CheckoutPage extends StatelessWidget {
//   final VoidCallback onNext; // Callback for moving to next step
//   const CheckoutPage({
//     super.key,
//     required this.onNext, // Constructor accepting the onNext callback
//   });

//   @override
//   Widget build(BuildContext context) {
//     return HomeScreen();
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final dropDownKey = GlobalKey<DropdownSearchState>();
//   bool _isChecked = false;
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextFormField(
//               hintText: 'Example Name',
//               keyboardType: TextInputType.text,
//               labelText: 'Full Name',
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextFormField(
//               hintText: 'infoaddress@gmail.com',
//               keyboardType: TextInputType.emailAddress,
//               labelText: 'Email Address',
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomTextFormField(
//               hintText: 'Enter your phone number',
//               keyboardType: TextInputType.number,
//               labelText: 'Phone',
//             ),
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CustomTextFormField(
//                     hintText: 'Enter here',
//                     keyboardType: TextInputType.streetAddress,
//                     labelText: 'Zip Code',
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CustomTextFormField(
//                     hintText: 'Enter here',
//                     keyboardType: TextInputType.text,
//                     labelText: 'City',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Country",
//               style: TextStyle(
//                 fontFamily: "GoogleFonts.robotoCondensed",
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 color: Color(0xFF323232),
//               ),
//             ),
//           ),
//           CustomDropDownButton(dropDownKey: dropDownKey),
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//                 child: Checkbox(
//                   activeColor: Color(0xFF3B63CD),
//                   value: _isChecked,
//                   onChanged: (bool? newValue) {
//                     setState(() {
//                       _isChecked = newValue ?? false;
//                     });
//                   },
//                 ),
//               ),
//               Text(
//                 "Save Shipping Address",
//                 style: TextStyle(
//                   fontFamily: "GoogleFonts.robotoCondensed",
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Color(0xFF323232),
//                 ),
//               ),
//             ],
//           ),
//           CustomButton(label: 'NEXT', onpress: onNext),
//         ],
//       ),
//     );
//   }
// }

import 'package:closet_ui/common_widget/custom_button.dart';
import 'package:closet_ui/common_widget/custom_dropdown.dart';
import 'package:closet_ui/common_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CheckoutPage extends StatelessWidget {
  final VoidCallback onNext; // Callback for moving to next step

  const CheckoutPage({
    super.key,
    required this.onNext, // Constructor accepting the onNext callback
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
              hintText: 'Example Name',
              keyboardType: TextInputType.text,
              labelText: 'Full Name',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
              hintText: 'infoaddress@gmail.com',
              keyboardType: TextInputType.emailAddress,
              labelText: 'Email Address',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
              hintText: 'Enter your phone number',
              keyboardType: TextInputType.number,
              labelText: 'Phone',
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    hintText: 'Enter here',
                    keyboardType: TextInputType.streetAddress,
                    labelText: 'Zip Code',
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    hintText: 'Enter here',
                    keyboardType: TextInputType.text,
                    labelText: 'City',
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Country",
              style: TextStyle(
                fontFamily: "GoogleFonts.robotoCondensed",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF323232),
              ),
            ),
          ),
          CustomDropDownButton(dropDownKey: GlobalKey<DropdownSearchState>()),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Checkbox(
                  activeColor: Color(0xFF3B63CD),
                  value: false,
                  onChanged: (bool? newValue) {},
                ),
              ),
              Text(
                "Save Shipping Address",
                style: TextStyle(
                  fontFamily: "GoogleFonts.robotoCondensed",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF323232),
                ),
              ),
            ],
          ),
          CustomButton(
            label: 'NEXT',
            onpress: onNext,
          ), // Trigger the onNext callback here
        ],
      ),
    );
  }
}
