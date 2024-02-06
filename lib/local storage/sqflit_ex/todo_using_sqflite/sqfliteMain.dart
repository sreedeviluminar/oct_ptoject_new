import 'package:flutter/material.dart';

import 'dbFunction.dart';

void main(){
  runApp(const MaterialApp(home: MyToDo(),));
}
class MyToDo extends StatefulWidget {
  const MyToDo({super.key});

  @override
  State<MyToDo> createState() => _MyToDoState();
}

class _MyToDoState extends State<MyToDo> {
  final ctitle = TextEditingController();
  final ccontent= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("ToDo"),
      ),
      body: const Column(),
      floatingActionButton:
          FloatingActionButton.extended(
            backgroundColor: Colors.purple,
              onPressed: () => showSheet(null),
            label: const Text("Create Task"),),
    );
  }

  void showSheet(int? id) async {
    //when we  click on floating action button id = null
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 120),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: ctitle,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Title"),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: ccontent,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Content"),
                ),
                ElevatedButton(
                    onPressed: () {
                      if(id == null){
                        createTask();
                        ctitle.text ="";
                        ccontent.text="";
                      }
                      if(id != null){
                        //updateTask();
                        ctitle.text ="";
                        ccontent.text="";
                      }
                    },
                    child: Text(id == null
                        ? "Create Task"
                        : "Update Task"))
              ],
            ),
          );
        });
  }

  Future<void> createTask() async{
    var id = await SQLHelper.create(ctitle.text, ccontent.text);
    print(id);
  }
}
