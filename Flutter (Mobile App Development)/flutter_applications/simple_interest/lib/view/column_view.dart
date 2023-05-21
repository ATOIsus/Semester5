import 'package:flutter/material.dart';

class ColumnView extends StatefulWidget {
  const ColumnView({super.key});

  @override
  State<ColumnView> createState() => _ColumnViewState();
}

class _ColumnViewState extends State<ColumnView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          // .center, .end, .spaceBetween,

          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.red,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.green,
                ),
              ],
            ),
          Row(
              children: [
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.red,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.green,
                ),
                 Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.green,
                ),
              ],
            )
          ]),
    );
  }
}

// return Scaffold(

//       body: Column(

//         mainAxisAlignment: MainAxisAlignment.spaceBetween,


//         children:  [
//           Column(
//               children: const [
//                     Icon(Icons.star,
//                           size: 150,
//                           color: Colors.red,),

//                     Icon(Icons.star,
//                         size: 100,
//                         color: Colors.yellow,),
//               ],
//           ),

//           const Icon(Icons.star,
//           size: 150,
//           color: Colors.green,),
//         ]),

//     );



            //    Spacer(), // To separate the widgets without using nesting.
