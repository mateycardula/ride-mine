import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_mine/models/ride.dart';
import 'package:ride_mine/providers/ride_provider.dart';
import 'package:ride_mine/screens/ride_in_progress_details_screen.dart';
import 'package:ride_mine/widgets/bottom_navigation_bar.dart';
import 'package:ride_mine/widgets/map_floating_buttons.dart';
import 'package:ride_mine/widgets/ride_map.dart';
import 'package:ride_mine/widgets/ride_details_card.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rideProvider = Provider.of<RideProvider>(context);
    final availableRides = rideProvider.rides.where((ride) => !ride.isTaken).toList();
    final activeRide = rideProvider.getActiveRide();

    return Scaffold(
      body: Stack(
        children: [
          RideMap(
            rides: availableRides,
            onMarkerTap: (ride) {
              if (activeRide == null) {
                _showRideDetails(context, ride, rideProvider);
              }
            },
          ),
          MapFloatingButtons(
            balance: 1200,
            addCreditFunction: () {
              Navigator.pushNamed(context, '/addCredit');
            },
          ),
          if (activeRide != null)
            Positioned(
              bottom: 16,
              left: MediaQuery.of(context).size.width * 0.2,
              right: MediaQuery.of(context).size.width * 0.2,
              child: ElevatedButton(
                onPressed: () {
                  _showRideInProgressDetails(context, activeRide, rideProvider);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'RIDE IN PROGRESS',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  void _showRideDetails(BuildContext context, Ride ride, RideProvider rideProvider) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return RideDetailsCard(
          ride: ride,
        );
      },
    );
  }

  void _showRideInProgressDetails(BuildContext context, Ride ride, RideProvider rideProvider) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return RideInProgressDetailsScreen(
          ride: ride,
          onEndRide: () {
            rideProvider.endRide();
            Navigator.pop(context); // Close bottom sheet
          },
        );
      },
    );
  }
}
