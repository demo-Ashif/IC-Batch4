import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  try {
    // This may throw if file does not exist
    final text = await File('numbers.json').readAsString();

    // Specific exception type first
    final data = jsonDecode(text); // FormatException if JSON is bad
    print('Decoded: $data');
  } on FormatException catch (e) {
    // handle specific exception
    print('JSON problem: ${e.message}');
  } on FileSystemException catch (e) {
    // handle specific exception
    print('File problem: ${e.message}');
  } catch (e, st) {
    // any other exception
    print('Something else failed: $e');
    print(st);
  } finally {
    print('Always runs (cleanup, close files, etc.)');
  }
}
