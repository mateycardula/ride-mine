import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:ride_mine/models/ride.dart';
import 'package:ride_mine/providers/ride_provider.dart';
import 'package:ride_mine/widgets/bottom_navigation_bar.dart';
import 'package:ride_mine/widgets/map_floating_buttons.dart';
import 'package:ride_mine/widgets/ride_details_card.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rideProvider = Provider.of<RideProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: MapController(),
            options: MapOptions(
              initialCenter: LatLng(42.0018, 21.4097),
              initialZoom: 15.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: rideProvider.rides.map((ride) {
                  return Marker(
                    point: LatLng(ride.lat, ride.lon),
                    width: 40,
                    height: 40,
                    child: GestureDetector(
                      onTap: () {
                        _showRideDetails(context, ride);
                      },
                      child: const Icon(
                        Icons.directions_bike,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
          MapFloatingButtons(balance: 1200, addCreditFunction: () {}),
        ],
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }

  void _showRideDetails(BuildContext context, Ride ride) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the modal to expand fully
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return RideDetailsCard(ride: ride);
      },
    );
  }
}
