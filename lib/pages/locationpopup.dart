import 'package:flutter/material.dart';
import 'package:walkmehome/pages/navbar.dart';
import 'package:walkmehome/models/place.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PopPage extends StatefulWidget {
  late Place _place;

  PopPage(Place place, {super.key}) {
    _place = place;
  }

  @override
  State<PopPage> createState() => PopPageState(_place);
}

class PopPageState extends State<PopPage> {
  late Place _place;

  PopPageState(Place place) {
    _place = place;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[400],
      appBar: AppBar(
        title: const Text('D E S T I N A T I O N  I N F O'),
      ),
      body: Padding(
        //Put map here
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 200,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(_place.lat, _place.long),
                    zoom: 18,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(_place.lat, _place.long),
                          builder: (context) => const Icon(Icons.person_pin),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.deepOrange[300],
                      height: 120,
                      width: 2000,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            _place.name,
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.purple[300],
                        height: 120,
                        width: 2000,
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Start Trip',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              /*ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.deepOrange[300],
                        height: 120,
                      ),
                    );
                  }),*/
            ),
          ],
        ),
      ),
    );
  }
}
