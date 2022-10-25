import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/utils/status_enum.dart';

import '../database/database.dart';

class DBController extends GetxController {
  final _database = Get.put(MDatabase());

  Stream<List<Todo>> getAllTodos() {
    return _database.getAllTodos().watch();
  }

  Future<Todo> getTodoById(int id) async {
    return await _database.getTodoById(id).getSingle();
  }

  insertTodo(String title, String? body) async {
    var currentTime = DateTime.now();

    int success = await _database.insertTodo(
      title,
      body,
      Status.pending,
      currentTime,
      currentTime,
    );
    debugPrint('Insert todo: $success');
  }

  updateTodo(
    String title,
    String? body,
    Status status,
    int id,
  ) async {
    int success = await _database.updateTodoById(
      title,
      body,
      status,
      DateTime.now(),
      id,
    );
    debugPrint('Update todo: $success');
  }

  deleteTodo(int id) async {
    await _database.deleteTodoById(id);
  }
}
