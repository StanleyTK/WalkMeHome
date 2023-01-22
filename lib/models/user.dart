import 'package:walkmehome/models/route.dart';

class User {
  late String _name;
  late String _username;
  late String _email;
  List<Route> _routes = [];
  Route? _currentRoute;

  User(var name, var username, var email, var routes, var currentRoute) {
    _name = name;
    _username = username;
    _email = email;
    _routes = routes;
    _currentRoute = currentRoute;
  }
}
