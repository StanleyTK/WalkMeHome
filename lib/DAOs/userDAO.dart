import 'package:walkmehome/models/user.dart';
import 'package:walkmehome/models/path_points.dart';

class UserDAO {
  static User user = User('Stanley', 'stanleykim2003',
      'stanleykim2003@gmail.com', <PathPoints>[], null);

  static List<User> friends = [
    User('Stanley', 'stanleykim2003', 'stanleykim2003@gmail.com',
        <PathPoints>[], null),
    User('Ariq', 'LukaMagic66', 'LukaMagic66@yahoo.com', <PathPoints>[], null),
    User('Joshua Adith George', 'd2thefraud77', 'd2thefraud77@outlook.com',
        <PathPoints>[], null),
    User('Daniyal', 'daniyalbek', 'adgasdasdfvcx@gmail.com', <PathPoints>[],
        null),
    User('Daniel', 'LeagueGrinder', 'LeagueGrinder@gmail.com', <PathPoints>[],
        null),
  ];
}

class UserTileBuilder {}
