import 'package:repo_pattern_di/data_source/local/local_data_source.dart';
import 'package:repo_pattern_di/di/di.dart';

void main(){
  initModule();
  print(getIt<LocalDataSource>().getUsers());
}