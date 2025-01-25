import 'package:flutter/cupertino.dart';
import 'package:ride_mine/models/user.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [
    User(id: "1", email: "bojan.ognenov@gmail.com", password: "pw", credit: 100)
  ];

  User getUserById(String userId) {
    return _users.firstWhere((user) => user.id == userId);
  }

  List<User> get users => _users;
}
