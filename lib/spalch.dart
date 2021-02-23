 import 'package:flutter/material.dart';
import 'package:temepretureconvert/home.dart';

class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  Future.delayed(Duration(seconds: 3)).then((value) {
  Navigator.pushReplacement(context, MaterialPageRoute(
  builder: (context) {
  return HomePage();}));
  });
return Scaffold(
  body: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Center(
      child:Text('Temperature Conversion',style: TextStyle(
        fontSize: 25,
      color:Colors.cyanAccent,
      fontWeight: FontWeight.bold,
    ),),
    ),
  ),
);

  }
  // TODO: implement build
  }
