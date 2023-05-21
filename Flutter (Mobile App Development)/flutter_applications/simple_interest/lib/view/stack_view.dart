import 'package:flutter/material.dart';

class StackView extends StatefulWidget {
  const StackView({super.key});

  @override
  State<StackView> createState() => _StackViewState();
}


class _StackViewState extends State<StackView> {

  var lstStudent = [1,2,3,4,5];
 // Show an alert dialog with an error message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Invalid username or password'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            shrinkWrap: true, ///Attentionnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
            itemCount: lstStudent.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onDoubleTap: () => {

                    setState((){
                       lstStudent.removeAt(index);
                    }),
                        
                      },
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 400,
                            width: double.infinity,
                            color: Colors.green,
                            child: Image.network(
                                'https://www.shutterstock.com/image-photo/old-brick-black-color-wall-260nw-1605128917.jpg',
                                fit: BoxFit.fill),
                          ),
                        
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
                        children: [
                        
                        Text("Name"),
                         Text("Batch"),
                      ],)
                    ],
                  ));
            },
            ),

            
      ),
    );
  }
}



//  body: SafeArea(
//           child: Stack(
//         children: [
//           Container(
//             height: 400,
//             width: double.infinity,
//             color: Colors.green,
//           ),
//            Positioned(
//             top: 1,
//              child: Container(
//               height: 50,
//               width: 100,
//               color: Colors.red,
//                      ),
//            ),
//              Positioned(
//             right: 0,
//             bottom: 0,
//              child: Container(
//               height: 100,
//               width: 100,
//               color: Colors.yellow,
//                      ),
//            )
//         ],
//       ),
//       ),






// body: SingleChildScrollView(
//         child = SafeArea(
//             child: Stack(
      
//               clipBehavior: Clip.none,
//           children: [
//             Container(
//               height: 400,
//               width: double.infinity,
//               color: Colors.green,
//               child:  Image.network('https://www.shutterstock.com/image-photo/old-brick-black-color-wall-260nw-1605128917.jpg',
//                     fit: BoxFit.fitHeight),
//             ),
//              Positioned(
//               bottom: -90,
//               left:  MediaQuery.of(context).size.height * .1,
//                child: Container(
             
//                 child:  const CircleAvatar(
//                       radius: 100,
//                       backgroundImage:
//                           AssetImage('assets/images/temple.jpg'), //network Image
//                     ),
      
//                        ),
//              ),
              
//           ],
//         ),
//         ),
//       ),


// body: SingleChildScrollView(
//         child: SafeArea(
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Container(
//                 height: 400,
//                 width: double.infinity,
//                 color: Colors.green,
//                 child: Image.network(
//                     'https://www.shutterstock.com/image-photo/old-brick-black-color-wall-260nw-1605128917.jpg',
//                     fit: BoxFit.fill),
//               ),
//               Positioned(
//                 top: 1,
//                 right: 3,
//                 child:
//                     Container(color: Colors.red, child: const Icon(Icons.edit)),
//               ),
//             ],
//           ),
//         ),
//       ),