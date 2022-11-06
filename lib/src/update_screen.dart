//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/src/home/bloc/controller/todo_bloc.dart';
import 'package:todoapp/src/home/bloc/view_model/todo_modal.dart';

// ignore: must_be_immutable
class UpdateScreen extends StatefulWidget {
  const UpdateScreen({
    super.key,
  });

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController namesController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(mainAxisSize: MainAxisSize.min, children: [
                const Text(
                  'Update Task',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: TextField(
                    autofocus: true,
                    controller: namesController,
                    decoration: const InputDecoration(
                      label: Text('Title'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                TextField(
                  autofocus: true,
                  controller: descriptionController,
                  minLines: 3,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    label: Text('Description'),
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        )),
                    ElevatedButton(
                      onPressed: () {
                        context.read<TodoBloc>().add(
                              UpdateTodos(
                                TodoModel(
                                  id: state.todoList[index].id,
                                  names: namesController.text.trim(),
                                  description:
                                      descriptionController.text.trim(),
                                  createdAt: Timestamp.now(),
                                ),
                              ),
                            );
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      child:
                          const Text('Update', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ]);
            });
      }
    });
  }
}
