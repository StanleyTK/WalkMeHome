import 'package:latlong2/latlong.dart';

class Place {
  late String _name;
  late double _lat;
  late double _long;

  Place(String name, double lat, double long) {
    _name = name;
    _lat = lat;
    _long = long;
  }

  String get name => _name;
  double get lat => _lat;
  double get long => _long;
}
