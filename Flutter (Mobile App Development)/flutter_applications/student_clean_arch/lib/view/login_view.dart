import 'package:flutter/material.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final _gap = const SizedBox(
    height: 20,
  );
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    _usernameController.text = '';
    _passwordController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: key,
            child: Column(
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: "Username"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Username';
                    }
                    return null;
                  },
                ),
                _gap,
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: "Password"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                _gap,
                _gap,
                _gap,
                SizedBox(
                  child: ElevatedButton(
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          Navigator.pushNamed(context, '/addBatch');
                        }
                      },
                      child: const Text('Log In')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
