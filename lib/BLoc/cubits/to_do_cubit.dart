import 'package:bloc_todo_app/data/models/to_do_hive_model.dart';
import 'package:bloc_todo_app/data/vos/todo_task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoCubit extends Cubit<List<ToDoTask>> {
  final ToDoHiveModel _todoHiveModel;

  ToDoCubit(this._todoHiveModel) : super([]) {
    loadToDoTasks();
  }

  loadToDoTasks() {
    final toDoList = _todoHiveModel.getToDoTaskList();

    emit(toDoList);
  }

  addToDoTask(String task) {
    int id = DateTime.now().millisecondsSinceEpoch;

    final newTask = ToDoTask(id: id, task: task, isCompleted: false);

    _todoHiveModel.saveToDoTask(newTask);

    //re-load
    loadToDoTasks();
  }

  deleteToDoTask(ToDoTask task) {
    _todoHiveModel.deleteToDoTask(task);

    //re-load
    loadToDoTasks();
  }

  updateToDoTask(ToDoTask task, int index) {
    final updatedTask = task.toggleCompletion();

    _todoHiveModel.updateToDoTask(updatedTask, index);

    //re-load
    loadToDoTasks();
  }
}
