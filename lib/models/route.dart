import 'package:latlong2/latlong.dart';

class Route {
  final List<LatLng> _path = [];

  Route(List locs) {
    for (var pair in locs) {
      _path.add(LatLng(pair[0], pair[1]));
    }
  }

  List<LatLng> path() {
    return _path;
  }

  LatLng head() {
    return _path[_path.length - 1];
  }
}
