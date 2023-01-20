import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:walkmehome/settings.dart';

import 'friends.dart';

class MyMapsPage extends StatefulWidget {
  const MyMapsPage({super.key});

  @override
  State<MyMapsPage> createState() => MyMapsPageState();
}

class MyMapsPageState extends State<MyMapsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          "This is the Maps Page!!!",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.0,
          ),
        ),
      ),
      bottomNavigationBar: GNav(
        selectedIndex: 0,
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
          ),

          // ignore: prefer_const_constructors
          GButton(
            icon: Icons.group,
            text: 'Friends',
            onPressed: () {
              navigateToFriends(context);
            },
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

  navigateToFriends(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MyFriendsPage()));
  }
}
