import '../../model/user.dart';

class RemoteDataSource{
  List<User> lstUser = [User(id : 1, name : 'Remote Bhai' , age : 30),
  User(id : 1, name : 'Remote Don' , age : 30),
  User(id : 1, name : 'Remote Chota Don' , age : 30)];


  bool addUser(User user){
    lstUser.add(user);
    return true;
  }

  List<User> getUsers(){
    return lstUser;
  }
}