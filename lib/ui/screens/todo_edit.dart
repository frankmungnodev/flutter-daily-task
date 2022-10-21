import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/todo_edit_controller.dart';

class TodoEditScreen extends StatelessWidget {
  TodoEditScreen({Key? key}) : super(key: key);

  final id = Get.arguments;
  final controller = Get.put(TodoEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(id == null ? 'New Todo' : 'Edit Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(CupertinoIcons.check_mark),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView(
          children: [
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                label: Text('Title'),
                hintText: 'Learn English',
              ),
              onChanged: ((value) => controller.onChangeTitle(value)),
              validator: (value) {
                if (value == null) {
                  return 'Title cannot be empty!';
                }
                if (value.isEmpty) {
                  return 'Title cannot be empty!';
                }
                if (value.length < 3) {
                  return 'Title cannot be less than 3 characters!';
                }
                return null;
              },
            ),
            TextField(
              autofocus: true,
              minLines: 4,
              maxLines: 4,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                label: Text('Body'),
              ),
              enabled: controller.title.toString().length > 3,
            ),
          ],
        ),
      ),
    );
  }
}
