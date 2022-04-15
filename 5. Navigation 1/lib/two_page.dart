import 'package:flutter/material.dart';

class TwoPage extends StatelessWidget{

  final String args;

  const TwoPage({Key? key,  required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Page 2"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          child:  Text("Voltar para page1 $args") 
        ),
      ),
    );

  }
  
}