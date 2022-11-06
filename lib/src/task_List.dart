import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/src/home/bloc/controller/todo_bloc.dart';
import 'package:todoapp/src/update_screen.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    void _updateTask(BuildContext context) {
      showModalBottomSheet(
          backgroundColor: Colors.white,
          context: context,
          isScrollControlled: true,
          builder: (context) => Container(
                padding: const EdgeInsets.only(top: 200),
                child: const UpdateScreen(),
              ));
    }

    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        if (state.todoList.isEmpty) {
          return const Center(
            child: Text('No data Found'),
          );
        } else {
          return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey,
                  child: ListView(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Text\n ${state.todoList[index].names}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                iconSize: 24.0,
                                color: const Color.fromARGB(255, 158, 244, 54),
                                onPressed: () async {
                                  _updateTask(context);
                                },
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            iconSize: 24.0,
                            color: Colors.red,
                            onPressed: () {
                              context.read<TodoBloc>().add(
                                    DeleteTodos(
                                      state.todoList[index],
                                    ),
                                  );
                            },
                          ),
                        ],
                      ),
                      Text(
                        "Description\n ${state.todoList[index].description}",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ],
                  ),
                );
              });
        }
      }
    });
  }
}
