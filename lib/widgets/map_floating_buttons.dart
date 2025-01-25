import 'package:flutter/material.dart';

class MapFloatingButtons extends StatelessWidget {
  final int balance;
  final VoidCallback addCreditFunction;

  const MapFloatingButtons(
      {super.key, required this.balance, required this.addCreditFunction});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      right: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Balance: $balance MKD',
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          const SizedBox(height: 6),
          ElevatedButton(
            onPressed: addCreditFunction,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(171, 204, 149, 1),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Add credits +',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
