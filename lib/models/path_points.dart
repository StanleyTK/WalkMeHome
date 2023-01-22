import 'package:latlong2/latlong.dart';

class PathPoints {
  final List<LatLng> _path = [];

  PathPoints(List locs) {
    for (var pair in locs) {
      _path.add(LatLng(pair[0], pair[1]));
    }
  }

  List<LatLng> path() {
    return _path;
  }

  LatLng tail() {
    return _path[0];
  }

  LatLng head() {
    return _path[_path.length - 1];
  }
}
