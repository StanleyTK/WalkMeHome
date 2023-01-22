import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:walkmehome/DAOs/userDAO.dart';
import 'package:walkmehome/models/user.dart';

// ignore: must_be_immutable
class userInfo extends StatefulWidget {
  String _name = "";

  userInfo(String name, {super.key}) {
    _name = name;
  }
  @override
  // ignore: no_logic_in_create_state
  State<userInfo> createState() => UserInfoState(_name);
}

class UserInfoState extends State<userInfo> {
  String _name = "";
  String username = "";
  String email = "";
  User? user;

  UserInfoState(String name) {
    _name = name;
    for (User user in UserDAO.friends) {
      if (name == user.name) {
        username = user.username;
        email = user.email;
        user = user;
      }
    }
  }

  navigateToLogin(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("$_name's Information"),
          backgroundColor: Colors.grey[700],
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              title: const Text('User Profile'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.person),
                  title: Text(_name),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.person),
                  title: Text(username),
                  value: Text(email),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.travel_explore),
                  title: const Text('Traveled Places'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.remove),
                  title: const Text('Remove Friend'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TileBuilder {
  static List<SettingsTile> build(User user) {
    List<SettingsTile> tiles = [
      SettingsTile.navigation(
        leading: const Icon(Icons.person),
        title: Text(user.name),
      ),
      SettingsTile.navigation(
        leading: const Icon(Icons.person),
        title: Text(user.username),
        value: Text(user.email),
      ),
      SettingsTile.navigation(
        leading: const Icon(Icons.travel_explore),
        title: const Text('Traveled Places'),
      ),
    ];

    if (user.currentPath != null) {
      tiles.add(SettingsTile.navigation(
        leading: const Icon(Icons.directions),
        title: const Text('Currently Traveling'),
        value: const Text('Click to view route'),
      ));
    }

    tiles.add(SettingsTile.navigation(
      leading: const Icon(Icons.remove),
      title: const Text('Remove Friend'),
    ));

    return tiles;
  }
}
