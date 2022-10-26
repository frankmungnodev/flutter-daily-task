import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../database/database.dart';

class TodoEditController extends GetxController {
  final _database = Get.find<MDatabase>();

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final minutesController = TextEditingController(text: '5');

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

  _getTodoById() async {
    _todo = await _database.getTodoById(id).getSingle();
    titleController.text = _todo?.title ?? '';
    bodyController.text = _todo?.body ?? '';
    minutesController.text = _todo?.minutes.toString() ?? '0';
  }

  validate() {
    if (formKey.currentState!.validate()) {
      var currentTime = DateTime.now();
      if (_todo != null) {
        _database.updateTodoById(
          titleController.text,
          bodyController.text,
          int.parse(minutesController.text),
          currentTime,
          _todo!.id,
        );
      } else {
        _database.insertTodo(
          titleController.text,
          bodyController.text,
          int.parse(minutesController.text),
          currentTime,
          currentTime,
        );
      }
      Get.back();
    }
  }
}
