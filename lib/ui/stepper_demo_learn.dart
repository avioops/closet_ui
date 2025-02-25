import 'package:closet_ui/common_widget/custom_stepper_learn.dart';
import 'package:closet_ui/ui/check_out_page1.dart';
import 'package:closet_ui/ui/check_out_page2.dart';
import 'package:closet_ui/ui/dialog_screen.dart';
import 'package:flutter/material.dart';

class StepperDemoLearn extends StatelessWidget {
  const StepperDemoLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentStep = 1;
  // Function to move to the next step
  void _onNextStep() {
    if (_currentStep < 2) {
      // Only go to the next step if we're not at the last step
      setState(() {
        _currentStep++; // Increment the step
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
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
            title: Text("Delivery"),
            content: CheckoutPage(onNext: _onNextStep),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: Text("Address"),
            content: CheckOutPage2(onNext: _onNextStep),
            isActive: _currentStep >= 1,
            state:
                _currentStep == 1
                    ? StepState.indexed
                    : (_currentStep > 1
                        ? StepState.complete
                        : StepState.indexed),
          ),
          Step(
            title: Text("Payment"),
            content: SizedBox.shrink(),
            isActive: _currentStep >= 2,
            state: _currentStep == 2 ? StepState.indexed : StepState.indexed,
          ),
        ],
        controlsBuilder: (context, details) {
          return SizedBox();
        },
      ),
    );
  }
}
