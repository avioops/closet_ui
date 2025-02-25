import 'package:flutter/material.dart';

class CustomStepperLearn extends StatefulWidget {
  @override
  _CustomStepperLearnState createState() => _CustomStepperLearnState();
}

class _CustomStepperLearnState extends State<CustomStepperLearn> {
  int _currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Stepper(
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
          content: SizedBox.shrink(),
          isActive: _currentStep >= 0,
          state: _currentStep > 0 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: Text("Address"),
          content: SizedBox.shrink(),
          isActive: _currentStep >= 1,
          state:
              _currentStep == 1
                  ? StepState.editing
                  : (_currentStep > 1 ? StepState.complete : StepState.indexed),
        ),
        Step(
          title: Text("Payment"),
          content: SizedBox.shrink(),
          isActive: _currentStep >= 2,
          state: _currentStep == 2 ? StepState.editing : StepState.indexed,
        ),
      ],
      controlsBuilder: (context, details) {
        return SizedBox();
      },
    );
  }
}
