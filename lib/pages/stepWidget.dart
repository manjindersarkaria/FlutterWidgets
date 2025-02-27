import 'package:flutter/material.dart';

class StepWidget extends StatefulWidget {
  const StepWidget({super.key});

  @override
  State<StepWidget> createState() => _StepWidgetState();
}

class _StepWidgetState extends State<StepWidget> {
  int _currentStep = 0; // Keep track of the current step
  bool isCompleted = false; // check completeness of inputs
  final formKey =
      GlobalKey<FormState>(); // form object to be used for form validation
  final _emailController = TextEditingController(); // Declare _emailController
  final passwordController = TextEditingController();
  final _streetController = TextEditingController();
  final cityController = TextEditingController();

  bool isDetailComplete() {
    if (_currentStep == 0) {
      if (_emailController.text.isEmpty || passwordController.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else if (_currentStep == 1) {
      if (_streetController.text.isEmpty || cityController.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }

  @override
  void initState() {
    super.initState();

    // Add listeners to all text controllers
    _emailController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
    _streetController.addListener(_updateButtonState);
    cityController.addListener(_updateButtonState);
  }

// Method to force UI update when text changes
  void _updateButtonState() {
    setState(() {
      // This empty setState will trigger a rebuild with the current field values
    });
  }

  @override
  void dispose() {
    // Remove listeners before disposing controllers
    _emailController.removeListener(_updateButtonState);
    passwordController.removeListener(_updateButtonState);
    _streetController.removeListener(_updateButtonState);
    cityController.removeListener(_updateButtonState);

    // Then dispose the controllers
    _emailController.dispose();
    passwordController.dispose();
    _streetController.dispose();
    cityController.dispose();

    super.dispose();
  }

  List<Step> stepList() => [
        Step(
          title: const Text('Account'),
          isActive: _currentStep >= 0,
          state: _currentStep <= 0 ? StepState.editing : StepState.complete,
          content: Column(
            children: [
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Email'),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
              )
            ],
          ),
        ),
        Step(
          isActive: _currentStep >= 1,
          state: _currentStep <= 1 ? StepState.editing : StepState.complete,
          title: Text('Address'),
          content: Column(
            children: [
              TextFormField(
                controller: _streetController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Street Name'),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: cityController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'City'),
              )
            ],
          ),
        ),
        Step(
          isActive: _currentStep >= 2,
          state: StepState.complete,
          title: Text('Confirm'),
          content: Center(child: Text('Confirm')),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Stepper(
          type: StepperType.horizontal,
          elevation: 0,
          currentStep: _currentStep,
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  FilledButton(
                    onPressed: (_currentStep == 0 &&
                                (_emailController.text.isEmpty ||
                                    passwordController.text.isEmpty)) ||
                            (_currentStep == 1 &&
                                (_streetController.text.isEmpty ||
                                    cityController.text.isEmpty))
                        ? null // This will disable the button
                        : details.onStepContinue,
                    style: FilledButton.styleFrom(
                      disabledBackgroundColor: Colors.grey.shade300,
                      disabledForegroundColor: Colors.grey.shade600,
                      // The button will automatically use the disabled styling when onPressed is null
                      // No additional style needed for disabled state - Flutter handles this
                    ),
                    child: const Text('Next'),
                  ),
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: Text('Exit'), // Changed to 'Exit' for consistency
                  ),
                ],
              ),
            );
          },
          onStepTapped: (step) {
            if (formKey.currentState != null &&
                formKey.currentState!.validate()) {
              // Check for null
              setState(() {
                _currentStep = step;
              });
            }
          },
          onStepContinue: () {
            if (formKey.currentState != null && isDetailComplete()) {
              final isLastStep = _currentStep == stepList().length - 1;
              if (isLastStep) {
                setState(() {
                  isCompleted = true;
                });
              } else {
                setState(() {
                  _currentStep++;
                });
              }
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep--; // Simplified decrement
              });
            }
          },
          steps: stepList(),
        ));
  }
}
