import 'package:bloc_todo_app/persistent/hive_constant.dart';
import 'package:hive/hive.dart';
part 'todo_task.g.dart';

@HiveType(typeId: kTypeIdForTodoTask)
class ToDoTask {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String task;
  @HiveField(2)
  final bool isCompleted;

  ToDoTask({required this.id, required this.task, this.isCompleted = false});

  ToDoTask toggleCompletion() {
    return ToDoTask(id: id, task: task, isCompleted: !isCompleted);
  }
}
