// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:walkmehome/pages/maps.dart';
import 'package:walkmehome/pages/settings.dart';

import 'pages/friends.dart';

class MyNavBarPage extends StatefulWidget {
  const MyNavBarPage({super.key});

  @override
  State<MyNavBarPage> createState() => MyNavBarPageState();
}

class MyNavBarPageState extends State<MyNavBarPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    FriendsPage(),
    MapsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: GNav(
        selectedIndex: _selectedIndex,
        onTabChange: _navigateBottomBar,
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Color.fromARGB(255, 43, 41, 41),
        padding: EdgeInsets.all(16),
        gap: 8,
        tabs: [
          GButton(
            icon: Icons.map,
            text: 'Maps',
          ),
          GButton(
            icon: Icons.group,
            text: 'Friends',
          ),
          GButton(
            icon: Icons.settings,
            text: 'Settings',
          )
        ],
      ),
    );
  }

  // navigateToSettings(BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => const MySettingsPage()));
  // }

  // navigateToFriends(BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => const MyFriendsPage()));
  // }
}
