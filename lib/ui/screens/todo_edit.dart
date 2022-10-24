import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/todo_edit_controller.dart';
import 'package:todo_list/ui/components/priority_item.dart';

import '../../utils/status_enum.dart';

class TodoEditScreen extends StatelessWidget {
  TodoEditScreen({Key? key}) : super(key: key);

  final controller = Get.put(TodoEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.id == null ? 'New Todo' : 'Edit Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.validate(),
        child: const Icon(CupertinoIcons.check_mark),
      ),
      body: Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView(
            children: [
              TextFormField(
                controller: controller.titleController,
                autofocus: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  label: Text('Title'),
                  hintText: 'Learn English',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title cannot be empty!';
                  } else if (value.length < 3) {
                    return 'Title cannot be less than 3 characters!';
                  }
                  return null;
                },
              ),
              TextField(
                controller: controller.bodyController,
                autofocus: true,
                minLines: 4,
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  label: Text('Body'),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(top: 16),
                      child: Text(
                        'Priorities:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...status.map(
                              (priority) => PriorityItem(
                                priority: priority,
                                selected: controller.priority == priority,
                                onClick: () => controller.setPriority(priority),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
