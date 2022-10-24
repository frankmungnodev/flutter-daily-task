import 'package:flutter/material.dart';

enum Status { pending, ongoing, done }

const status = [Status.done, Status.ongoing, Status.pending];

extension StatusExtensions on Status {
  String get displayName {
    switch (this) {
      case Status.pending:
        return "Pending";
      case Status.ongoing:
        return "Ongoing";
      case Status.done:
        return "Done";
      default:
        return "Pending";
    }
  }

  int get getInteger {
    switch (this) {
      case Status.pending:
        return 0;
      case Status.ongoing:
        return 1;
      case Status.done:
        return 2;
      default:
        return 0;
    }
  }

  Color get color {
    switch (this) {
      case Status.pending:
        return Colors.green;
      case Status.ongoing:
        return Colors.blue;
      case Status.done:
        return Colors.red;
    }
  }

  static Status getPriorityFromInt(int priority) {
    switch (priority) {
      case 0:
        return Status.pending;
      case 1:
        return Status.ongoing;
      case 2:
        return Status.done;
      default:
        return Status.pending;
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
