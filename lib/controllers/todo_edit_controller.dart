import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/db_controller.dart';

class TodoEditController extends GetxController {
  final _dbController = Get.find<DBController>();

  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  validate() {
    if (formKey.currentState!.validate()) {
      _dbController.insertTodo(titleController.text, bodyController.text, 0);
      Get.back();
    }
  }
}
