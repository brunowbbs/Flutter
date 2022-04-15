import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget{
  const PageTwo({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

  var args = ModalRoute.of(context)!.settings.arguments as String;


    return Scaffold(
      appBar: AppBar(
        title:const Text("Page 2")
      ),

      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.of(context).pop("HAHAHA");

          //Impedindo POP
          /*if(Navigator.of(context).canPop()){
            Navigator.of(context).pop("HAHAHA");
          }*/
        }, child: Text("Voltar Page 1 $args"),),
      ),
    );

  }
  
}