import 'package:flutter/material.dart';

class ToDoProvider with ChangeNotifier {
  List<String> toDos = [];
  TextEditingController controller = TextEditingController();

  addTask() {
      if (controller.text != '') toDos.add(controller.text.toString());
      controller.text ='';
      notifyListeners();
  }

  removeTask(String delTask) {
    toDos.remove(delTask);
    notifyListeners();
  }

}