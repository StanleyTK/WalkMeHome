import 'package:walkmehome/models/user.dart';

class UserDAO {
  User user =
      User('Stanley', 'stanleykim2003', 'stanleykim2003@gmail.com', [], Null);

  List<User> friends = [
    User('Ariq', 'LukaMagic66', 'LukaMagic66@yahoo.com', [], Null),
    User('Joshua Adith George', 'd2thefraud77', 'd2thefraud77@outlook.com', [],
        Null),
    User('Daniyal', 'adgasdasdfvcx', 'adgasdasdfvcx@gmail.com', [], Null),
    User('Daniel', 'LeagueGrinder', 'LeagueGrinder@gmail.com', [], Null),
  ];
}

class UserTileBuilder {}
