import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:walkmehome/models/user.dart';
import 'package:walkmehome/models/path_points.dart';

class PathDetailPage extends StatefulWidget {
  late User _user;
  late PathPoints _pathPoints;

  PathDetailPage(User user, PathPoints pathPoints, {super.key}) {
    _user = user;
    _pathPoints = pathPoints;
  }

  @override
  State<PathDetailPage> createState() =>
      _PathDetailPageState(_user, _pathPoints);
}

class _PathDetailPageState extends State<PathDetailPage> {
  late User _user;
  late PathPoints _pathPoints;

  _PathDetailPageState(User user, PathPoints pathPoints) {
    _user = user;
    _pathPoints = pathPoints;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: FlutterMap(
              options: MapOptions(
                bounds: LatLngBounds(
                  LatLng(51.74920, -0.56741),
                  LatLng(51.25709, 0.34018),
                ),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                PolylineLayer(
                  polylineCulling: false,
                  polylines: [
                    Polyline(
                      points: _pathPoints.path(),
                      strokeWidth: 6,
                      color: Colors.pink,
                    ),
                  ],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _pathPoints.tail(),
                      builder: (context) => const Icon(Icons.person_pin),
                    ),
                    Marker(
                      point: _pathPoints.head(),
                      builder: (context) => const Icon(Icons.person_pin),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
