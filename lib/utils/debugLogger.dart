class DebugLogger {
  static final DebugLogger _instance = DebugLogger._internal();

  factory DebugLogger() => _instance;

  DebugLogger._internal();

  final List<String> _logs = [];

  void log(String message) {
    final timestamp = DateTime.now().toIso8601String();

    _logs.add("[$timestamp] $message");
  }

  List<String> get logs => _logs;
}
