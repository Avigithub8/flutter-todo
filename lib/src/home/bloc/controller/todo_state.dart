part of 'todo_bloc.dart';

class TodoState {
  final List<TodoModel> todoList;
  final bool isLoading;

  TodoState({
    this.todoList = const [],
    this.isLoading = false,
  });

  TodoState copyWith({
    List<TodoModel>? todoList,
    bool? isLoading,
  }) {
    return TodoState(
      todoList: todoList ?? this.todoList,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() {
    return 'TodoState(todoList: $todoList, isLoading: $isLoading,)';
  }
}
