import 'dart:developer';

class Logger{
  static void write(String text, {bool isError = false}) {
    Future<void>.microtask(() => log('** $text. isError: [$isError] **'));
  }
}