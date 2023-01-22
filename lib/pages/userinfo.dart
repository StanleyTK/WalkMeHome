import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:settings_ui/settings_ui.dart';

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
  List<String> _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('lib/data.json');
    final data = await json.decode(response);

    setState(() {
      _items = data;
    });
  }

  String _name = "";

  UserInfoState(String name) {
    _name = name;
  }

  navigateToLogin(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
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
                  value: Text(_items.toString()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.travel_explore),
                  title: const Text('Traveled Places'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.remove),
                  title: const Text('Remove Friends'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.language),
                  title: const Text('Language'),
                  value: const Text('English'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
