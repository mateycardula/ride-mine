import 'package:flutter/material.dart';
import 'package:ride_mine/widgets/bottom_navigation_bar.dart';
import 'package:ride_mine/widgets/ride_card.dart';
import 'add_credit_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.black, fontSize: 38, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromRGBO(239, 241, 236, 1),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 44,
                backgroundColor: Colors.grey[300],
                child: const Icon(
                  Icons.person,
                  size: 44,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bojan Ognenov',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '120 MKD',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddCreditScreen(),
                          ));
                    },
                    child: const Text(
                      '+ Add credit',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'Rides you rent',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const RideCard(
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0SgOz4pRZUfATSCi2pWQNOuPkm-z6KjOfzQ&s',
            title: "City Bike",
            rides: 2,
            distance: 10,
            duration: 25,
            ratePerKm: 10,
            ratePerMin: 3,
            totalEarnings: 175,
          ),
          const SizedBox(height: 16),
          const RideCard(
            imageUrl:
                'https://vader-prod.s3.amazonaws.com/1595440086-priority-600-1595439979.jpg',
            title: "Fast Bike",
            rides: 5,
            distance: 20,
            duration: 60,
            ratePerKm: 8,
            ratePerMin: 2,
            totalEarnings: 300,
          ),
        ],
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
