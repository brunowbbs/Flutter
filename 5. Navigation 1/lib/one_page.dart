import 'package:flutter/material.dart';
import 'package:navigation/two_page.dart';

class OnePage extends StatelessWidget{
  const OnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Page 1"),
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const TwoPage(args: 'Wesley parametro'))
            );
          }, 
          child: const Text("Ir para page 2")
        ),
      )
    );
  }
  
}