import 'package:flutter/cupertino.dart';
import 'package:ride_mine/models/enums/RideTypeEnum.dart';
import 'package:ride_mine/models/ride.dart';

class RideProvider with ChangeNotifier {
  List<Ride> _rides = [
    Ride(
        id: "1",
        name: "City Bike",
        rideTypeEnum: RideTypeEnum.BIKE,
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0SgOz4pRZUfATSCi2pWQNOuPkm-z6KjOfzQ&s",
        pricePerKm: 10,
        pricePerMin: 3,
        duration: Duration(minutes: 3, seconds: 15),
        battery: 52,
        lat: 42.0016,
        lon: 21.4135,
        userId: "1",
        isTaken: false),
    Ride(
        id: "2",
        name: "Fast Bike",
        rideTypeEnum: RideTypeEnum.BIKE,
        image:
            "https://vader-prod.s3.amazonaws.com/1595440086-priority-600-1595439979.jpg",
        pricePerKm: 15,
        pricePerMin: 5,
        duration: Duration(seconds: 58),
        battery: 100,
        lat: 42.0016,
        lon: 21.4145,
        userId: "1",
        isTaken: false),
  ];

  Ride getRideById(String rideId) {
    return _rides.firstWhere((ride) => ride.id == rideId);
  }

  List<Ride> get rides => _rides;
}
