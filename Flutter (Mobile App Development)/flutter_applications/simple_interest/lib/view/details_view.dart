import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  var gender;

  String _dropdownValue = "Kathmandu";
  List<String> dropDownOptions = [
    "Kathmandu",
    "Pokhara",
    "Kavre",
    "Nepal",
  ];

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "First Name",
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: "Last Name",
              ),
            ),
            const SizedBox(height: 10),

            const TextField(
              decoration: InputDecoration(
                labelText: "Age",
              ),
            ),
            const SizedBox(height: 10),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Select gender'),
            ),
            // Create radio button for gender
            RadioListTile(
              title: const Text('Male'),
              value: 'Male',
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),

            RadioListTile(
              title: const Text('Female'),
              value: 'Female',
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: 300.0,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    items: dropDownOptions
                        .map<DropdownMenuItem<String>>((String mascot) {
                      return DropdownMenuItem<String>(
                          value: mascot, child: Text(mascot));
                    }).toList(),
                    value: _dropdownValue,
                    onChanged: dropdownCallback,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            TextFormField(
              decoration: InputDecoration(
                 contentPadding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0),
                labelText: "Address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

                        const SizedBox(height: 10),


            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Save Student'),
              ),
            ),


                        const SizedBox(height: 10),


            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Display Student'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
