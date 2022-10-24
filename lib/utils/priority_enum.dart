import 'package:flutter/material.dart';

enum Priority { low, normal, high }

const priorities = [Priority.high, Priority.normal, Priority.low];

extension PriorityExtensions on Priority {
  String get displayName {
    switch (this) {
      case Priority.low:
        return "Low";
      case Priority.normal:
        return "Normal";
      case Priority.high:
        return "High";
      default:
        return "Low";
    }
  }

  int get getInteger {
    switch (this) {
      case Priority.low:
        return 0;
      case Priority.normal:
        return 1;
      case Priority.high:
        return 2;
      default:
        return 0;
    }
  }

  Color get color {
    switch (this) {
      case Priority.low:
        return Colors.green;
      case Priority.normal:
        return Colors.blue;
      case Priority.high:
        return Colors.red;
    }
  }

  static Priority getPriorityFromInt(int priority) {
    switch (priority) {
      case 0:
        return Priority.low;
      case 1:
        return Priority.normal;
      case 2:
        return Priority.high;
      default:
        return Priority.low;
    }
  }

  static Color getColorFromInt(int priority) {
    switch (priority) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.red;
      default:
        return Colors.green;
    }
  }
}
