import 'package:flutter/material.dart';
import 'package:ride_mine/models/ride.dart';
import 'package:ride_mine/widgets/submit_form_button.dart';

class RideDetailsCard extends StatelessWidget {
  final Ride ride;

  const RideDetailsCard({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.43,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Text(
                  ride.name,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          ride.image,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "20 MKD - unlock price",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${ride.pricePerKm} MKD / km",
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${ride.pricePerMin} MKD / min",
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Transform.rotate(
                                angle: 90 * 3.1415926535 / 180,
                                child: const Icon(
                                  Icons.battery_4_bar,
                                  color: Colors.black,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "${ride.battery}%",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Text(
                                "Approx. 2h remaining",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SubmitFormButton(
                  buttonText: "Start ride",
                  onPressedLogic: () {
                    ride.isTaken = true;
                    Navigator.pushNamed(
                        context, '/activeRide');
                  },
                  round: 24,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Price is calculated based on your\ntime spent and kilometers traveled",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
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
