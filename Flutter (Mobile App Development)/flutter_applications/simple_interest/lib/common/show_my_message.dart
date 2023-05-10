     



import 'package:flutter/material.dart';

 showTextHai(BuildContext context, String smth, {Color color = Colors.green}){
            
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                  content: Text(smth),
                  duration: const Duration(seconds: 1),
                  backgroundColor: color,
                  behavior: SnackBarBehavior.floating,
                  )
                  );
                
              }

     