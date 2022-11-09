import 'package:flutter/material.dart';
import 'package:todoapp/src/add_screen.dart';
import 'package:todoapp/src/home/bloc/view_model/todo_modal.dart';
import 'package:todoapp/src/task_List.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final List<TodoModel> taskList = [];

  @override
  Widget build(BuildContext context) {
    return const TodoList();
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: const Color.fromARGB(255, 252, 252, 245),
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 251, 251),
      appBar: AppBar(
        title: const Text('Todo App'),
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
            onPressed: () => _addTask(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: const TasksList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Add Task',
        foregroundColor: const Color.fromARGB(255, 174, 15, 227),
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
