import '../model/student.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers for TextFormFields
  final GlobalKey<FormState> fKey = GlobalKey<FormState>();
  final sidController = TextEditingController();
  final passwordController = TextEditingController();

  List<Student>? lstStudent;

  @override
  void didChangeDependencies() {
    lstStudent = ModalRoute.of(context)!.settings.arguments as List<Student>?;
    super.didChangeDependencies();
  }

  void login(String sid, String password) {
    // Check if the entered sid and password exist in the list
    for (var i = 0; i < lstStudent!.length; i++) {
      if (sid == lstStudent![i].sid && password == lstStudent![i].password) {
        // Navigate to the dashboard
        Navigator.pushNamed(context, '/dashboard',  arguments: lstStudent,);
        return;
      }
    }

    // Show an alert dialog with an error message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Invalid username or password'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Screen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: fKey,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                height: 400,
                width: double.infinity,
                color: Colors.black,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: sidController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        hintText: 'Enter your student id',
                        hintStyle: TextStyle(color: Colors.white60),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: Colors.white60),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (fKey.currentState!.validate()) {
                            login(sidController.text, passwordController.text);
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to the signup page
                        Navigator.pushNamed(context, '/signup',  arguments: lstStudent,);
                      },
                      style: const ButtonStyle(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                      ),
                      child: const Text(
                        "Don't have an account? Sign up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
