import 'package:bloc_todo_app/data/vos/todo_task.dart';
import 'package:bloc_todo_app/domain/repository.dart';
import 'package:bloc_todo_app/persistent/hive_constant.dart';
import 'package:hive/hive.dart';

class HiveDao implements ToDoRepo {
  HiveDao._();
  static final HiveDao _singleton = HiveDao._();
  factory HiveDao() => _singleton;

  Box<List<ToDoTask>> getToDoTasksBox() =>
      Hive.box<List<ToDoTask>>(kBoxNameForToDoTask);

  @override
  void deleteToDoTaskList() => getToDoTasksBox().delete(kHiveKeyForToDoTask);

  @override
  List<ToDoTask>? getToDoTaskList() =>
      getToDoTasksBox().get(kHiveKeyForToDoTask);

  @override
  void saveToDoTaskList(List<ToDoTask> tasks) =>
      getToDoTasksBox().put(kHiveKeyForToDoTask, tasks);

  @override
  void updateToDoTaskList(List<ToDoTask> tasks) =>
      getToDoTasksBox().put(kHiveKeyForToDoTask, tasks);
}
