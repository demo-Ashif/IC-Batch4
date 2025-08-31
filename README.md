# Dart Console Programs for Beginners

This collection contains pure Dart console programs (no Flutter, no classes/objects) designed to teach file I/O operations, error handling, and async programming to beginners.

## 🚀 How to Run

Each program is a complete `.dart` file that you can run with:

```bash
# Option 1: Using dart run (recommended for packages)
dart run <filename>.dart

# Option 2: Direct execution (if not using a package)
dart <filename>.dart
```

## 📁 File Structure

The programs are organized in order of complexity:

- **00-03**: Basic file and directory operations
- **04-06**: Path handling, JSON, and binary files
- **07-09**: Streams and error handling
- **10-13**: Advanced error handling and patterns

## 🎯 Learning Objectives

1. **Async Programming**: Understanding `Future<void> main() async`
2. **File I/O**: Reading, writing, creating, and managing files
3. **Directory Operations**: Creating, listing, and managing folders
4. **Error Handling**: Using try-catch blocks and custom exceptions
5. **Streams**: Processing large files efficiently
6. **JSON**: Working with structured data

## 🛠️ Prerequisites

- Dart SDK installed on your system
- Basic understanding of Dart syntax
- Familiarity with async/await concepts

## 📚 Teaching Notes

- Start with `00_hello_async.dart` to understand async main
- Each program builds on the previous concepts
- Emphasize error handling from the beginning
- Use the practice tasks to reinforce learning

## 🔧 Practice Tasks

1. **Notes App**: Create a simple note-taking system
2. **Todo JSON**: Build a JSON-based todo manager
3. **Binary Copy**: Implement file copying with streams
4. **Error Drills**: Practice error handling scenarios

## 📖 Key Concepts Explained

- **`recursive: true`**: Creates parent directories if they don't exist
- **`FileMode.append`**: Adds content without overwriting existing data
- **`await for`**: Processes streams item by item
- **`try/catch/finally`**: Comprehensive error handling
- **Custom Exceptions**: Making error messages user-friendly

Happy coding! 🎉
