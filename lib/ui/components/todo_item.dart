import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/todo_controller.dart';
import 'package:todo_list/database/database.dart';
import 'package:todo_list/ui/screens/todo_screen.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final void Function(int id) deleteTodo;

  TodoItem({
    Key? key,
    required this.todo,
    required this.deleteTodo,
  }) : super(key: key);

  final TodoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () => controller.toggleExpand(todo.id),
        child: Column(
          children: [
            TodoCollapsed(
              todo: todo,
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
  const TodoCollapsed({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoController controller = Get.find();

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
            onPressed: () => controller.toggleExpand(todo.id),
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

  const TodoExpanded({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoController controller = Get.find();

    return Obx(
      (() => (controller.expandedTodos).contains(todo.id)
          ? Column(
              children: [
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    todo.body ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
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
                        onPressed: () => {},
                        child: const Text('Mark as Done'),
                      ),
                      TextButton(
                        onPressed: () => Get.to(
                          TodoScreen(
                            id: todo.id,
                          ),
                        ),
                        child: const Text('Edit'),
                      ),
                      TextButton(
                        onPressed: () => {
                          Get.defaultDialog(
                            title: 'Delete',
                            middleText: 'Confirm to delete this ${todo.title}?',
                            cancel: TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('Cancel'),
                            ),
                            confirm: TextButton(
                              onPressed: () {
                                controller.deleteTodo(todo.id);
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
