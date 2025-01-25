import 'package:flutter/material.dart';
import 'package:ride_mine/widgets/application_title.dart';
import 'package:ride_mine/widgets/input_field.dart';
import 'package:ride_mine/widgets/submit_form_button.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 241, 236, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ApplicationTitle(),
              const SizedBox(height: 20),
              const InputField(
                label: 'Email',
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
              ),
              const InputField(
                label: 'Password',
                hintText: 'Enter your password',
                obscureText: true,
              ),
              const InputField(
                label: 'Repeat password',
                hintText: 'Enter your password',
                obscureText: true,
              ),
              SubmitFormButton(buttonText: "Register", onPressedLogic: () {}),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                    child: const Text(
                      'Already have an account? Sign in instead',
                      style: TextStyle(decoration: TextDecoration.underline,color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}