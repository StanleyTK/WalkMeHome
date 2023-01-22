import 'package:flutter/src/widgets/framework.dart';
import 'package:walkmehome/models/path_points.dart';

class User {
  late String _name;
  late String _username;
  late String _email;
  List<PathPoints> _paths = [];
  PathPoints? _currentRoute;

  User(var name, var username, var email, var routes, var currentRoute) {
    _name = name;
    _username = username;
    _email = email;
    _paths = routes;
    _currentRoute = currentRoute;
  }

  String get name => _name;
  String get username => _username;
  String get email => _email;
}
