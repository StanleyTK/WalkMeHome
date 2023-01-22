// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:walkmehome/pages/userinfo.dart';
import 'package:walkmehome/models/place.dart';
import 'package:walkmehome/pages/locationpopup.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => MapsPageState();
}

class MapsPageState extends State<MapsPage> {
  final MapController _controller = MapController();

  var path = [
    [40.4254697, -86.9249292],
    [40.4254387, -86.9248339],
    [40.4253825, -86.9247156],
    [40.4253507, -86.9247116],
    [40.4253284, -86.9246948],
    [40.4253299, -86.9246751],
    [40.4253299, -86.924634],
    [40.42533, -86.9246032],
    [40.42533, -86.9245752],
    [40.42533, -86.9245448],
    [40.42533, -86.9245118],
    [40.42533, -86.9244919],
    [40.42533, -86.9244621],
    [40.42533, -86.9244239],
    [40.42533, -86.9244012],
    [40.4253287, -86.9243704],
    [40.4253299, -86.924329],
    [40.42533, -86.9242976],
    [40.42533, -86.924268],
    [40.42533, -86.9242363],
    [40.42533, -86.9242199],
    [40.42533, -86.9241876],
    [40.42533, -86.9241565],
    [40.4253332, -86.9241174],
    [40.4253562, -86.9241199],
    [40.4253897, -86.9241199],
    [40.4254076, -86.92412],
    [40.4254397, -86.9241199],
    [40.4254648, -86.92412],
    [40.4254813, -86.92412],
    [40.4255051, -86.92412],
    [40.4255318, -86.92412],
    [40.4255613, -86.92412],
    [40.4255788, -86.92412],
    [40.4256125, -86.92412],
    [40.425637, -86.92412],
    [40.4256511, -86.92412],
    [40.4256858, -86.92412],
    [40.42571, -86.92412],
    [40.4257258, -86.92412],
    [40.4257596, -86.92412],
    [40.425776, -86.92412],
    [40.4258017, -86.9241047],
    [40.4258001, -86.9240808],
    [40.4258, -86.9240519],
    [40.4258, -86.9240201],
    [40.4258, -86.9239741],
    [40.4258, -86.9239531],
    [40.4257997, -86.9239073],
    [40.4258, -86.9238776],
    [40.4258, -86.9238565],
    [40.4258, -86.9238159],
    [40.4257996, -86.9237819],
    [40.4258, -86.92376],
    [40.4258, -86.9237193],
    [40.4258, -86.9236867],
    [40.4258, -86.9236633],
    [40.4258, -86.9236337],
    [40.4258, -86.9235907],
    [40.4258, -86.9235569],
    [40.4258, -86.9235239],
    [40.4258, -86.923494],
    [40.4258, -86.9234602],
    [40.4257996, -86.9234263],
    [40.4258, -86.923408],
    [40.4258, -86.9233628],
    [40.4258, -86.9233433],
    [40.4258, -86.9233105],
    [40.4258, -86.9232782],
    [40.4258, -86.9232471],
    [40.4257985, -86.9232126],
    [40.4258001, -86.9231749],
    [40.4258003, -86.9231424],
    [40.4258016, -86.923112],
    [40.425802, -86.9230676],
    [40.4258034, -86.9230447],
    [40.4258048, -86.9230024],
    [40.4258053, -86.9229701],
    [40.4258065, -86.9229384],
    [40.425807, -86.9229086],
    [40.425807, -86.9228845],
    [40.4258085, -86.9228537],
    [40.4258204, -86.9228158],
    [40.4258434, -86.9227868],
    [40.4258612, -86.9227648],
    [40.4258833, -86.9227339],
    [40.4259008, -86.9227128],
    [40.425912, -86.9226977],
    [40.425936, -86.9226669],
    [40.425957, -86.9226607],
    [40.4259701, -86.9226899],
    [40.4259904, -86.9227182],
    [40.4260132, -86.9227302],
    [40.4260353, -86.9227422],
    [40.4260719, -86.9227505],
    [40.4260976, -86.92275],
    [40.4261222, -86.9227517],
    [40.4261389, -86.9227537],
    [40.4261724, -86.9227572],
    [40.4261907, -86.9227447],
    [40.4261871, -86.9227112],
    [40.4261853, -86.9226784],
    [40.4261836, -86.9226458],
    [40.426182, -86.922615],
    [40.4261803, -86.9225851],
    [40.4261797, -86.9225511],
    [40.4261782, -86.9225184],
    [40.4261766, -86.9224866],
    [40.4261749, -86.922455],
    [40.4261734, -86.922435],
    [40.4261716, -86.92239],
    [40.4261714, -86.9223698],
    [40.4261718, -86.9223205],
    [40.426174, -86.9223014],
    [40.4261784, -86.9222603],
    [40.4261807, -86.9222374],
    [40.4261854, -86.9222072],
    [40.42619, -86.9221653],
    [40.4261934, -86.922133],
    [40.4261967, -86.9221018],
    [40.4262017, -86.9220697],
    [40.4262038, -86.92205],
    [40.4262082, -86.9220088],
    [40.4262126, -86.921977],
    [40.4262155, -86.9219543],
    [40.4262217, -86.921904],
    [40.4262252, -86.9218715],
    [40.4262286, -86.9218389],
    [40.4262334, -86.9218079],
    [40.4262371, -86.9217747],
    [40.4262415, -86.9217432],
    [40.426247, -86.9217122],
    [40.4262765, -86.9216979],
    [40.4262943, -86.9216998],
    [40.4263287, -86.9217],
    [40.426358, -86.9216912],
    [40.4263844, -86.9216794],
    [40.4264105, -86.92168],
    [40.4264465, -86.92168],
    [40.4264753, -86.9216751],
    [40.4265031, -86.9216701],
    [40.426535, -86.9216655],
    [40.4265632, -86.9216616],
    [40.4265924, -86.9216556],
    [40.4266093, -86.9216506],
    [40.4266345, -86.9216441],
    [40.4266732, -86.921629],
    [40.4266924, -86.9216192],
    [40.4267157, -86.921609],
    [40.4267421, -86.9215966],
    [40.4267805, -86.9216055],
    [40.4268048, -86.9216227],
    [40.426835, -86.9216373],
    [40.4268635, -86.921655],
    [40.4268936, -86.921668],
    [40.4269162, -86.92167],
    [40.4269449, -86.92167],
    [40.4269706, -86.92167],
    [40.4270153, -86.92167],
    [40.4270207, -86.9216501],
    [40.4270219, -86.921615],
    [40.427022, -86.9215838],
    [40.4270235, -86.9215408],
    [40.4270252, -86.9215074],
    [40.4270268, -86.9214762],
    [40.4270282, -86.9214402],
    [40.4270286, -86.9214113],
    [40.42703, -86.9213783],
    [40.4270411, -86.92135],
    [40.4270556, -86.9213282],
    [40.4270671, -86.9213124],
    [40.4270856, -86.9212886],
    [40.4271095, -86.9212569],
    [40.4271253, -86.9212365],
    [40.4271433, -86.9212119],
    [40.4271607, -86.9211889],
    [40.4271784, -86.9211666],
    [40.4271961, -86.9211422],
    [40.4272131, -86.9211211],
    [40.4272343, -86.9210955],
    [40.4272529, -86.921077],
    [40.4272852, -86.9210571],
    [40.4273129, -86.9210386],
    [40.4273311, -86.9210121],
    [40.4273301, -86.92098],
    [40.4273285, -86.9209597],
    [40.4273288, -86.920916],
    [40.4273297, -86.9208857],
    [40.42733, -86.9208492],
    [40.42733, -86.9208296],
    [40.4273289, -86.9207843],
    [40.4273283, -86.9207501],
    [40.4273282, -86.9207183],
    [40.4273268, -86.9206864],
    [40.4273266, -86.9206666],
    [40.4273266, -86.9206318],
    [40.427325, -86.9205889],
    [40.4273249, -86.9205588],
    [40.4273249, -86.9205366],
    [40.4273233, -86.9204925],
    [40.4273232, -86.9204691],
    [40.4273218, -86.9204273],
    [40.4273216, -86.9204065],
  ];

  LatLng _userLocation = LatLng(40.4285, -86.9220); // CoRec: 40.4285, -86.9220
  bool locationInit = false;

  List<LatLng> route = [];
  bool routeInit = false;

  List<LatLng> convertPLLtoLL(List<PointLatLng> pll) {
    List<LatLng> result = [];
    for (PointLatLng point in pll) {
      result.add(LatLng(point.latitude, point.longitude));
    }
    return result;
  }

  Future<void> initLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.onLocationChanged.listen((LocationData currentLocation) {
      // Use current location
      _userLocation =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);

      if (!locationInit) {
        setState(() {
          _controller.move(_userLocation, 16);
          locationInit = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    initLocation();

    for (var pair in path) {
      route.add(LatLng(pair[0], pair[1]));
    }
    routeInit = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "WalkMeHome",
          ),
          actions: [
            IconButton(
              onPressed: () {
                // method to show the search bar
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: FlutterMap(
          mapController: _controller,
          options: MapOptions(
            onMapReady: () {
              setState(() {
                _controller.move(_userLocation, 16);
              });
            },
            center: _userLocation,
            zoom: 16.5,
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
                  points: route,
                  strokeWidth: 6,
                  color: Colors.green,
                ),
              ],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(40.4273216, -86.9204065),
                  builder: (context) => Icon(Icons.person_pin),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<Place> searchTerms = [
    Place("Wiley Dining Court", 40.4285, -86.9208),
    Place("Wilmeth Active Learning Center", 40.4274, -86.9132),
    Place("Lawson Computer Science Building", 40.4276, -86.9169),
  ];

  // ignore: non_constant_identifier_names
  placeInfo(BuildContext context, Place place) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PopPage(place)));
  }

  // Demo list to show querying

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<Place> matchQuery = [];
    for (var item in searchTerms) {
      if (item.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];

        return ListTile(
          title: Text(result.name),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Place> matchQuery = [];
    for (var item in searchTerms) {
      if (item.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result.name),
          onTap: () => placeInfo(context, result),
        );
      },
    );
  }
}
