import '../../model/user.dart';

class LocalDataSource {
  List<User> lstUser = [];

  bool addUser(User user) {
    lstUser.add(user);
    return true;
  }

  List<User> getUsers() {
    return lstUser;
  }
}
