import 'package:flutter/material.dart';

enum Priority { high, medium, low }

extension PriorityExtension on Priority {
  int get value {
    switch (this) {
      case Priority.high:
        return 3;
      case Priority.medium:
        return 2;
      case Priority.low:
        return 1;
    }
  }

  String get displayText {
    switch (this) {
      case Priority.high:
        return "High";
      case Priority.medium:
        return "Medium";
      case Priority.low:
        return "Low";
    }
  }

  Color get color {
    switch (this) {
      case Priority.high:
        return Colors.red;
      case Priority.medium:
        return Colors.blue;
      case Priority.low:
        return Colors.green;
    }
  }
}
