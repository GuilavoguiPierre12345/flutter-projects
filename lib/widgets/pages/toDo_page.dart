import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/color_provider.dart';
import 'package:provider_app/providers/todo_provider.dart';

class ToDoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(5.0),
            child:  Row(
              children: [
                Expanded(
                    child: TextField(
                      controller: context.watch<ToDoProvider>().controller,
                      decoration: const InputDecoration(
                        hintText: "add a new task",
                      ),
                    )
                ),
                IconButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      context.read<ToDoProvider>().addTask();
                    },
                    icon: const Icon(Icons.send)
                )
              ],
            ),
          ),
          const Divider(thickness: 1.2,),
          Expanded(
            child: (context.watch<ToDoProvider>().toDos.isEmpty)
                ?   const Center(
                  child: Padding(padding: EdgeInsets.all(10.0), child:  Text("YOUR TASK LIST IS EMPTY, TRY TO ADD A NEW TASK",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                )
                : ListView.separated(
                    itemCount: context.watch<ToDoProvider>().toDos.length,
                    separatorBuilder: ((context, index) => Divider(color: context.watch<ColorProvider>().color, thickness: .3,)),
                    itemBuilder: (context, index) {
                      final String currentTask = context.watch<ToDoProvider>().toDos[index];
                      return ListTile(
                        title: Text(currentTask),
                        trailing: IconButton(
                            onPressed: ( () => context.read<ToDoProvider>().removeTask(currentTask)),
                            icon: Icon(Icons.delete, color: context.watch<ColorProvider>().color,)
                        ),
                      );
                    },
                  ),
          )
        ],
      );
  }
}