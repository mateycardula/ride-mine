import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_mine/widgets/application_title.dart';
import 'package:ride_mine/widgets/input_field.dart';
import 'package:ride_mine/widgets/submit_form_button.dart';

class SignInScreen extends StatelessWidget {
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
              SubmitFormButton(buttonText: "Sign In", onPressedLogic: () {Navigator.pushNamed(context, '/map');}),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(decoration: TextDecoration.underline,color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      "Don't have an account? Register here",
                      style: TextStyle(decoration: TextDecoration.underline, color: Colors.black),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
