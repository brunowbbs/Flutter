import 'package:flutter/material.dart';
import 'package:navigation/one_page.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const OnePage(),
      debugShowCheckedModeBanner: false,
    );
  }

}