import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/home_screen_controller.dart';
import 'package:todo_list/database/database.dart';
import 'package:todo_list/ui/routing.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  TodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final controller = Get.find<HomeScreenController>();

  _toggleExpand() {
    controller.toggleExpand(todo.id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: _toggleExpand,
        child: Column(
          children: [
            TodoCollapsed(
              todo: todo,
              toggleExpand: _toggleExpand,
            ),
            TodoExpanded(
              todo: todo,
            ),
          ],
        ),
      ),
    );
  }
}

// Minimized State
class TodoCollapsed extends StatelessWidget {
  final Todo todo;
  final void Function() toggleExpand;

  TodoCollapsed({
    Key? key,
    required this.todo,
    required this.toggleExpand,
  }) : super(key: key);

  final controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text(
            todo.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: IconButton(
            onPressed: () => toggleExpand(),
            icon: Obx(
              () => Icon(
                (controller.expandedTodos).contains(todo.id)
                    ? CupertinoIcons.chevron_up
                    : CupertinoIcons.chevron_down,
              ),
            ),
          ),
        )
      ],
    );
  }
}

// Expanded state
class TodoExpanded extends StatelessWidget {
  final Todo todo;

  TodoExpanded({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final _homeController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => (_homeController.expandedTodos).contains(todo.id)
          ? Column(
              children: [
                todo.body != null && todo.body!.isNotEmpty
                    ? Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          todo.body!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )
                    : const Center(),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () => {},
                        child: const Text('Start'),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(
                          MRouting.todoEdit,
                          arguments: todo.id,
                        ),
                        child: const Text('Edit'),
                      ),
                      TextButton(
                        onPressed: () => {
                          Get.defaultDialog(
                            title: 'Delete',
                            middleText: 'Confirm to delete ${todo.title}?',
                            cancel: TextButton(
                              onPressed: () => Get.back(),
                              child: const Text('Cancel'),
                            ),
                            confirm: TextButton(
                              onPressed: () {
                                _homeController.deleteTodo(todo.id);
                                Get.back();
                              },
                              child: const Text('Confrim'),
                            ),
                          )
                        },
                        child: const Text('Delete'),
                      )
                    ],
                  ),
                )
              ],
            )
          : const Center()),
    );
  }
}
