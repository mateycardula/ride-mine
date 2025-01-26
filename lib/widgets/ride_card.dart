import 'package:flutter/material.dart';

class RideCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int rides;
  final int distance;
  final int duration;
  final int ratePerKm;
  final int ratePerMin;
  final int totalEarnings;

  const RideCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rides,
    required this.distance,
    required this.duration,
    required this.ratePerKm,
    required this.ratePerMin,
    required this.totalEarnings,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(239, 241, 236, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('$rides rides | $distance kilometers | $duration minutes'),
            const SizedBox(height: 4),
            Text('$ratePerKm den / km    $ratePerMin den / min'),
            const SizedBox(height: 12),
            Text(
              'Total Earnings: $totalEarnings den.',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
