import 'package:flutter/material.dart';

import '../model/Book.dart';

class BookView extends StatefulWidget {
  const BookView({super.key});

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  var lstAll = [];
  List<Book> lstBook = [];
  
  @override
  void didChangeDependencies() {
    lstAll = ModalRoute.of(context)!.settings.arguments as List;
    lstBook = lstAll[1];
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Book'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: lstBook.length,
        itemBuilder: (context, index){
          return  Column(
            children: [
              GestureDetector(
                 onDoubleTap: () => {
                       Navigator.pushNamed(context, '/register', arguments: lstAll)
                 },
                     child: createCard(lstBook[index].author, lstBook[index].title)
              ),

            ],
          );
          
        }
        ),
    );
  }


   Widget createCard(String author, String title){
    //In class should be outside the build but inside the class.
    return  SizedBox(
                height: 200,
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Column(
                      children: [
                        Text(author,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            )
                            ),
                            Text(title,
                            style: const TextStyle(
                              fontSize: 20,
                            )
                            ),
                      ],
                    ),
                  ),
                ),
              );
  }
}

