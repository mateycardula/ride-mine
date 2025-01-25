import 'package:ride_mine/models/ride.dart';

class User {
  final String id;
  final String email;
  final String password;
  final int credit;
  // final List<Ride> rides;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.credit,
    // required this.rides,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      credit: json['credit'] as int,
      // rides: (json['rides'] as List<dynamic>)
      //     .map((rideJson) => Ride.fromJson(rideJson as Map<String, dynamic>))
      //     .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'credit': credit,
      // 'rides': rides.map((ride) => ride.toJson()).toList(),
    };
  }
}