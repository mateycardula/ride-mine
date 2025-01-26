import 'package:flutter/material.dart';
import 'package:ride_mine/models/ride.dart';

class RideDetailsCard extends StatelessWidget {
  final Ride ride;

  const RideDetailsCard({Key? key, required this.ride}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Text(
                  ride.name ?? "Ride Details",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    ride.image ?? '',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                // Text("Unlock price: ${ride.unlockPrice} MKD"),
                Text("Price per km: ${ride.pricePerKm} MKD"),
                Text("Price per min: ${ride.pricePerMin} MKD"),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.battery_full, color: Colors.green[700]),
                    const SizedBox(width: 8),
                    Text(
                      "Battery: ${ride.battery}%",
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(171, 204, 149, 1),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text("Start ride"),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Price is calculated based on your time spent and kilometers traveled",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
