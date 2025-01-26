import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar myAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: const Text(
      'Ride Mine',
      style: TextStyle(
          color: Colors.black, fontSize: 38, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    backgroundColor: const Color.fromRGBO(239, 241, 236, 1),
    elevation: 20,
    toolbarHeight: 44,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(239, 241, 236, 1),
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ),
  );
}
