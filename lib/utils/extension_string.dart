extension StringExtension on String {
  int get minutesToMillis => Duration(minutes: int.parse(this)).inMilliseconds;
}
