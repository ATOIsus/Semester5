import '../../model/user.dart';

class LocalDataSource{
  List<User> lstUser = [User(id : 1, name : 'Local Bhai' , age : 30),
  User(id : 1, name : 'Local Don' , age : 30),
  User(id : 1, name : 'Local Chota Don' , age : 30)];


  bool addUser(User user){
    lstUser.add(user);
    return true;
  }

  List<User> getUsers(){
    return lstUser;
  }
}