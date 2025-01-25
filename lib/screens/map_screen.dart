import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:ride_mine/providers/ride_provider.dart';
import 'package:ride_mine/widgets/bottom_navigation_bar.dart';
import 'package:ride_mine/widgets/map_floating_buttons.dart';

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
              initialCenter: LatLng(42.0018, 21.4047),
              initialZoom: 15.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: rideProvider.rides.map((ride) {
                  return Marker(
                    point: LatLng(ride.lat, ride.lon), // Use ride coordinates
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.directions_bike,
                      color: Colors.blue,
                      size: 30,
                    ),
                    // onTap: () {
                    //   // Show ride details when tapped
                    //   _showRideDetails(context, ride);
                    // },
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
}
