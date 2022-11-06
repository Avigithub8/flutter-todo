part of 'todo_bloc.dart';

abstract class TodoEvent {
  const TodoEvent();
}

class GetAllTodos extends TodoEvent {}

class AddTodos extends TodoEvent {
  TodoModel todo;
  AddTodos(
    this.todo,
  );
}

class UpdateTodos extends TodoEvent {
  TodoModel todo;

  UpdateTodos(
    this.todo,
  );
}

class DeleteTodos extends TodoEvent {
  TodoModel todo;
  DeleteTodos(
    this.todo,
  );
}
