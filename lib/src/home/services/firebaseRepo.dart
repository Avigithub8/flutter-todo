import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:todoapp/src/home/bloc/view_model/todo_modal.dart';
import 'package:todoapp/src/home/services/response.dart';

abstract class TodoRepository {
  Future<firebaseResponse<List<TodoModel>>> getAllTodos();
  Future<firebaseResponse<List<TodoModel>>> addTodo(TodoModel todo);
  Future<firebaseResponse<List<TodoModel>>> updateTodo(TodoModel todo);
  Future<firebaseResponse<List<TodoModel>>> removeTodo(TodoModel todo);
}

// ignore: camel_case_types
class firebaseRepo implements TodoRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<firebaseResponse<List<TodoModel>>> getAllTodos() async {
    List<TodoModel> todos = [];
    final results =
        await firestore.collection('allList').orderBy("createdAt").get();
    for (var snapshot in results.docs) {
      TodoModel newTodo = TodoModel.fromJson(snapshot.data());
      newTodo.id = snapshot.id;
      todos.add(newTodo);
    }
    return right(todos);
  }

  @override
  Future<firebaseResponse<List<TodoModel>>> addTodo(TodoModel todo) async {
    await firestore.collection('allList').add(todo.toMap());
    getAllTodos();
    return getAllTodos();
  }

  @override
  Future<firebaseResponse<List<TodoModel>>> updateTodo(TodoModel todo) async {
    await firestore.collection('allList').doc(todo.id).update(todo.toMap());
    getAllTodos();
    return getAllTodos();
  }

  @override
  Future<firebaseResponse<List<TodoModel>>> removeTodo(TodoModel todo) async {
    await firestore.collection('allList').doc(todo.id).delete();

    getAllTodos();
    return getAllTodos();
  }
}
