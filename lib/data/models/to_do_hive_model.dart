import 'package:bloc_todo_app/data/vos/todo_task.dart';
import 'package:bloc_todo_app/persistent/hive_dao.dart';

class ToDoHiveModel {
  ToDoHiveModel._();
  static final ToDoHiveModel _singleton = ToDoHiveModel._();
  factory ToDoHiveModel() => _singleton;

  final HiveDao _hiveDao = HiveDao();

  //init sample Data

  ToDoTask sampleTask =
      ToDoTask(id: 0, task: "Sample task", isCompleted: false);

  //Create

  void saveToDoTask(ToDoTask task) {
    List currentList = getToDoTaskList();
    currentList.add(task);

    _hiveDao.saveToDoTaskList(currentList.cast<ToDoTask>());
  }

  //Read

  List getToDoTaskList() => _hiveDao.getToDoTaskList() ?? [sampleTask];

  //Update
  void updateToDoTask(ToDoTask task, int index) {
    List currentList = getToDoTaskList();

    currentList[index] = task;

    _hiveDao.updateToDoTaskList(currentList.cast<ToDoTask>());
  }

  //Delete

  void deleteToDoTask(ToDoTask task) {
    List currentList = getToDoTaskList();

    currentList.remove(task);

    _hiveDao.updateToDoTaskList(currentList.cast<ToDoTask>());
  }
}
