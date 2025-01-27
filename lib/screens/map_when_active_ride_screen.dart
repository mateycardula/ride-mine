import 'package:flutter/material.dart';
import 'package:ride_mine/screens/ride_in_progress_details_screen.dart';
import '../models/enums/RideTypeEnum.dart';
import '../models/ride.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/map_floating_buttons.dart';
import '../widgets/ride_map.dart';
import 'add_credit_screen.dart';

class MapWhenActiveRideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RideMap(
              rides: [],
              onMarkerTap: (ride) {
                _showRideDetails(context, ride);
              }),
          MapFloatingButtons(
              balance: 1200,
              addCreditFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddCreditScreen(),
                    ));
              }),
          Positioned(
            top: 750,
            right: 120,
            child: ElevatedButton(
              onPressed: () {
                _showRideDetails(
                    context,
                    Ride(
                        id: "1",
                        name: "City Bike",
                        rideTypeEnum: RideTypeEnum.BIKE,
                        image:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0SgOz4pRZUfATSCi2pWQNOuPkm-z6KjOfzQ&s",
                        pricePerKm: 10,
                        pricePerMin: 3,
                        duration: const Duration(minutes: 3, seconds: 15),
                        battery: 52,
                        lat: 42.0027,
                        lon: 21.4135,
                        userId: "1",
                        isTaken: false));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'RIDE IN PROGRESS',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }

  void _showRideDetails(BuildContext context, Ride ride) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return RideInProgressDetailsScreen(ride: ride);
      },
    );
  }
}
