part of 'todo_bloc.dart';

class TodoState {
  final List<TodoModel> todoList;
  final bool isLoading;
  final bool isDeleted;

  TodoState({
    this.todoList = const [],
    this.isLoading = false,
    this.isDeleted = false,
  });

  TodoState copyWith({
    List<TodoModel>? todoList,
    bool? isLoading,
    bool? isDeleted,
  }) {
    return TodoState(
      todoList: todoList ?? this.todoList,
      isLoading: isLoading ?? this.isLoading,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  String toString() {
    return 'TodoState(todoList: $todoList, isLoading: $isLoading,isDeleted: $isDeleted)';
  }
}
