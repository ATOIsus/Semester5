import 'package:repo_pattern_di/di/di.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';

void main() {
  initModule();
  User user = User(id: 34, name: "asdaas", age: 3444);
  print(getIt<UserRepository>().addUser(user));
}
