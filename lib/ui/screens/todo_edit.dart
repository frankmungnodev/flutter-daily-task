import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/todo_edit_controller.dart';
import 'package:todo_list/ui/components/priority_item.dart';
import 'package:todo_list/utils/priority.dart';

class TodoEditScreen extends StatelessWidget {
  TodoEditScreen({Key? key}) : super(key: key);

  final _controller = Get.put(TodoEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_controller.id == null ? 'New Todo' : 'Edit Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.validate(),
        child: const Icon(CupertinoIcons.check_mark),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Form(
            key: _controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _controller.titleController,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      label: Text('Title'),
                      hintText: 'Learn English',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Title cannot be empty.';
                      } else if (value.length < 3) {
                        return 'Title cannot be less than 3 characters.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _controller.durationController,
                    maxLines: 1,
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      label: Text('Minutes'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Minutes cannot be empty.';
                      } else {
                        var minutes = int.tryParse(value);
                        if (minutes is! int) {
                          return "Minutes cannot contains decimal.";
                        } else if (minutes <= 0) {
                          return "Minutes cannot be less than 1.";
                        }
                      }
                      return null;
                    },
                  ),
                  TextField(
                    controller: _controller.bodyController,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      label: Text('Body'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 32,
                      bottom: 8,
                    ),
                    child: const Text('Priority:'),
                  ),
                  Row(
                    children: [
                      ...Priority.values.map(
                        (priority) => Obx(
                          () => PriorityItem(
                            priority: priority,
                            selected: _controller.priority.value == priority,
                            onClick: () => _controller.onSelectPriority(
                              priority: priority,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
