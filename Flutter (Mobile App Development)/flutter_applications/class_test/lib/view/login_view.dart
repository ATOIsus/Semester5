import 'package:flutter/material.dart';

import '../model/User.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  List<User> lstUser = [];
  var lstAll = [];

  var username;
  var password;

  @override
  void didChangeDependencies() {
    lstAll = ModalRoute.of(context)!.settings.arguments as List;
    lstUser = lstAll[0];

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
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
                username = value;
              },
              decoration: InputDecoration(
                hintText: 'Username',
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
                  for (int i = 0; i < lstUser.length; i++) {
                    if (lstUser[i].username == username &&
                        lstUser[i].password == password) {
                      Navigator.pushNamed(context, '/bookAdd',
                          arguments: lstAll);
                    }                          
                  }
                    ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                  content: Text("Wrong Username or Password"),
                  duration: Duration(seconds: 1),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  )
                  );
                },
                child: const Text('Log In'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
