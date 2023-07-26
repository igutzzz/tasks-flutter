import 'package:estudos_flutter/components/listItem.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Tasks());
}

class ListNotification extends Notification {
  final String task;
  ListNotification(this.task);
}

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<String> tasks = [];
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Task Manager"),
        ),
        body: NotificationListener<ListNotification>(
          onNotification: (n) {
            setState(() {
              tasks.remove(n.task);
              print(tasks);
            });
            return true;
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: textController,
                          onSubmitted: (text) {
                            setState(() {
                                if (textController.text != "") {
                                  tasks.add(textController.text);
                                }
                                textController.clear();
                                print(tasks);
                              });
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Nova tarefa..."),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (textController.text != "") {
                                  tasks.add(textController.text);
                                }
                                textController.clear();
                                print(tasks);
                              });
                            },
                            child: const Icon(Icons.add)),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      clipBehavior: Clip.antiAlias,
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        var title = tasks[index];
                        return ListItem(title: title);
                      }),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(),
      ),
    );
  }
}
