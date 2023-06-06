import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddStudentView extends ConsumerStatefulWidget {
  const AddStudentView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddStudentViewState();
}

final fNameProvider = StateProvider<String>((ref) => ' ');
final lNameProvider = StateProvider<String>((ref) => ' ');
final dobProvider = StateProvider<String>((ref) => ' ');

class _AddStudentViewState extends ConsumerState<AddStudentView> {
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final dobController = TextEditingController();

  final myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: myKey,
            child: Column(
              children: [
                const SizedBox(height: 8),
                TextFormField(
                  controller: fNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Enter first name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: lNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Enter last name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: dobController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Enter DOB',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter DOB';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (myKey.currentState!.validate()) {
                        ref.read(fNameProvider.notifier).state =
                            fNameController.text.trim();
                        ref.read(lNameProvider.notifier).state =
                            lNameController.text.trim();
                        ref.read(dobProvider.notifier).state =
                            dobController.text.trim();
                      }
                    },
                    child: const Text('ADD'),
                  ),
                ),
                Text(
                  'Data is : ${ref.watch(fNameProvider)}, ${ref.watch(lNameProvider)}, ${ref.watch(dobProvider)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
