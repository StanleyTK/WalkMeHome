import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:walkmehome/pages/userinfo.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => FriendsPageState();
}

class FriendsPageState extends State<FriendsPage> {
  navigateToLogin(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
    Navigator.of(context, rootNavigator: true).pop();
  }

  UserInfo(BuildContext context, String name) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => userInfo(name)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Friends Search'), actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ]),
        body: SettingsList(
          sections: [
            SettingsSection(
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.person),
                  title: const Text('Stanley'),
                  value: const Text('stanleykim2003'),
                  onPressed: (context) {
                    UserInfo(context, 'Stanley');
                  },
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.person),
                  title: const Text('Ariq'),
                  value: const Text('LukaMagic66'),
                  onPressed: (context) {
                    UserInfo(context, 'Ariq');
                  },
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.person),
                  title: const Text('Joshua Adith George'),
                  value: const Text('d2thefraud77'),
                  onPressed: (context) {
                    UserInfo(context, 'Joshua Adith George');
                  },
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.person),
                  title: const Text('Daniyal'),
                  value: const Text('adgasdasdfvcx'),
                  onPressed: (context) {
                    UserInfo(context, 'Daniyal');
                  },
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.person),
                  title: const Text('Daniel'),
                  value: const Text('LeagueOfLegends'),
                  onPressed: (context) {
                    UserInfo(context, 'Daniel');
                  },
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
  // ignore: non_constant_identifier_names
  UserInfo(BuildContext context, String name) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => userInfo(name)));
  }

  // Demo list to show querying
  List<String> searchTerms = [
    "Daniyal",
    "Stanley",
    "Daniel",
    "Anthony",
    "Josh",
    "Ariq",
    "Drew",
    "Anurag"
  ];

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
    List<String> matchQuery = [];
    for (var item in searchTerms) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];

        return ListTile(
          title: Text(result),
          onTap: () => UserInfo(context, result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchTerms) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () => UserInfo(context, result),
        );
      },
    );
  }
}
