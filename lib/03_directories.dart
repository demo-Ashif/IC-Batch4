// 03_directories.dart
//
// LEARNING OBJECTIVE: Working with directories and folders
//
// WHAT WE'LL LEARN:
// - How to create directories (including nested ones)
// - How to list directory contents
// - Understanding recursive vs non-recursive listing
// - How to delete directories and their contents
// - Working with file system entities

import 'dart:io';

Future<void> main() async {
  print('📁 Directory Operations Demo');
  print('=' * 40);
  
  // STEP 1: CREATE A NESTED DIRECTORY STRUCTURE
  // Directory('my_data/images') creates a path like 'my_data/images'
  // recursive: true means "create parent directories if they don't exist"
  final dir = Directory('my_data/images');
  
  try {
    await dir.create(recursive: true);
    print('✓ Created directory: ${dir.path}');
    print('  Note: This created both "my_data" and "my_data/images" folders');
  } catch (e) {
    print('❌ Failed to create directory: $e');
    return;
  }
  
  // STEP 2: CREATE SOME FILES INSIDE THE DIRECTORY
  // We'll create files in different subdirectories to demonstrate structure
  final fileA = File('${dir.path}/a.txt');
  final fileB = File('${dir.path}/b.txt');
  final fileC = File('my_data/readme.txt');
  
  await fileA.writeAsString('This is file A');
  await fileB.writeAsString('This is file B');
  await fileC.writeAsString('This is a readme file');
  
  print('✓ Created sample files in the directory structure');
  
  // STEP 3: LIST DIRECTORY CONTENTS (NON-RECURSIVE)
  // Non-recursive means "only show items in this folder, not in subfolders"
  print('\n📋 Listing contents of "my_data" (non-recursive):');
  print('─' * 50);
  
  await for (final entity in Directory('my_data').list()) {
    // entity.runtimeType tells us if it's a File, Directory, or Link
    // entity.path gives us the full path to the item
    final type = entity.runtimeType.toString().replaceAll('_', '');
    final name = entity.path.split(Platform.pathSeparator).last;
    print('  📄 $type: $name');
  }
  
  // STEP 4: LIST DIRECTORY CONTENTS (RECURSIVE)
  // Recursive means "show items in this folder AND all subfolders"
  print('\n📋 Listing contents of "my_data" (recursive):');
  print('─' * 50);
  
  await for (final entity in Directory('my_data').list(recursive: true)) {
    final type = entity.runtimeType.toString().replaceAll('_', '');
    // Get relative path from my_data folder
    final relativePath = entity.path.replaceFirst('${Directory.current.path}${Platform.pathSeparator}my_data${Platform.pathSeparator}', '');
    print('  📄 $type: $relativePath');
  }
  
  // STEP 5: SHOW DIRECTORY STRUCTURE VISUALLY
  print('\n🌳 Directory Structure:');
  print('my_data/');
  print('├── readme.txt');
  print('└── images/');
  print('    ├── a.txt');
  print('    └── b.txt');
  
  // STEP 6: CLEAN UP - DELETE THE ENTIRE DIRECTORY TREE
  // recursive: true means "delete this folder AND everything inside it"
  print('\n🧹 Cleaning up...');
  await Directory('my_data').delete(recursive: true);
  print('✓ Deleted my_data/ and all its contents');
  
  // Verify deletion
  final exists = await Directory('my_data').exists();
  print('  my_data folder still exists? $exists');
  
  print('\n🎉 Directory operations completed successfully!');
}

// EXPLANATION OF KEY CONCEPTS:
//
// Directory('my_data/images'):
//   - Creates a Directory object representing the path 'my_data/images'
//   - The directory doesn't exist yet until we call create()
//
// dir.create(recursive: true):
//   - Creates the directory and all parent directories if they don't exist
//   - Without recursive: true, it would fail if 'my_data' doesn't exist
//   - This is like saying "create this folder and any parent folders needed"
//
// Directory.list():
//   - Returns a Stream of file system entities (files, folders, links)
//   - Non-recursive: only shows items in the current folder
//   - Recursive: shows items in current folder AND all subfolders
//
// await for (final entity in stream):
//   - Processes each item in the stream one by one
//   - entity.runtimeType tells us what type of item it is
//   - entity.path gives us the full path to the item
//
// Directory.delete(recursive: true):
//   - Deletes the directory and everything inside it
//   - Without recursive: true, it would fail if the folder isn't empty
//   - Be very careful with this - it permanently deletes everything!
//
// Platform.pathSeparator:
//   - On Windows: '\' (backslash)
//   - On Mac/Linux: '/' (forward slash)
//   - This makes your code work on any operating system
