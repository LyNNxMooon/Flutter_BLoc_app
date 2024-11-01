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
    List<ToDoTask> currentList = getToDoTaskList();
    currentList.add(task);

    _hiveDao.saveToDoTaskList(currentList);
  }

  //Read

  List<ToDoTask> getToDoTaskList() =>
      _hiveDao.getToDoTaskList() ?? <ToDoTask>[sampleTask];

  //Update
  void updateToDoTask(ToDoTask task, int index) {
    List<ToDoTask> currentList = getToDoTaskList();

    currentList[index] = task;

    _hiveDao.updateToDoTaskList(currentList);
  }

  //Delete

  void deleteToDoTask(ToDoTask task) {
    List<ToDoTask> currentList = getToDoTaskList();

    currentList.remove(task);

    _hiveDao.updateToDoTaskList(currentList);
  }
}
