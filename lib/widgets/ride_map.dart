import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:ride_mine/models/ride.dart';

import '../models/enums/RideTypeEnum.dart';

class RideMap extends StatelessWidget {
  final List<Ride> rides;
  final Function(Ride) onMarkerTap;

  const RideMap({super.key, required this.rides, required this.onMarkerTap});

  @override
  Widget build(BuildContext context) {
    final initialCenter = rides.length == 1
        ? LatLng(rides[0].lat, rides[0].lon)
        : LatLng(42.0030, 21.4147);

    return FlutterMap(
      mapController: MapController(),
      options: MapOptions(
        initialCenter: initialCenter,
        initialZoom: 15.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: rides.map((ride) {
            IconData rideIcon = ride.rideTypeEnum == RideTypeEnum.BIKE
                ? Icons.directions_bike
                : Icons.electric_scooter;
            return Marker(
              point: LatLng(ride.lat, ride.lon),
              width: 50,
              height: 50,
              child: GestureDetector(
                onTap: () {
                  onMarkerTap(ride);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    rideIcon,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
