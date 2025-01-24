import 'package:ride_mine/models/enums/RideTypeEnum.dart';
import 'package:ride_mine/models/user.dart';

class Ride {
  final String id;
  final String name;
  final RideTypeEnum rideTypeEnum;
  final String image;
  final int pricePerKm;
  final int pricePerMin;
  final Duration duration;
  final int battery;
  final User user;

  Ride({
    required this.id,
    required this.name,
    required this.rideTypeEnum,
    required this.image,
    required this.pricePerKm,
    required this.pricePerMin,
    required this.duration,
    required this.battery,
    required this.user,
  });

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
        user: User.fromJson(json['user'] as Map<String, dynamic>));
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
      'user': user.toJson(),
    };
  }
}
