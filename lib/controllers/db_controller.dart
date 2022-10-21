import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../database/database.dart';

class DBController extends GetxController {
  final _database = Get.put(MDatabase());

  Stream<List<Todo>> getAllTodos() {
    return _database.getAllTodos().watch();
  }

  insertTodo(String title, String? body, int category) async {
    int success = await _database.insertTodo(
      title,
      body,
      category,
      DateTime.now().millisecondsSinceEpoch,
    );
    debugPrint('Insert state: $success');
  }

  deleteTodo(int id) async {
    _database.deleteTodoById(id);
  }
}
