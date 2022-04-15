import 'package:flutter/material.dart';

class OnePage extends StatelessWidget{
  const OnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
          Container(
          decoration:  const BoxDecoration(
            color: Colors.amber, 
          //shape: BoxShape.circle //formato de círculo
          ), 
          width: MediaQuery.of(context).size.width,
          height: 250,
          child: const Center(
            child: Text(
              "Hello World",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                color: Colors.red,
                height: 100,
                width: 150,
                child: const Center(
                  child: Text('Container 1', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
              Container(
                color: Colors.purple,
                height: 100,
                width: 150,
                child: const Center(
                  child: Text('Container 1', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              )
            ],
          )
        ],
      );
  }
  
}