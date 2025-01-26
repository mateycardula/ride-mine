import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:ride_mine/models/ride.dart';

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
            return Marker(
              point: LatLng(ride.lat, ride.lon),
              width: 40,
              height: 40,
              child: GestureDetector(
                onTap: () {
                  onMarkerTap(ride);
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
    );
  }
}
