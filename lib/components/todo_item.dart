import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/database/database.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;
  final void Function(int id) deleteTodo;
  const TodoItem({Key? key, required this.todo, required this.deleteTodo})
      : super(key: key);

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
            TodoMinimize(
              todo: widget.todo,
              showBody: _showBody,
            ),
            TodoExpanded(
              todo: widget.todo,
              showBody: _showBody,
              deleteTodo: () => widget.deleteTodo(widget.todo.id),
            ),
          ],
        ),
      ),
    );
  }
}

// Minimized State
class TodoMinimize extends StatefulWidget {
  final Todo todo;
  final bool showBody;
  const TodoMinimize({
    Key? key,
    required this.todo,
    required this.showBody,
  }) : super(key: key);

  @override
  TodoMinimizeState createState() => TodoMinimizeState();
}

class TodoMinimizeState extends State<TodoMinimize> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
            onPressed: () => {},
            icon: Icon(
              widget.showBody
                  ? CupertinoIcons.chevron_up
                  : CupertinoIcons.chevron_down,
            ),
          ),
        )
      ],
    );
  }
}

// Expanded state
class TodoExpanded extends StatefulWidget {
  final Todo todo;
  final bool showBody;
  final void Function() deleteTodo;
  const TodoExpanded({
    Key? key,
    required this.todo,
    required this.showBody,
    required this.deleteTodo,
  }) : super(key: key);

  @override
  TodoExpandedState createState() => TodoExpandedState();
}

class TodoExpandedState extends State<TodoExpanded> {
  @override
  Widget build(BuildContext context) {
    return widget.showBody
        ? Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(16),
                child: Text(
                  widget.todo.body ?? '',
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
                      onPressed: () => {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Delete'),
                            content: const Text('Confirm to delete this todo?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  widget.deleteTodo();
                                  Navigator.pop(context, 'Confirm');
                                },
                                child: const Text('Confirm'),
                              ),
                            ],
                          ),
                        ),
                      },
                      child: const Text('Delete'),
                    )
                  ],
                ),
              )
            ],
          )
        : const Center();
  }
}
