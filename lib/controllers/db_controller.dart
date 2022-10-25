import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/utils/status_enum.dart';

import '../database/database.dart';

class DBController extends GetxController {
  final _database = Get.find<MDatabase>();
  late final Todos todos;
  late final Statistics statics;

  @override
  onInit() {
    super.onInit();
    todos = _database.todos;
    statics = _database.statistics;
  }

  Stream<List<TypedResult>> getTodoStatics() {
    return _database.select(todos).join(
      [
        leftOuterJoin(
          statics,
          todos.id.equalsExp(statics.todoId),
        ),
      ],
    ).watch();
  }

  Future<Todo> getTodoById(int id) async {
    return await _database.getTodoById(id).getSingle();
  }

  insertTodo(String title, String? body, int minutes) async {
    var currentTime = DateTime.now();

    int success = await _database.insertTodo(
      title,
      body,
      minutes,
      currentTime,
      currentTime,
    );
    debugPrint('Insert todo: $success');
  }

  updateTodo(
    String title,
    String? body,
    int minutes,
    int id,
  ) async {
    int success = await _database.updateTodoById(
      title,
      body,
      minutes,
      DateTime.now(),
      id,
    );
    debugPrint('Update todo: $success');
  }

  updateTodoStatus(Status status, int id) async {
    // int success = await _database.updateTodoStatus(status, id);
    // debugPrint('Update todo status: $success');
  }

  deleteTodo(int id) async {
    await _database.deleteTodoById(id);
  }
}
