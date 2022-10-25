import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/db_controller.dart';

import '../database/database.dart';
import '../utils/status_enum.dart';

class TodoEditController extends GetxController {
  final _dbController = Get.find<DBController>();

  final titleController = TextEditingController();
  final bodyController = TextEditingController();

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
    });
  }

  validate() {
    if (formKey.currentState!.validate()) {
      if (_todo != null) {
        _dbController.updateTodo(
          titleController.text,
          bodyController.text,
          _todo!.status,
          _todo!.id,
        );
      } else {
        _dbController.insertTodo(
          titleController.text,
          bodyController.text,
          Status.pending.getValue,
        );
      }
      Get.back();
    }
  }
}
