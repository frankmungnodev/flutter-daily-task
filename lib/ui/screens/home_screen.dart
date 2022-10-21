import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/home_controller.dart';
import 'package:todo_list/ui/components/todo_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(
          (() => ListView(
                clipBehavior: Clip.none,
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 32),
                    child: Text(
                      'Todos',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  ...controller.todosItem.map(
                    (todo) => TodoItem(
                      todo: todo,
                      deleteTodo: controller.deleteTodo,
                    ),
                  ),
                ],
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => controller.insertTodo()),
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
