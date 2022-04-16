import 'dart:math';

import 'package:customwidgets/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

class OnePage extends StatefulWidget{
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {

  final ValueNotifier<int> _valorAleatorio = ValueNotifier<int>(0);

  random() async {
    for(int i = 0; i < 10; i++){
       await Future.delayed(const Duration(seconds: 1));

        _valorAleatorio.value = Random().nextInt(1000);

    }
  }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Page 1"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Esse componente é um listener e somente ele é redesenhado no momento do builder
          ValueListenableBuilder(
            valueListenable: _valorAleatorio, 
            builder: (_, valor,__)=>Text("O valor é: $valor", style: const TextStyle(fontSize: 20),)),
          const SizedBox(height: 20),
          Center(
            child: CustomButtonWidget(
              titleSize: 20,
              disabled: false,
              onPressed: ()=>random(), 
              title: "Pressione"
            ),
          ),
        ],
      ),
    );

  }
}