import 'package:bloc_todo_app/BLoc/cubits/to_do_cubit.dart';
import 'package:bloc_todo_app/data/vos/todo_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatelessWidget {
  ToDoScreen({super.key});

  final _taskController = TextEditingController();

  _showAddToDoDialog(BuildContext context) {
    final todoCubit = context.read<ToDoCubit>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(actions: [
        TextButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.black),
                foregroundColor: WidgetStatePropertyAll(Colors.white)),
            onPressed: () {
              todoCubit.addToDoTask(_taskController.text);
              Navigator.of(context).pop();
            },
            child: Text("Add")),
      ], content: addDialogWidget(context)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddToDoDialog(context),
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<ToDoCubit, List<ToDoTask>>(
          builder: (context, toDos) => ListView.separated(
              itemBuilder: (context, index) =>
                  toDoTileWidget(context, toDos[index], index),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
              itemCount: toDos.length),
        ),
      ),
    );
  }

  Widget addDialogWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "New Task",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: _taskController,
        ),
      ],
    );
  }

  Widget toDoTileWidget(BuildContext context, ToDoTask task, int index) {
    final todoCubit = context.read<ToDoCubit>();
    return ListTile(
      title: Text(task.task),
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (value) => todoCubit.updateToDoTask(task, index),
      ),
      trailing: IconButton(
          onPressed: () => todoCubit.deleteToDoTask(task),
          icon: const Icon(Icons.delete)),
    );
  }
}
