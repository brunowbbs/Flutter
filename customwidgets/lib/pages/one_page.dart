import 'package:customwidgets/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

class OnePage extends StatelessWidget{
  const OnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Page 1"),
      ),

      body: Center(
        child: CustomButtonWidget(
          titleSize: 20,
          disabled: false,
          onPressed: (){ 
            print('ok');
          }, 
          title: "Pressione"
        ),
      ),
    );

  }

}