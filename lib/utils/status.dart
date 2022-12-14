enum Status { pending, ongoing, pause, done }

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
}
