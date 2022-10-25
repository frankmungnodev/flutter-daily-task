import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/home_screen_controller.dart';
import 'package:todo_list/database/database.dart';
import 'package:todo_list/ui/models/todo_statics.dart';
import 'package:todo_list/ui/routing.dart';

import '../../utils/status_enum.dart';

class TodoItem extends StatelessWidget {
  final TodoStatics todoStatics;

  TodoItem({
    Key? key,
    required this.todoStatics,
  }) : super(key: key);

  final controller = Get.find<HomeScreenController>();

  _toggleExpand() {
    controller.toggleExpand(todoStatics.todo.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: _toggleExpand,
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VerticalDivider(
                indent: 5,
                endIndent: 5,
                thickness: 1,
                color: todoStatics.static?.status.color,
              ),
              Expanded(
                child: Column(
                  children: [
                    TodoCollapsed(
                      todo: todoStatics.todo,
                      toggleExpand: _toggleExpand,
                    ),
                    TodoExpanded(
                      todo: todoStatics.todo,
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
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '${0}/${todo.minutes} Minutes',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          IconButton(
            onPressed: () => toggleExpand(),
            icon: Obx(
              () => Icon(
                (controller.expandedTodo != null &&
                        controller.expandedTodo == todo.id)
                    ? CupertinoIcons.chevron_up
                    : CupertinoIcons.chevron_down,
              ),
            ),
          )
        ],
      ),
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
      (() => (_homeController.expandedTodo != null &&
              _homeController.expandedTodo == todo.id)
          ? Column(
              children: [
                todo.body != null && todo.body!.isNotEmpty
                    ? Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text(
                          todo.body!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )
                    : const Center(),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        // var status = todo.status == Status.pending
                        //     ? Status.ongoing
                        //     : todo.status == Status.ongoing
                        //         ? Status.pause
                        //         : Status.ongoing;
                        _homeController.setStatus(
                          Status.done,
                          todo.id,
                        );
                      },
                      child: Text('Start'),
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
              ],
            )
          : const Center()),
    );
  }
}
