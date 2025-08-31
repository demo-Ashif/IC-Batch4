// 09_custom_exception.dart
class EmptyNoteException implements Exception {
  final String message;
  EmptyNoteException([this.message = 'Note cannot be empty']);
  @override
  String toString() => 'EmptyNoteException: $message';
}

Future<void> saveNote(String title, String text) async {
  if (text.trim().isEmpty) {
    throw EmptyNoteException();
  }
  // pretend we saved it somewhere…
  // in this simple example we just print
  print('Saved: "$title" = "$text"');
}

Future<void> main() async {
  try {
    await saveNote('todo', '  '); // will throw
  } catch (e) {
    print('Caught: $e');
  }
}
