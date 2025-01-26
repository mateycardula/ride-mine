import 'package:flutter/material.dart';

class EndRideButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressedLogic;
  final double round;

  const EndRideButton(
      {super.key,
        required this.buttonText,
        required this.onPressedLogic,
        this.round = 8});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressedLogic,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(round),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
