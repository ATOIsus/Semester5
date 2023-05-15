import 'package:flutter/material.dart';

import '../model/Book.dart';
import '../model/User.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var userId;
  var fname;
  var lname;
  var age;
  var username;
  var password;

  List<User> lstUser = [];
  List<Book> lstBook = [];

   var lstAll = [];
  
  @override
  void didChangeDependencies() {
    lstAll = ModalRoute.of(context)!.settings.arguments as List;
    lstUser = lstAll[0];
    lstBook = lstAll[1];
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                userId = value;
              },
              decoration: InputDecoration(
                hintText: 'UserId',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                fname = value;
              },
              decoration: InputDecoration(
                hintText: 'First name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                lname = value;
              },
              decoration: InputDecoration(
                hintText: 'Last name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                age = value;
              },
              decoration: InputDecoration(
                hintText: 'Age',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                username = value;
              },
              decoration: InputDecoration(
                hintText: 'User name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  User obj = User(
                      userId: userId,
                      fname: fname,
                      lname: lname,
                      age: age,
                      username: username,
                      password: password);
                  lstUser.add(obj);
                  lstAll[0] = lstUser;
                  Navigator.pushNamed(context, '/login',
                      arguments: [lstUser, lstBook]);
                },
                child: const Text('Register'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
