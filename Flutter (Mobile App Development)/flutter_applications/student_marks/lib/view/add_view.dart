import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/module_state.dart';
import '../view_model/view_model.dart';

class AddStudentView extends ConsumerStatefulWidget {
  const AddStudentView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddStudentViewState();
}

final fNameProvider = StateProvider<String>((ref) => ' ');
final lNameProvider = StateProvider<String>((ref) => ' ');
final currentMarksProvider = StateProvider<String>((ref) => ' ');

final currentModuleProvider = StateProvider<String>((ref) => ' ');

final moduleMarksProvider = StateProvider<Map<String, int>>((ref) => {});

class _AddStudentViewState extends ConsumerState<AddStudentView> {
  var lstModule = ModuleState.modules;
  String? module;

  Map<String, String>? studentMarks;

  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final marksController = TextEditingController();

  final myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(studentViewModelProvider);

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
              mainAxisSize: MainAxisSize.min,
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
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a module';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Modules',
                    border: OutlineInputBorder(),
                  ),
                  items: lstModule
                      .map(
                        (module) => DropdownMenuItem(
                          value: module,
                          child: Text(module),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    //ref.read(currentModuleProvider.notifier).state = value;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: marksController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Enter Marks',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Marks';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       ref.read(moduleMarksProvider.notifier).state.addAll({
                //         "${ref.read(currentModuleProvider.notifier)}":
                //             marksController.text.trim()
                //       });
                //     },
                //     child: const Text('Add Marks'),
                //   ),
                // ),
                // const SizedBox(height: 8),
                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       if (myKey.currentState!.validate()) {
                //         var student = Student(
                //           fname: fNameController.text.trim(),
                //           lname: lNameController.text.trim(),
                //           studentMarks: studentMarks,
                //         );

                //         ref
                //             .read(studentViewModelProvider.notifier)
                //             .addStudent(student);

                //         ScaffoldMessenger.of(context)
                //             .showSnackBar(const SnackBar(
                //           content: Text("Student Added"),
                //           backgroundColor: Colors.green,
                //         ));
                //       }
                //     },
                //     child: const Text('Add Student'),
                //   ),
                // ),
                data.students.isNotEmpty
                    ? Column(
                        children: [
                          const SizedBox(height: 8),
                          const SizedBox(height: 8),
                          for (var i = 0; i < data.students.length; i++) ...{
                            Text(
                              "${data.students[i].fname} ${data.students[i].lname}",
                            ),
                          },
                          const SizedBox(height: 8),
                          DataTable(
                            headingRowColor: MaterialStateColor.resolveWith(
                                (states) => Colors.blue),
                            columns: const [
                              DataColumn(
                                  label: Expanded(
                                child: Text('API', textAlign: TextAlign.center),
                              )),
                              DataColumn(
                                label: Text('Flutter',
                                    textAlign: TextAlign.center),
                              ),
                              DataColumn(
                                label:
                                    Text('Design', textAlign: TextAlign.center),
                              ),
                              DataColumn(
                                label: Text('Individual',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                            rows: [
                              for (var i = 0;
                                  i < data.students.length;
                                  i++) ...{
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      "${data.students[i].studentMarks!['API']}",
                                    )),
                                    DataCell(Text(
                                      "${data.students[i].studentMarks!['Flutter ']}",
                                    )),
                                    DataCell(Text(
                                      "${data.students[i].studentMarks!['Design']}",
                                    )),
                                    DataCell(Text(
                                      "${data.students[i].studentMarks!['Individual']}",
                                    )),
                                  ],
                                )
                              }
                            ],
                          ),
                           const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  for (var i = 0;
                                      i < data.students.length;
                                      i++) ...{
                                    Text(
                                        "Total marks: ${data.students[i].studentMarks!['API']! + data.students[i].studentMarks!['Flutter ']! + data.students[i].studentMarks!['Design']! + data.students[i].studentMarks!['Individual']!}"),
                                    if (data.students[i]
                                                .studentMarks!['API']! >
                                            40 &&
                                        data.students[i]
                                                .studentMarks!['Flutter ']! >
                                            40 &&
                                        data.students[i]
                                                .studentMarks!['Design']! >
                                            40 &&
                                        data.students[i]
                                                .studentMarks!['Individual']! >
                                            40)
                                      ...{
                                        const Text("Result: Pass")

                                      }else...{
                                        const Text("Result: Fail")
                                      },


                                      if(data.students[i].studentMarks!['API']! + data.students[i].studentMarks!['Flutter ']! + data.students[i].studentMarks!['Design']! + data.students[i].studentMarks!['Individual']! > 60 )...{
   const Text("Division: First")
                                      } else if(data.students[i].studentMarks!['API']! + data.students[i].studentMarks!['Flutter ']! + data.students[i].studentMarks!['Design']! + data.students[i].studentMarks!['Individual']! < 60 )...{
   const Text("Division: Second")
                                      } else ...{
                                        const Text("Division: Fail")
                                      }



                                  }

                                ],
                              )
                            ],
                          )
                        ],
                      )
                    : const Text('Data chaina bhai')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

















// Go to StateFulWidget
//Press Alt
//Hold Alt and go before all State
//Write Consumer infront of Stateful