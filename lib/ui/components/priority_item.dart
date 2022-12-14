import 'package:flutter/material.dart';

import '../../utils/priority.dart';

class PriorityItem extends StatelessWidget {
  final Priority priority;
  final bool selected;
  final void Function() onClick;

  const PriorityItem({
    super.key,
    required this.priority,
    this.selected = false,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: selected ? priority.color : Colors.transparent,
            )),
        child: InkWell(
          onTap: onClick,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              priority.displayText,
              style: selected
                  ? TextStyle(
                      color: priority.color,
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
