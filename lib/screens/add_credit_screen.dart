import 'package:flutter/material.dart';
import 'package:ride_mine/widgets/app_bar.dart';
import 'package:ride_mine/widgets/dropdown_field.dart';
import '../widgets/input_field.dart';
import '../widgets/submit_form_button.dart';

class AddCreditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Add 500 MKD to your balance',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Center(
                child: Text(
                  'Credit card details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const InputField(
                label: 'Name on card',
                hintText: 'Meet Patel',
                keyboardType: TextInputType.text,
              ),
              const InputField(
                label: 'Card number',
                hintText: '0000 0000 0000 0000',
                keyboardType: TextInputType.text,
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownField(
                      label: 'Month',
                      hintText: '02',
                      items: List.generate(
                          12, (index) => '${index + 1}'.padLeft(2, '0')),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownField(
                      label: 'Year',
                      hintText: '2025',
                      items: List.generate(
                          10, (index) => '${DateTime.now().year + index}'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const InputField(
                label: 'Card security code',
                hintText: 'Code',
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              SubmitFormButton(
                  buttonText: "Pay",
                  onPressedLogic: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
