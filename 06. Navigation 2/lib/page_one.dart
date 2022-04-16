import 'package:flutter/material.dart';

class PageOne extends StatelessWidget{
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var backParams = await  Navigator.of(context).pushNamed("/two-page", arguments: 'Wesley - Parametro');
            //Navigator.of(context).pushReplacementNamed("/two-page", arguments: 'Wesley - Parametro'); (RESET)
            print(backParams);
          }, 
          child: const Text("Ir para tela 2")) 
        ),
    );

  }

}