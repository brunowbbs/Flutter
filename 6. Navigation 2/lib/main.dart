import 'package:flutter/material.dart';
import 'package:nav/page_one.dart';
import 'package:nav/page_two.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),

      initialRoute: "/",

      routes:  {
        '/' : (_)=> const PageOne(),
        '/two-page' : (_)=>const PageTwo(),
      },
    );

  }

}