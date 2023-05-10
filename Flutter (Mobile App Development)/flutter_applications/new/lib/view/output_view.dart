import 'package:flutter/material.dart';

import '../model/student.dart';

class OutputView extends StatefulWidget {
  const OutputView({super.key});

  @override
  State<OutputView> createState() => _OutputViewState();
}

class _OutputViewState extends State<OutputView> {
  List<Student>? lstStudents;
  @override
  void didChangeDependencies() {
    lstStudents = ModalRoute.of(context)!.settings.arguments as List<Student>?;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Output View'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: lstStudents!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://schoolworkspro.com/assets/img/logo.png'),
                ),
                title: Text(
                    "${lstStudents![index].fname!} ${lstStudents![index].lname!}"),
                subtitle: const Text("s"),
                trailing: Wrap(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            lstStudents!.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.delete))
                  ],
                ),
              );
            }
            )
            );
  }
}



// ListView.builder(
//         itemCount : lstStudents!.length,
//         itemBuilder: (context, index){
//           return Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(lstStudents![index].fname!),
//                Text(lstStudents![index].lname!),
//             ],
//           );
//         }
        
//         )



// ListView.builder(
//             itemCount: lstStudents!.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 leading: const CircleAvatar(
//                   radius: 20,
//                   backgroundImage: NetworkImage(
//                       'https://schoolworkspro.com/assets/img/logo.png'),
//                 ),
//                 title: Text(
//                     "${lstStudents![index].fname!} ${lstStudents![index].lname!}"),
//                 subtitle: const Text("s"),
//                 trailing: Wrap(
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           setState(() {
//                             lstStudents!.removeAt(index);
//                           });
//                         },
//                         icon: const Icon(Icons.delete))
//                   ],
//                 ),
//               );
//             })