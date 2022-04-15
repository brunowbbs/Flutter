import 'package:customwidgets/controllers/posts_controller.dart';
import 'package:customwidgets/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

class OnePage extends StatefulWidget{
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {

  final PostsController _controller = PostsController();

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
              animation: Listenable.merge([_controller.posts, _controller.inLoader]),
              builder: (_,__)=> _controller.inLoader.value ? const CircularProgressIndicator() : ListView.builder(
                physics: const NeverScrollableScrollPhysics(), //desabilitar scrollview
                shrinkWrap: true, //ocupar o tamanho da lista
                itemCount: _controller.posts.value.length,
                itemBuilder: (_, index)=> ListTile(
                  title: Text(_controller.posts.value[index].title),
                ),
              )
            ),
            const SizedBox(height: 20),
            Center(
              child: CustomButtonWidget(
                titleSize: 20,
                disabled: false,
                onPressed: ()=>_controller.callAPI(), 
                title: "Pressione"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
