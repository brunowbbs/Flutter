import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget{
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  final TextEditingController _textEditingController = TextEditingController(); 

  List<String> tarefas  = [];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Lista de tarefas"),
      ),
      
      body:Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children:  [
            TextField(
              controller: _textEditingController,//controlar o funcionamento do widget
            ),

            SizedBox(
              height: 400,
              /*child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(tarefas[index]),
                  );
                },
              ),*/
              child: ListView.separated(
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(tarefas[index]),
                    onLongPress: (){
                      setState(() {
                        tarefas.removeAt(index);
                      });
                    },
                  );
                },
                separatorBuilder: (context, index)=> const Divider(), 
                itemCount: tarefas.length
              ),
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_textEditingController.text.isNotEmpty){
            setState(() {
              tarefas.add(_textEditingController.text);
            });
            _textEditingController.clear();
          }
        },
        child: const Icon(Icons.add),
        
      ),
    );
  }}