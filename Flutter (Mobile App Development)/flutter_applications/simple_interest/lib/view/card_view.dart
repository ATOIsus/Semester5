import 'package:flutter/material.dart';

import '../common/show_my_message.dart';


class CardView extends StatelessWidget {
  const CardView({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index){
          return   GestureDetector(
                 onTap: () => {
                       showTextHai(context, "Success hai")
                 },
                 onDoubleTap: () => {
                       showTextHai(context, "Success hai X2")
                 },
                 child: createCard("$index")
          );
        }
      
        ),
    );
  }

  
  Widget createCard(String text){
    //In class should be outside the build but inside the class.
    return  SizedBox(
                height: 200,
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text("Another card $text",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )
                        ),
                  ),
                ),
              );
  }
}



//  const SizedBox(
//               height: 200,
//               width: double.infinity,
//               child: Card(
//                 color: Colors.blue,
//                 child: Center(child: Text("I am inside this card")),
//               ),
//             ),




  // for (int i = 0; i < 9; i++) ...{
  //             SizedBox(
  //               height: 200,
  //               width: double.infinity,
  //               child: Card(
  //                 color: Colors.blue,
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10)),
  //                 child: Center(
  //                   child: Text("Another card $i",
  //                       style: const TextStyle(
  //                         fontSize: 30,
  //                         fontWeight: FontWeight.bold,
  //                       )
  //                       ),
  //                 ),
  //               ),
  //             ),
  //           }


  // Column(
  //         children: [
           
  //           for (int i = 0; i < 9; i++) ...{
  //             GestureDetector(
  //               onTap: () => {
  //                     showTextHai(context, "Success hai")
  //               },
  //               onDoubleTap: () => {
  //                     showTextHai(context, "Success hai X2")
  //               },
  //               child: createCard("$i"),
  //             ),
  //           }
  //         ],
  //       )


//for list ListView don't use SingleChildScrollView.
//ListView is already scrollable

  //  body: ListView.builder(
  //       itemCount: 5,
  //       itemBuilder: (context, index){
  //         return createCard("$index");
  //       }
  //       ),