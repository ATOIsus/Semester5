import 'package:flutter/material.dart';

class LoadImageView extends StatefulWidget {
  const LoadImageView({super.key});

  @override
  State<LoadImageView> createState() => _LoadImageViewState();
}

class _LoadImageViewState extends State<LoadImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // {} is not used because single line is used.

                for (int i = 0; i < 10; i++)
                  const CircleAvatar(
                    radius: 150,
                    backgroundImage:
                        AssetImage('assets/images/temple.jpg'), //network Image
                  ),

                //
                for (int i = 0; i < 10; i++) ...{
                  if (i % 2 == 0) Text(i.toString())
                },

                Image.network('https://schoolworkspro.com/assets/img/logo.png',
                    fit: BoxFit.fitHeight),

                const CircleAvatar(
                  radius: 150,
                  backgroundImage: NetworkImage(
                      'https://schoolworkspro.com/assets/img/logo.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//Assests: Every files, images, fonts that will be used.

// In line 60, pubspec.yaml
//  assets:
//       - assets/images/

// Later assests will not be used to store everything locally, API will be used.




//  Container(
//               decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
                  
//                   ),
//               child: SizedBox(child: Image.asset('assets/images/temple.jpg'),
//               ),
//             ),