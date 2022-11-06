import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/src/home/bloc/controller/todo_bloc.dart';
import 'package:todoapp/src/todo_screen.dart';
//import 'package:todoapp/src/features/todotask/controller/bloc_exports.dart';
//import 'package:todoapp/src/features/todotask/tabs_screen.dart';
//import 'package:todoapp/src/home_screen.dart';
//import 'package:todoapp/src/features/todotask/task_model/task_model.dart';

//import 'package:todoapp/src/services/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        home: TodoScreen(),
      ),
    );
  }
}
