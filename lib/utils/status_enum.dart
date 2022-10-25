import 'package:flutter/material.dart';

enum Status { pending, ongoing, pause, done }

const status = [Status.done, Status.ongoing, Status.pause, Status.pending];

extension StatusExtensions on Status {
  String get displayName {
    switch (this) {
      case Status.ongoing:
        return "Ongoing";
      case Status.pause:
        return "Pause";
      case Status.done:
        return "Done";
      default:
        return "Pending";
    }
  }

  int get getValue {
    switch (this) {
      case Status.pending:
        return 0;
      case Status.ongoing:
        return 1;
      case Status.pause:
        return 2;
      case Status.done:
        return 3;
      default:
        return 0;
    }
  }

  Color get color {
    switch (this) {
      case Status.pending:
        return Colors.grey;
      case Status.ongoing:
        return Colors.blue;
      case Status.pause:
        return Colors.red;
      case Status.done:
        return Colors.green;
    }
  }

  String get buttonText {
    switch (this) {
      case Status.pending:
        return "Start";
      case Status.ongoing:
        return "Pause";
      case Status.pause:
        return "Resume";
      case Status.done:
        return "Restart";
    }
  }

  static Status getFromValue(int value) {
    switch (value) {
      case 0:
        return Status.pending;
      case 1:
        return Status.ongoing;
      case 2:
        return Status.pause;
      case 3:
        return Status.done;
      default:
        return Status.pending;
    }
  }

  static Color getColorFromValue(int value) {
    var status = getFromValue(value);
    return status.color;
  }
}
