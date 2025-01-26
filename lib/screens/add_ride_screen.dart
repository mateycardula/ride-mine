import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/bullet_list.dart';
import '../widgets/dropdown_field.dart';
import '../widgets/input_field.dart';
import '../widgets/submit_form_button.dart';

class AddRideScreen extends StatefulWidget {
  @override
  _AddRideScreenState createState() => _AddRideScreenState();
}

class _AddRideScreenState extends State<AddRideScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Turn your ride into passive income—share, earn, and help make the world greener!',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              BulletList(const [
                'As a renter, you’ll keep 100% of the earnings from every kilometer and minute your ride is rented—it’s your full income!',
                'The unlock fee goes to us, helping us keep the platform running smoothly. '
              ]),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'We need some data',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const InputField(
                label: 'Ride name',
                hintText: 'Name your ride',
                keyboardType: TextInputType.text,
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownField(
                      label: 'Ride type',
                      hintText: '02',
                      items: List.generate(
                          12, (index) => '${index + 1}'.padLeft(2, '0')),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: DropdownField(
                      label: 'Rental period',
                      hintText: '02',
                      items: List.generate(
                          12, (index) => '${index + 1}'.padLeft(2, '0')),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const InputField(
                label: 'Price per minute',
                hintText: 'Choose your price',
                keyboardType: TextInputType.number,
              ),
              const InputField(
                label: 'Price per kilometer',
                hintText: 'Choose your price',
                keyboardType: TextInputType.number,
              ),
              const InputField(
                label: 'Image of the ride',
                hintText: 'Upload an image',
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked,
                    activeColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text(
                      'I agree to the terms and conditions',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SubmitFormButton(
                buttonText: "Submit",
                onPressedLogic: () {
                  _isChecked ? Navigator.pop(context) : null;
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
