// 04_paths.dart
//
// LEARNING OBJECTIVE: Working with file paths across different operating systems
//
// WHAT WE'LL LEARN:
// - How to get the current working directory
// - How to build file paths that work on any operating system
// - Understanding Platform.pathSeparator
// - Creating a simple path joining function
// - Why we need to handle paths carefully

import 'dart:io';

// CUSTOM PATH JOINING FUNCTION
// This function joins two path parts using the correct separator for the current OS
// It handles cases where the first part might already end with a separator
String joinPath(String a, String b) {
  // If 'a' already ends with the path separator, just concatenate
  // Otherwise, add the separator between 'a' and 'b'
  if (a.endsWith(Platform.pathSeparator)) {
    return '$a$b';
  } else {
    return '$a${Platform.pathSeparator}$b';
  }
}

Future<void> main() async {
  print('🛤️  Path Handling Demo');
  print('=' * 40);
  
  // STEP 1: UNDERSTAND THE CURRENT WORKING DIRECTORY
  // Directory.current.path gives us the folder where the program is running
  final base = Directory.current.path;
  print('📍 Current working directory:');
  print('  $base');
  
  // STEP 2: SHOW THE PATH SEPARATOR FOR THIS OPERATING SYSTEM
  // Platform.pathSeparator is different on different operating systems
  print('\n🔧 Path separator for this OS:');
  print('  Windows: \\ (backslash)');
  print('  Mac/Linux: / (forward slash)');
  print('  Current OS uses: "${Platform.pathSeparator}"');
  
  // STEP 3: BUILD A FILE PATH USING OUR CUSTOM FUNCTION
  // This creates a path that works on any operating system
  final filePath = joinPath(base, 'demo.txt');
  print('\n📁 File path created:');
  print('  $filePath');
  
  // STEP 4: CREATE AND WRITE TO THE FILE
  // This demonstrates that our path works correctly
  final file = File(filePath);
  final content = '''
This file was created using Platform.pathSeparator = "${Platform.pathSeparator}"

The path was built by joining:
- Base directory: $base
- File name: demo.txt
- Result: $filePath

This approach ensures the path works on any operating system!
''';
  
  await file.writeAsString(content);
  print('✓ Created file at: ${file.path}');
  
  // STEP 5: VERIFY THE FILE EXISTS AND SHOW ITS CONTENT
  if (await file.exists()) {
    print('\n📖 File content:');
    print('─' * 50);
    final fileContent = await file.readAsString();
    print(fileContent);
    print('─' * 50);
    
    // Show file statistics
    final stat = await file.stat();
    print('\n📊 File details:');
    print('  Size: ${stat.size} bytes');
    print('  Created: ${stat.changed}');
  }
  
  // STEP 6: DEMONSTRATE PATH MANIPULATION
  print('\n🔍 Path manipulation examples:');
  
  // Split a path into its components
  final pathParts = filePath.split(Platform.pathSeparator);
  print('  Path parts: $pathParts');
  
  // Get just the filename
  final fileName = pathParts.last;
  print('  Filename: $fileName');
  
  // Get the directory containing the file
  final parentDir = pathParts.take(pathParts.length - 1).join(Platform.pathSeparator);
  print('  Parent directory: $parentDir');
  
  // STEP 7: CLEAN UP
  print('\n🧹 Cleaning up...');
  await file.delete();
  print('✓ Deleted demo file');
  
  print('\n🎉 Path handling demo completed successfully!');
}

// EXPLANATION OF KEY CONCEPTS:
//
// Directory.current.path:
//   - Returns the current working directory as a String
//   - This is where your program is running from
//   - Example: "/Users/username/projects/dart_demo"
//
// Platform.pathSeparator:
//   - A constant that gives the correct path separator for the current OS
//   - Windows: "\" (backslash)
//   - Mac/Linux: "/" (forward slash)
//   - This makes your code portable across different operating systems
//
// joinPath() function:
//   - Combines two path parts with the correct separator
//   - Handles cases where the first part might already end with a separator
//   - This prevents double separators like "folder//file.txt"
//
// path.split(Platform.pathSeparator):
//   - Breaks a path into its individual components
//   - Useful for extracting filenames, parent directories, etc.
//
// path.take(n).join(separator):
//   - Takes the first 'n' parts of a path and joins them back together
//   - Useful for getting parent directories
//
// WHY THIS MATTERS:
//   - Windows uses backslashes, Mac/Linux use forward slashes
//   - Hard-coding separators makes your code break on different operating systems
//   - Using Platform.pathSeparator makes your code work everywhere
//   - For more complex path operations, you'd use the 'path' package
