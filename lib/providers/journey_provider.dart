import 'package:flutter/cupertino.dart';
import 'package:ride_mine/models/journey.dart';

class JourneyProvider with ChangeNotifier {
  List<Journey> _journes = [
    Journey(id: "1", rideId: "1", userId: "1", kmTravelled: 2, minTravelled: 8),
  ];

  Journey getJourneyById(String journeyId) {
    return _journes.firstWhere((journey) => journey.id == journeyId);
  }

  List<Journey> get rides => _journes;
}
