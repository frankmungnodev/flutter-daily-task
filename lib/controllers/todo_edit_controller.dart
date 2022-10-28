import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/utils/extensions.dart';
import '../database/database.dart';
import '../utils/priority.dart';

class TodoEditController extends GetxController {
  final _database = Get.find<MDatabase>();

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final durationController = TextEditingController(text: '5');
  final _priority = Priority.low.obs;
  Rx<Priority> get priority => _priority;

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
    durationController.text = Duration(
      milliseconds: _todo?.duration ?? 0,
    ).inMinutes.toString();
    _priority.value = _todo?.priority.value ?? Priority.low;
  }

  onSelectPriority({required Priority priority}) {
    _priority.value = priority;
  }

  validate() {
    if (formKey.currentState!.validate()) {
      final title = titleController.text;
      final body = bodyController.text;
      final currentTime = DateTime.now();
      final duration = Duration(
        minutes: int.parse(
          durationController.text,
        ),
      ).inMilliseconds;

      if (_todo != null) {
        _database.updateTodoById(
          title,
          body,
          duration,
          _priority.value.value,
          currentTime,
          _todo!.id,
        );
      } else {
        _database.insertTodo(
          title,
          body,
          duration,
          _priority.value.value,
          currentTime,
          currentTime,
        );
      }
      Get.back();
    }
  }
}
