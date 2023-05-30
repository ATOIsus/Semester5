import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: [
                  const Text(
                    "Hello 1",
                    style: TextStyle(fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.normal),
                  ),
                    const Text(
                    "Hello 2",
                    style: TextStyle(fontSize: 20),
                  ),
                    const Text(
                    "Hello 3",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Username"),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Password"),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(onPressed: () {}, child: const Text("Submit"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
