import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_mine/screens/add_ride_screen.dart';
import 'package:ride_mine/widgets/application_title.dart';
import '../providers/ride_provider.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/map_floating_buttons.dart';
import '../widgets/ride_map.dart';
import 'add_credit_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rideProvider = Provider.of<RideProvider>(context);
    final availableRides =
    rideProvider.rides.where((ride) => !ride.isTaken).toList();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Stack(
              children: [
                Stack(
                  children: [
                    RideMap(
                      rides: availableRides,
                      onMarkerTap: (ride) {},
                    ),
                    Positioned.fill(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque, // Ensures taps go through to the GestureDetector
                        onTap: () {
                          Navigator.pushNamed(context, '/map');
                        },
                      ),
                    ),
                    MapFloatingButtons(
                      balance: 1200,
                      addCreditFunction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddCreditScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),

              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(239, 241, 236, 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: ApplicationTitle(),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color.fromRGBO(171, 204, 149, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              minimumSize: const Size(double.infinity, 65),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/map');
                            },
                            child: const Text('Take a ride',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color.fromRGBO(171, 204, 149, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              minimumSize: const Size(double.infinity, 65),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddRideScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Rent yours',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Hop on! Explore rides shared by others—your next adventure is just a tap away',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Together, we’re making mobility more accessible, sustainable, and rewarding for everyone.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Lorem ipsum odor amet, consectetur adipiscing elit. Suscipit tincidunt viverra efficitur ac morbi enim id. Potenti ex rutrum litora eu vitae. Dignissim vivamus conubia platea parturient semper quam tristique.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
                    'Lorem ipsum odor amet, consectetur adipiscing elit. Suscipit tincidunt viverra efficitur ac morbi enim id. Potenti ex rutrum litora eu vitae. Dignissim vivamus conubia platea parturient semper quam tristique.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}