import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('todo');
  runApp(MaterialApp(
    home: HiveTodo(),
    debugShowCheckedModeBanner: false,
  ));
}

class HiveTodo extends StatefulWidget {
  @override
  State<HiveTodo> createState() => _HiveTodoState();
}

class _HiveTodoState extends State<HiveTodo> {
  final ctitle = TextEditingController();
  final ccontent = TextEditingController();
  final todo_box = Hive.box('todo');
  var mytasks = [];

  @override
  void initState() {
    load_or_rear_Task();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive_ToDo"),
        actions: [
          IconButton(
              onPressed: () => createDialog(null), icon: const Icon(Icons.add))
        ],
      ),
      body: mytasks.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : ListView.builder(
              itemCount: mytasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text("${mytasks[index]['id']}"),
                    title: Text(mytasks[index]['head']),
                    subtitle: Text(mytasks[index]['desc']),
                    trailing: Wrap(
                      children: [
                        IconButton(
                            onPressed: () {
                              createDialog(mytasks[index]['id']);
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () async {
                              await todo_box.delete(mytasks[index]['id']);
                              load_or_rear_Task(); // to refresh ui after deleting data
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              }),
    );
  }

  void createDialog(int? key) {
    // key - similar to id in sqflite
    
    if(key != null){
     final existingTask = mytasks.firstWhere((element) => element['id'] == key);
     ctitle.text = existingTask['head'];
     ccontent.text = existingTask['desc'];
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(key == null ? "Create Task" : 'Update Task'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: ctitle,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Title"),
                ),
                TextField(
                  controller: ccontent,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Content"),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (key == null) {
                      createTask({
                        'title': ctitle.text,
                        'cont': ccontent.text});
                      ctitle.clear();
                      ccontent.clear();
                      Navigator.pop(context);
                    }
                    if (key != null) {
                      updateTask(key, {
                        'title':ctitle.text,
                        'cont':ccontent.text
                      });
                      ctitle.clear();
                      ccontent.clear();
                      Navigator.pop(context);
                    }
                  },
                  child: Text(key == null ? "Create" : "Update")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"))
            ],
          );
        });
  }
/// create task
  Future<void> createTask(Map<String, dynamic> task) async {
    await todo_box.add(task);
    load_or_rear_Task();
  }
/// read task
  Future<void> load_or_rear_Task() async {
    final task_from_hive = todo_box.keys.map((e) {
      //fetch all the keys from hive in ascending order
      final value = todo_box.get(e);
      return {
        'id': e,
        'head': value['title'],
        'desc': value['cont'],
      };
    }).toList();
    setState(() {
      mytasks = task_from_hive.reversed.toList();
    });
  }
  ///update task
  Future<void> updateTask(int key, Map<String, String> uptask) async{
    await todo_box.put(key, uptask);
    load_or_rear_Task();
  }
}
