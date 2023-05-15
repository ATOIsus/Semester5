import 'package:flutter/material.dart';

import '../model/student.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Student>? lstStudents;

  @override
  void didChangeDependencies() {
    lstStudents = ModalRoute.of(context)!.settings.arguments as List<Student>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: ListView.builder(
        itemCount: lstStudents!.length,
        itemBuilder: (context, index){


          var sid = lstStudents![index].sid!;
          var fname = lstStudents![index].fname!;
          var lname = lstStudents![index].lname!;

          var age = lstStudents![index].age!;
          var dueAmount = lstStudents![index].dueAmount;

          
          return  Column(
            children: [
              GestureDetector(
                 onDoubleTap: () => {
                       Navigator.pushNamed(context, '/payDue', arguments: lstStudents)
                 },
                     child: ListTile(
            title: Text('Name: $fname $lname'),
            subtitle: Text('Student ID: $sid'),
            trailing: Text('Age: $age, Due Amount: $dueAmount'),
          ),
              ),

            ],
          );

        }
        ),  
      
    );
  }
}
