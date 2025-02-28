import 'package:closet_ui/ui/check_out_page1.dart';
import 'package:closet_ui/ui/check_out_page2.dart';
import 'package:closet_ui/ui/dialog_screen.dart';
import 'package:flutter/material.dart';

class StepperDemoLearn extends StatefulWidget {
  const StepperDemoLearn({super.key});

  @override
  _StepperDemoLearnState createState() => _StepperDemoLearnState();
}

class _StepperDemoLearnState extends State<StepperDemoLearn> {
  int _currentStep = 0; // Track the current step

  // Function to move to the next step
  void _onNextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++; // Increment the step
      });
    }
  }

  // Function to navigate to the previous step
  void _onPreviousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--; // Decrement the step
      });
    }
  }

  // Show the dialog when on the last step (payment step)
  void _showPaymentDialog() {
    showDialog(
      context: context,
      builder: (context) => const DialogScreen(), // Show the DialogScreen here
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepTapped: (step) {
          setState(() {
            _currentStep = step;
          });
        },
        steps: [
          Step(
            title: const Text("Delivery"),
            content: CheckoutPage(onNext: _onNextStep),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: const Text("Address"),
            content: CheckoutPage(onNext: _onNextStep),
            isActive: _currentStep >= 1,
            state:
                _currentStep == 1
                    ? StepState.indexed
                    : (_currentStep > 1
                        ? StepState.complete
                        : StepState.indexed),
          ),
          Step(
            title: const Text("Payment"),
            content: CheckOutPage2(
              onNext: _onNextStep,
              onPayment: _showPaymentDialog, // Pass the function to show dialog
              onPrevious:
                  _onPreviousStep, // Callback to go back to the previous step
            ),
            isActive: _currentStep >= 2,
            state: _currentStep == 2 ? StepState.indexed : StepState.indexed,
          ),
        ],
        controlsBuilder: (context, details) {
          return const SizedBox(); // Optional: Customize the controls here
        },
      ),
    );
  }
}
