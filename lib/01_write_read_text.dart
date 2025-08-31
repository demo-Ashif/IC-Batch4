// 01_write_read_text.dart
//
// LEARNING OBJECTIVE: Basic file reading and writing operations
//
// WHAT WE'LL LEARN:
// - How to create a File object
// - How to write text to a file
// - How to append text to a file
// - How to read the entire file content
// - Understanding FileMode options

import 'dart:io';

Future<void> main() async {
  // Create a File object - this doesn't create the file yet, just represents it
  // The file will be created in the current working directory
  final file = File('hello.txt');
  
  print('Working with file: ${file.path}');
  print('Current directory: ${Directory.current.path}');
  
  // WRITING TO A FILE
  // writeAsString() creates the file if it doesn't exist, or overwrites if it does
  // This is like opening a new notebook and writing on the first page
  await file.writeAsString('Hello, world!\n');
  print('✓ Wrote "Hello, world!" to the file');
  
  // APPENDING TO A FILE
  // FileMode.append adds new content without deleting existing content
  // This is like adding a new page to your notebook
  await file.writeAsString('Second line\n', mode: FileMode.append);
  print('✓ Appended "Second line" to the file');
  
  // APPENDING MORE CONTENT
  await file.writeAsString('Third line\n', mode: FileMode.append);
  print('✓ Appended "Third line" to the file');
  
  // READING FROM A FILE
  // readAsString() reads the entire file content as a single String
  // This is like reading your entire notebook from start to finish
  final content = await file.readAsString();
  print('\n📖 File content:');
  print('─' * 30);
  print(content);
  print('─' * 30);
  
  // FILE INFORMATION
  // Check if the file exists and get its size
  if (await file.exists()) {
    final stat = await file.stat();
    print('\n📊 File details:');
    print('  Path: ${file.path}');
    print('  Size: ${stat.size} bytes');
    print('  Created: ${stat.changed}');
    print('  Modified: ${stat.modified}');
  }
}

// EXPLANATION OF KEY CONCEPTS:
//
// File('hello.txt'):
//   - Creates a File object representing 'hello.txt' in the current directory
//   - The file doesn't exist yet until we write to it
//
// writeAsString():
//   - Creates the file if it doesn't exist
//   - Writes the specified text to the file
//   - If the file already exists, it overwrites the content by default
//
// FileMode.append:
//   - Adds new content to the end of existing content
//   - Doesn't delete what's already in the file
//   - Useful for log files, notes, etc.
//
// readAsString():
//   - Reads the entire file content as a String
//   - Good for small files
//   - For large files, we'll learn about streams later
//
// file.stat():
//   - Gets information about the file (size, dates, etc.)
//   - Useful for understanding what's in your file
