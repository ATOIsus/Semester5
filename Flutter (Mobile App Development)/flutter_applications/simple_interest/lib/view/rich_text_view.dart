import 'package:flutter/material.dart';

class RichTextView extends StatefulWidget {
  const RichTextView({super.key});

  @override
  State<RichTextView> createState() => _RichTextViewState();
}

class _RichTextViewState extends State<RichTextView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: RichText(
          text : const TextSpan(
            text: 'My',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color : Colors.red,
          ),
          children: <TextSpan>[
            TextSpan(
              text: ' name is',
            ),
              TextSpan(
              text: ' smth?',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              )
            )
          ]
          ),
      )
    );
  }
}


// return Scaffold(
//       body: 
//       Container(
//         color: Colors.black,
//         width: double.infinity,

//         child: const Text(
//             'My name is smth?',
//             style: TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//               color : Colors.red,
//           ),
//           ),
//       )
//     );