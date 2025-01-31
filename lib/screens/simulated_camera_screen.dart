import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/ride_provider.dart';
import '../models/ride.dart';

class CameraSimulationScreen extends StatelessWidget {
  final Ride ride;

  const CameraSimulationScreen({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    final rideProvider = Provider.of<RideProvider>(context, listen: false);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/camera_placeholder.png'), // Placeholder Image
                fit: BoxFit.cover,
              ),
            ),
          ),

          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 4),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.flash_on, color: Colors.white, size: 28),
                  onPressed: () {},
                ),
                SizedBox(width: 40),
                GestureDetector(
                  onTap: () {
                    rideProvider.startRide(ride);
                    Navigator.pushNamed(context, '/map');
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                  ),
                ),
                SizedBox(width: 40),
                IconButton(
                  icon: Icon(Icons.flip_camera_ios, color: Colors.white, size: 28),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
