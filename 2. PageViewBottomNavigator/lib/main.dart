import 'package:example/pages/home_page.dart';
import 'package:flutter/material.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //removendo banner de debug
      theme:ThemeData(
        primarySwatch: Colors.green
      ),
      home: const HomePage()
    );
  }
}