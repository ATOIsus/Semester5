import 'package:flutter/material.dart';

import '../di/di.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';

class DisplayUserView extends StatefulWidget {
  const DisplayUserView({super.key});

  @override
  State<DisplayUserView> createState() => _DisplayUserViewState();
}

class _DisplayUserViewState extends State<DisplayUserView> {
  @override
  Widget build(BuildContext context) {
    List<User> lstUsers = getIt<UserRepository>().getUsers();
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Users"),
        centerTitle: true,
        elevation: 4,
      ),
      body: ListView.builder(
          itemCount: lstUsers.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                color: Colors.blue,
                height: 150,
                width: double.infinity,
                child: Card(
                  child: Center(
                    child: Text(" Id:  ${lstUsers[index].id} \n Name: ${lstUsers[index].name} \n DOB: ${lstUsers[index].date!.day}/${lstUsers[index].date!.month}/${lstUsers[index].date!.year}  \n Time: ${lstUsers[index].time!.hour}:${lstUsers[index].time!.minute}",
                      ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
