import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Friends Search'), actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // showSearch(
              //   context: context,
              //   delegate: MySearchDelegate(),
              // );
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
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.person),
                  title: const Text('Ariq'),
                  value: const Text('LukaMagic66'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.person),
                  title: const Text('Joshua Adith George'),
                  value: const Text('d2thefraud77'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.person),
                  title: const Text('Daniyal'),
                  value: const Text('adgasdasdfvcx'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.person),
                  title: const Text('Daniel'),
                  value: const Text('LeagueOfLegends'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class MySearchDelegate extends SearchDelegate {
//   List<String> searchResults = [
//       'Daniyal Bekinakar',
//       'Daniel Xu',
//       'Stanley Kim',
//       'Anthony Tan',
//       'Josh Adith',
//       'Owen Terry',
//     ];

//   @override
//   Widget? buildLeading(BuildContext context) => IconButton(
//         icon: const Icon(Icons.arrow_back),
//         onPressed: () => close(context, null), // close searchbar
//       );

//   List<Widget>? buildActions(BuildContext context) => [
//         IconButton(
//           icon: const Icon(Icons.clear),
//           onPressed: () {
//             if (query.isEmpty) {
//               close(context, null);
//             } else {
//               query = '';
//             }
//           },
//         ),
//       ];

//   Widget buildResults(BuildContext context) => Center(
//       body: SettingsList(
//           sections: [
//             SettingsSection(
//               tiles: <SettingsTile>[
//                 SettingsTile.navigation(
//                   leading: const Icon(Icons.person),
//                   title: const Text(query),
//                   value: const Text('stanleykim2003'),
//                 ),
//               ],
//             ),
//           ]
//       ),
//   );

//   Widget buildSuggestions(BuildContext context) {
//     List<String> suggestions = searchResults.where((searchResults)) {
//       final result = searchResult.toLowerCase();
//       final input = query.toLowerCase();

//       return result.contains(input);
//     }.toList();

//     return ListView.builder(
//         itemCount: suggestions.length,
//         itemBuilder: (context, index) {
//           final suggestion = suggestions[index];

//           return ListTile(
//               title: Text(suggestion),
//               onTap: () {
//                 query = suggestion;
//               });
//         }
//     );
//   }
// }