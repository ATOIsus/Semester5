import 'package:flutter/material.dart';

import '../model/Book.dart';

class BookAddView extends StatefulWidget {
  const BookAddView({super.key});

  @override
  State<BookAddView> createState() => _BookAddViewState();
}

class _BookAddViewState extends State<BookAddView> {
  var lstAll = [];
  List<Book> lstBook = [];

  @override
  void didChangeDependencies() {
    lstAll = ModalRoute.of(context)!.settings.arguments as List;
    lstBook = lstAll[1];
    super.didChangeDependencies();
  }

  final gap = const SizedBox(height: 80);
  List<String> cities = [
    "Author1",
    "Author2",
    "Author3",
    "Author4",
  ];

  String? author;
  String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Book'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(children: [
            TextField(
              onChanged: (value) {
                title = value;
              },
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            gap,
            DropdownButtonFormField(
              validator: (value) {
                if (value == null) {
                  return 'Please select author';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Author',
                border: OutlineInputBorder(),
              ),
              items: cities
                  .map(
                    (city) => DropdownMenuItem(
                      value: city,
                      child: Text(city),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  author = value;
                });
              },
            ),
            const SizedBox(height: 150),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Book obj = Book(
                    title: title,
                    author: author,
                  );
                  lstBook.add(obj);
                  print(lstAll);

                  lstAll[1] = lstBook;

                  Navigator.pushNamed(context, '/bookView', arguments: lstAll);
                },
                child: const Text('Add Book'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
