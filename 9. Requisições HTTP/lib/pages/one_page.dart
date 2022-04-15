
import 'dart:convert';

import 'package:customwidgets/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class OnePage extends StatefulWidget{
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {

   ValueNotifier<List<Post>> posts = ValueNotifier<List<Post>>([]);
   ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  callAPI() async{
    var client = http.Client();


    try{
      inLoader.value = true;
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      var decodedResponse = jsonDecode(response.body) as List;
      posts.value = decodedResponse.map((e) => Post.fromJSON(e)).toList();
      await Future.delayed(const Duration(seconds: 5));
    }catch(e){
      print('Erro: $e');
    }
    finally{
      client.close();
      inLoader.value = false;
    }
  }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Page 1"),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Esse componente é um listener e somente ele é redesenhado no momento do builder
            AnimatedBuilder(
              animation: Listenable.merge([posts, inLoader]),
              builder: (_,__)=> inLoader.value ? const CircularProgressIndicator() : ListView.builder(
                physics: const NeverScrollableScrollPhysics(), //desabilitar scrollview
                shrinkWrap: true, //ocupar o tamanho da lista
                itemCount: posts.value.length,
                itemBuilder: (_, index)=> ListTile(
                  title: Text(posts.value[index].title),
                ),
              )
            ),
            const SizedBox(height: 20),
            Center(
              child: CustomButtonWidget(
                titleSize: 20,
                disabled: false,
                onPressed: ()=>callAPI(), 
                title: "Pressione"
              ),
            ),
          ],
        ),
      ),
    );

  }
}


class Post{
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);
  
  factory Post.fromJSON(Map json){
    return Post(json['userId'], json['id'], json['title'], json['body']);
  }

  @override
  String toString(){
    return 'id $id';
  }

}