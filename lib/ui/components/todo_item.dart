import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/home_screen_controller.dart';
import 'package:todo_list/database/database.dart';
import 'package:todo_list/ui/routing.dart';
import 'package:todo_list/utils/extension_todo_with_statis.dart';

class TodoItem extends StatelessWidget {
  final TodosWithStatisticResult todoWithStatis;

  TodoItem({
    Key? key,
    required this.todoWithStatis,
  }) : super(key: key);

  final controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    final todo = todoWithStatis.todo;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () => controller.toggleExpand(todo.id),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VerticalDivider(
                indent: 5,
                endIndent: 5,
                thickness: 3,
                color: todoWithStatis.priorityColor,
              ),
              Expanded(
                child: Column(
                  children: [
                    TodoCollapsed(
                      todoWithStatis: todoWithStatis,
                    ),
                    TodoExpanded(
                      todoWithStatis: todoWithStatis,
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
  final TodosWithStatisticResult todoWithStatis;

  TodoCollapsed({
    Key? key,
    required this.todoWithStatis,
  }) : super(key: key);

  final _controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    final todo = todoWithStatis.todo;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
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
                '${todoWithStatis.progressInMinutes}/${todoWithStatis.totalInMinutes} Minutes',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              _controller.setStatus(todoWithStatistic: todoWithStatis);
            },
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Icon(todoWithStatis.icon),
                CircularProgressIndicator(
                  value: todoWithStatis.progressPercent,
                  semanticsLabel: "${todo.title}'s progress",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Expanded state
class TodoExpanded extends StatelessWidget {
  final TodosWithStatisticResult todoWithStatis;

  TodoExpanded({
    Key? key,
    required this.todoWithStatis,
  }) : super(key: key);

  final _controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    final todo = todoWithStatis.todo;
    final expandedTodo = _controller.expandedTodo;

    return Obx(
      (() => (expandedTodo != null && expandedTodo == todo.id)
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
                      onPressed: () => Get.toNamed(
                        MRouting.todoEdit,
                        arguments: todo.id,
                      ),
                      child: const Text('Edit'),
                    ),
                    TextButton(
                      onPressed: () => _controller.deleteTodo(
                        todo: todo,
                        statisticId: todoWithStatis.statistic?.id,
                      ),
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
