import 'package:bloc_todo_app/data/vos/todo_task.dart';

abstract class ToDoRepo {
  //Create

  saveToDoTaskList(List<ToDoTask> tasks);

  //Read
  List<ToDoTask>? getToDoTaskList();

  //Update

  updateToDoTaskList(List<ToDoTask> tasks);

  //Delete

  deleteToDoTaskList();
}
