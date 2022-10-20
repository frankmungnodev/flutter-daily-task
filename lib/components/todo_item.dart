import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/database/database.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;
  const TodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  TodoItemState createState() => TodoItemState();
}

class TodoItemState extends State<TodoItem> {
  bool _showBody = false;

  _toggleShowBody() {
    setState(() {
      _showBody = !_showBody;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () => _toggleShowBody(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.todo.id}. ',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        widget.todo.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: IconButton(
                    onPressed: () => _toggleShowBody(),
                    icon: Icon(
                      _showBody
                          ? CupertinoIcons.chevron_up
                          : CupertinoIcons.chevron_down,
                    ),
                  ),
                )
              ],
            ),
            _showBody
                ? Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      widget.todo.body ?? '',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                : const Center()
          ],
        ),
      ),
    );
  }
}
