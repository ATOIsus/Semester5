import 'package:flutter/material.dart';

import '../di/di.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({super.key});

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {

  final gap = const SizedBox(height: 20);
  var name = '';
  var password = '';
  var id = ' ';

  TimeOfDay? time = TimeOfDay.now();
  DateTime? date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add User'),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 8),
                   TextField(
                  onChanged: (text) {
                    id = text;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Id',
                  ),
                ),
                gap,
                TextField(
                  onChanged: (text) {
                    name = text;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),
                ),
                gap,
                TextField(
                  onChanged: (text) {
                    password = text;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                gap,
                Row(
                  children: [
                    const Text('Choose Date :    '),
                    ElevatedButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date!,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now(),
                        );
                        if (newDate != null) {
                          setState(() {
                            date = newDate;
                          });
                        }
                      },
                      child: Text('${date!.day}/${date!.month}/${date!.year}'),
                    ),
                  ],
                ),
                gap,
                Row(
                  children: [
                    const Text('Choose Time :    '),
                    ElevatedButton(
                      onPressed: () async {
                        TimeOfDay? newTime = await showTimePicker(
                            context: context, initialTime: time!);
                        if (newTime != null) {
                          setState(() {
                            time = newTime;
                          });
                        }
                      },
                      child: Text('${time!.hour}:${time!.minute}'),
                    ),
                  ],
                ),
                gap,
                gap,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      User user =
                          User(id: id, name: name, date: date, time: time);
                      getIt<UserRepository>().addUser(user);
                    },
                    child: const Text('Register User'),
                  ),
                ),
                gap,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                        Navigator.pushNamed(context, '/viewUser');
                    },
                    child: const Text('View Users'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
