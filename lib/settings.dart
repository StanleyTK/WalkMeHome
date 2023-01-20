import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:walkmehome/settings.dart';

import 'friends.dart';
import 'maps.dart';

class MySettingsPage extends StatefulWidget {
  const MySettingsPage({super.key});

  @override
  State<MySettingsPage> createState() => MySettingsPageState();
}

class MySettingsPageState extends State<MySettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          "This is the Settings Page!!!",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.0,
          ),
        ),
      ),
      bottomNavigationBar: GNav(
        selectedIndex: 2,
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
            onPressed: () {
              navigateToFriends(context);
            },
          ),
          // ignore: prefer_const_constructors
          GButton(
            icon: Icons.settings,
            text: 'Settings',
          ),
        ],
      ),
    );
  }

  navigateToFriends(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MyFriendsPage()));
  }

  navigateToMaps(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MyMapsPage()));
  }
}
