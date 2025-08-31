// 00_hello_async.dart
//
// LEARNING OBJECTIVE: Understanding async main function
//
// WHY ASYNC MAIN?
// - Most file operations in Dart are asynchronous (they take time to complete)
// - We use 'async' to tell Dart "this function will wait for operations to finish"
// - 'Future<void>' means "this function returns a Future that completes with no value"
// - 'await' pauses execution until an operation completes

Future<void> main() async {
  // This is an async main function - notice the 'async' keyword
  // It allows us to use 'await' inside the function

  print('Hello, async Dart!');

  // Simulate a small delay to show async behavior
  // In real programs, this would be file reading, network calls, etc.
  await Future.delayed(Duration(milliseconds: 500));

  print('This message appears after a 500ms delay');
  print('Async programming allows us to wait for operations to complete!');
}

// EXPLANATION OF KEYWORDS:
// - Future<void>: A "promise" that will complete in the future with no return value
// - async: Marks this function as asynchronous
// - await: Pauses execution until the awaited operation completes
// - Duration(milliseconds: 500): Creates a 500-millisecond delay
