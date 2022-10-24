import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/db_controller.dart';

import '../database/database.dart';
import '../utils/status_enum.dart';

class TodoEditController extends GetxController {
  final _dbController = Get.find<DBController>();

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final _priority = Status.pending.obs;
  get priority => _priority;

  final formKey = GlobalKey<FormState>();

  final id = Get.arguments;
  Todo? _todo;

  @override
  onInit() {
    if (id != null) {
      _getTodoById();
    }
    super.onInit();
  }

  _getTodoById() {
    _dbController.getTodoById(id).then((todo) {
      _todo = todo;
      titleController.text = todo.title;
      bodyController.text = todo.body ?? '';
      _priority.value = StatusExtensions.getPriorityFromInt(todo.priority);
    });
  }

  setPriority(Status priority) {
    _priority.value = priority;
  }

  validate() {
    if (formKey.currentState!.validate()) {
      if (_todo != null) {
        _dbController.updateTodo(
          titleController.text,
          bodyController.text,
          _priority.value.getInteger,
          _todo!.id,
        );
      } else {
        _dbController.insertTodo(
          titleController.text,
          bodyController.text,
          _priority.value.getInteger,
        );
      }
      Get.back();
    }
  }
}
