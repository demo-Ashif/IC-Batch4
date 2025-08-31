// 02_file_ops.dart
//
// LEARNING OBJECTIVE: Comprehensive file operations
//
// WHAT WE'LL LEARN:
// - How to create empty files
// - How to check if files exist
// - How to get file statistics (size, dates, type)
// - How to rename files
// - How to delete files
// - Understanding file metadata

import 'dart:io';

Future<void> main() async {
  print('🔧 File Operations Demo');
  print('=' * 40);
  
  // STEP 1: CREATE AN EMPTY FILE
  // create() creates an empty file if it doesn't exist
  // recursive: true means "create parent directories if they don't exist"
  final f1 = File('note.txt');
  
  try {
    await f1.create(recursive: true);
    print('✓ Created empty file: ${f1.path}');
  } catch (e) {
    print('❌ Failed to create file: $e');
    return;
  }
  
  // STEP 2: CHECK IF FILE EXISTS
  // exists() returns true if the file exists, false otherwise
  final exists = await f1.exists();
  print('✓ File exists? $exists');
  
  // STEP 3: WRITE SOME CONTENT TO SEE SIZE AND DATES
  // We need content to see meaningful file statistics
  await f1.writeAsString('Dart is fun!\nFlutter is awesome!\n');
  print('✓ Added content to the file');
  
  // STEP 4: GET FILE STATISTICS
  // stat() gives us detailed information about the file
  final stat = await f1.stat();
  print('\n📊 File Statistics:');
  print('  Path: ${f1.path}');
  print('  Size: ${stat.size} bytes');
  print('  Modified: ${stat.modified}');
  print('  Created: ${stat.changed}');
  print('  Type: ${stat.type}');
  
  // STEP 5: RENAME THE FILE
  // rename() creates a new file with the new name and deletes the old one
  // It returns the new File object
  try {
    final f2 = await f1.rename('renamed_note.txt');
    print('\n✓ Renamed file to: ${f2.path}');
    
    // Verify the old file no longer exists
    final oldExists = await f1.exists();
    final newExists = await f2.exists();
    print('  Old file exists? $oldExists');
    print('  New file exists? $newExists');
    
    // STEP 6: DELETE THE FILE
    // delete() removes the file from the file system
    await f2.delete();
    print('\n✓ Deleted file: ${f2.path}');
    
    // Verify deletion
    final deletedExists = await f2.exists();
    print('  File still exists? $deletedExists');
    
  } catch (e) {
    print('❌ Error during rename/delete: $e');
  }
  
  print('\n🎉 File operations completed successfully!');
}

// EXPLANATION OF KEY CONCEPTS:
//
// file.create(recursive: true):
//   - Creates an empty file
//   - recursive: true means "create parent directories if needed"
//   - Example: If you want to create 'folder/subfolder/file.txt' and 
//     'folder' doesn't exist, it will create both 'folder' and 'subfolder'
//
// file.exists():
//   - Returns true/false indicating if the file exists
//   - Always use this before trying to read a file
//
// file.stat():
//   - Returns a FileStat object with file information
//   - stat.size: file size in bytes
//   - stat.modified: when the file was last changed
//   - stat.changed: when the file was created
//   - stat.type: type of file system entity
//
// file.rename(newName):
//   - Moves/renames the file to a new location
//   - Returns a new File object pointing to the new location
//   - The old File object becomes invalid
//
// file.delete():
//   - Permanently removes the file from disk
//   - Be careful - this cannot be undone!
//   - Always verify with exists() after deletion
