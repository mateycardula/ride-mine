import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_mine/models/ride.dart';
import 'package:ride_mine/providers/ride_provider.dart';
import 'package:ride_mine/screens/add_credit_screen.dart';
import 'package:ride_mine/widgets/bottom_navigation_bar.dart';
import 'package:ride_mine/widgets/map_floating_buttons.dart';
import 'package:ride_mine/widgets/ride_details_card.dart';
import 'package:ride_mine/widgets/ride_map.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rideProvider = Provider.of<RideProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          RideMap(
              rides: rideProvider.rides,
              onMarkerTap: (ride) {
                _showRideDetails(context, ride);
              }),
          MapFloatingButtons(
              balance: 1200,
              addCreditFunction: () {
                Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => AddCreditScreen(),
                ));
              }),
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
        return RideDetailsCard(ride: ride);
      },
    );
  }
}
