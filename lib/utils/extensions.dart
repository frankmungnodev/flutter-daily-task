import 'package:flutter/material.dart';
import 'package:todo_list/utils/priority.dart';

extension IntegerExtension on int {
  Priority get value {
    switch (this) {
      case 1:
        return Priority.low;
      case 2:
        return Priority.medium;
      case 3:
        return Priority.high;
      default:
        return Priority.low;
    }
  }

  Color get priorityColor {
    return value.color;
  }
}
