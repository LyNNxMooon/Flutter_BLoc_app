import 'package:bloc_todo_app/BLoc/pages/to_do_page.dart';
import 'package:bloc_todo_app/data/models/to_do_hive_model.dart';
import 'package:bloc_todo_app/data/vos/todo_task.dart';
import 'package:bloc_todo_app/persistent/hive_constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoTaskAdapter());
  await Hive.openBox<List<ToDoTask>>(kBoxNameForToDoTask);

  final todoHiveModel = ToDoHiveModel();
  runApp(MyApp(
    todoHiveModel: todoHiveModel,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.todoHiveModel});

  final ToDoHiveModel todoHiveModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: ToDoPage(
          toDoHiveModel: todoHiveModel,
        ));
  }
}
