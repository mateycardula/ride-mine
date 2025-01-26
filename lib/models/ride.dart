import 'package:ride_mine/models/enums/RideTypeEnum.dart';

class Ride {
  final String id;
  final String name;
  final RideTypeEnum rideTypeEnum;
  final String image;
  final int pricePerKm;
  final int pricePerMin;
  final Duration duration;
  final int battery;
  double lat;
  double lon;
  final String userId;
  bool isTaken;

  Ride(
      {required this.id,
      required this.name,
      required this.rideTypeEnum,
      required this.image,
      required this.pricePerKm,
      required this.pricePerMin,
      required this.duration,
      required this.battery,
      required this.lat,
      required this.lon,
      required this.userId,
      required this.isTaken});

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
        id: json['id'] as String,
        name: json['name'] as String,
        rideTypeEnum: RideTypeEnum.values.firstWhere(
          (e) => e.name == json['rideTypeEnum'],
        ),
        image: json['image'] as String,
        pricePerKm: json['pricePerKm'] as int,
        pricePerMin: json['pricePerMin'] as int,
        duration: Duration(seconds: json['duration'] as int),
        // duration should be in seconds
        battery: json['battery'] as int,
        lat: (json['lat'] as num).toDouble(),
        lon: (json['lon'] as num).toDouble(),
        userId: json['userId'] as String,
        isTaken: json['isTaken'] as bool);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'rideTypeEnum': rideTypeEnum.name,
      'image': image,
      'pricePerKm': pricePerKm,
      'pricePerMin': pricePerMin,
      'duration': duration.inSeconds, // Convert Duration to seconds
      'battery': battery,
      'lat': lat,
      'lon': lon,
      'user': userId,
      'isTaken': isTaken,
    };
  }
}
