import 'package:flutter/material.dart';

class DataTableView extends StatefulWidget {
  const DataTableView({super.key});

  @override
  State<DataTableView> createState() => _DataTableViewState();
}

class _DataTableViewState extends State<DataTableView> {
  List<Map<String, String>> lstStudent = [
    {"fname": "Frst", "age": "12"},
    {"fname": "Second", "age": "125"},
    {"fname": "Third", "age": "122"},
    {"fname": "Fourth", "age": "123"},
    {"fname": "Fifth", "age": "124"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: DataTable(
            headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.blue),
            columns: const [
              DataColumn(
                label: Expanded(
                  child: Text('Name', textAlign: TextAlign.center),
                ),
              ),
              DataColumn(
                  label: Expanded(
                child: Text('Roll No', textAlign: TextAlign.center),
              )),
              DataColumn(
                label: Text('Action', textAlign: TextAlign.center),
              ),
            ],
            rows: [
              for (var i = 0; i < lstStudent.length; i++) ...{
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(
                      lstStudent[i]['fname']!,
                    )),
                    DataCell(Text(
                      lstStudent[i]['age']!,
                    )),
                    DataCell(
                      Wrap(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {_showAlertDialog(context, i);}, icon: const Icon(Icons.delete))
                        ],
                      ),
                    ),
                  ],
                )
              }
            ],
          ),
        ),
      ),
    );
  }

  _showAlertDialog(BuildContext context, int index) {
    AlertDialog alert = AlertDialog(
      title: const Text("Delete?"),
      content: Text("Are sure to delete ${lstStudent[index]["fname"]}?"),
      actions: [
        TextButton(
          child: const Text("No"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text("Yes"),
          onPressed: () {
            setState(() {
              lstStudent.removeAt(index);
               Navigator.pop(context);
            }
            );
          },
        )
      ],

    );

    
  showDialog(
    context : context, 
    builder : (BuildContext context){
    return alert;
  }
  );
  }

}
