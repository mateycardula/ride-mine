class Journey {
  final String id;
  final String rideId;
  final String userId;
  final double kmTravelled;
  final double minTravelled;

  Journey({
    required this.id,
    required this.rideId,
    required this.userId,
    required this.kmTravelled,
    required this.minTravelled,
  });

  factory Journey.fromJson(Map<String, dynamic> json) {
    return Journey(
      id: json['id'] as String,
      rideId: json['rideId'] as String,
      userId: json['userId'] as String,
      kmTravelled: (json['kmTravelled'] as num).toDouble(),
      minTravelled: (json['minTravelled'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rideId': rideId,
      'userId': userId,
      'kmTravelled': kmTravelled,
      'minTravelled': minTravelled,
    };
  }
}
