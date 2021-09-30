import 'package:flutter_day3/model/to_do.dart';

class ToDoRepository {
  List<ToDo> todos = <ToDo>[];

  List<ToDo> getListToDo() {
    return todos;
  }

  addToDo(ToDo newToDo) {
    todos.add(newToDo);
  }

  deleteToDo(ToDo newToDo) {
    todos.removeWhere((item) => item.id == newToDo);
  }
}
