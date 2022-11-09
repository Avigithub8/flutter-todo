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
      // if (state.isLoading) {
      //   return const Center(
      //     child: CircularProgressIndicator(),
      //   );
      // } else {
      if (state.todoList.isEmpty) {
        return const Center(
          child: Text('No data Found'),
        );
      } else {
        return ListView.builder(
            itemCount: state.todoList.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    // ignore: unnecessary_string_interpolations
                    '${state.todoList[index].names}',
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  subtitle: Text(
                    // ignore: unnecessary_string_interpolations
                    '${state.todoList[index].description}',
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        iconSize: 24.0,
                        color: const Color.fromARGB(255, 158, 244, 54),
                        onPressed: () async {
                          _updateTask(context);
                        },
                      ),
                      IconButton(
                          icon: const Icon(Icons.delete),
                          iconSize: 24.0,
                          color: Colors.red,
                          onPressed: () {
                            // if (state.isDeleted) {
                            context.read<TodoBloc>().add(
                                  DeleteTodos(
                                    state.todoList[index],
                                  ),
                                );
                            //}
                          }),
                    ]),
                  ),
                ),
              );
            });
      }
      // }
    });
  }
}
