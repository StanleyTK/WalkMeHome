import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  navigateToLogin(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          backgroundColor: Colors.grey[700],
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              title: const Text('Settings'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.person),
                  title: const Text('Account Settings'),
                  value: const Text('stanleykim2003'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.travel_explore),
                  title: const Text('Past Trips'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.language),
                  title: const Text('Language'),
                  value: const Text('English'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.light_mode),
                  title: const Text('Theme'),
                  value: const Text('Light Mode'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.logout),
                  title: const Text('Sign Out'),
                  onPressed: navigateToLogin,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
