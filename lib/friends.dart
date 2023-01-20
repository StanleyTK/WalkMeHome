import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:walkmehome/maps.dart';
import 'package:walkmehome/settings.dart';

class MyFriendsPage extends StatefulWidget {
  const MyFriendsPage({super.key});

  @override
  State<MyFriendsPage> createState() => MyFriendsPageState();
}

class MyFriendsPageState extends State<MyFriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          "This is the Friends Page!!!",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.0,
          ),
        ),
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Color.fromARGB(255, 43, 41, 41),
        padding: EdgeInsets.all(16),
        gap: 8,
        tabs: [
          // ignore: prefer_const_constructors
          GButton(
              icon: Icons.map,
              text: 'Maps',
              onPressed: () {
                navigateToMaps(context);
              }),

          // ignore: prefer_const_constructors
          GButton(
            icon: Icons.group,
            text: 'Friends',
          ),
          GButton(
              icon: Icons.settings,
              text: 'Settings',
              onPressed: () {
                navigateToSettings(context);
              }),
        ],
      ),
    );
  }

  navigateToSettings(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MySettingsPage()));
  }

  navigateToMaps(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MyMapsPage()));
  }
}
