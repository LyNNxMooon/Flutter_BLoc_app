import 'package:bloc_todo_app/BLoc/cubits/to_do_cubit.dart';
import 'package:bloc_todo_app/data/models/to_do_hive_model.dart';
import 'package:bloc_todo_app/screens/to_do_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key, required this.toDoHiveModel});

  final ToDoHiveModel toDoHiveModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoCubit(toDoHiveModel),
      child: ToDoScreen(),
    );
  }
}
