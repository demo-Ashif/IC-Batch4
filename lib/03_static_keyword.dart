// 📚 Dart OOP Session 2 - Static Keyword Demonstration
// 🎯 Learning Objective: Understand class-level members that belong to the class, not instances

void main() {
  print("⚡ Static Keyword Demo - Class-Level Members\n");

  // 🎯 Static Variables - Belong to the class, not instances
  print("=== Static Variables ===");
  print("MathHelper.PI: ${MathHelper.pi}");
  print("MathHelper.MAX_VALUE: ${MathHelper.maxValue}");
  print("Counter.totalCount: ${Counter.totalCount}");

  // 🎯 Static Methods - Called on the class, not instances
  print("\n=== Static Methods ===");
  print("Circle area (radius 5): ${MathHelper.circleArea(5)}");
  print("Rectangle area (5x3): ${MathHelper.rectangleArea(5, 3)}");
  print("Distance between points: ${MathHelper.distance(0, 0, 3, 4)}");

  // 🎯 Static vs Instance - The difference
  print("\n=== Static vs Instance Comparison ===");

  // Creating instances
  Counter counter1 = Counter("Counter 1");
  Counter counter2 = Counter("Counter 2");

  // Instance methods
  counter1.increment();
  counter1.increment();
  counter2.increment();

  // Static variable shows total across all instances
  print("Total count across all counters: ${Counter.totalCount}");

  // 🎯 Utility Class Example
  print("\n=== Utility Class Example ===");
  StringProcessor.processText("Hello World");
  StringProcessor.processText("Dart Programming");

  // 🎯 Configuration Class Example
  print("\n=== Configuration Class Example ===");
  AppConfig.showConfig();

  // 🎯 Static Factory Methods
  print("\n=== Static Factory Methods ===");
  Person person1 = Person.createStudent("Alice", 20);
  Person person2 = Person.createTeacher("Bob", 35);
  Person person3 = Person.createAdmin("Charlie", 30);

  person1.showInfo();
  person2.showInfo();
  person3.showInfo();
}

// 🧮 MathHelper - Utility Class with Static Members
class MathHelper {
  // Static constants
  static const double pi = 3.14159265359;
  static const int maxValue = 1000000;

  // Static methods for calculations
  static double circleArea(double radius) {
    return pi * radius * radius;
  }

  static double rectangleArea(double length, double width) {
    return length * width;
  }

  static double triangleArea(double base, double height) {
    return 0.5 * base * height;
  }

  static double distance(double x1, double y1, double x2, double y2) {
    double dx = x2 - x1;
    double dy = y2 - y1;
    return Math.sqrt(dx * dx + dy * dy);
  }

  // Static method to validate numbers
  static bool isValidNumber(double number) {
    return number > 0 && number <= maxValue;
  }
}

// 🔢 Counter - Demonstrating Static vs Instance
class Counter {
  String name;
  int count;

  // Static variable - shared across all instances
  static int totalCount = 0;

  // Constructor
  Counter(this.name) : count = 0;

  // Instance method
  void increment() {
    count++;
    totalCount++; // Modifies static variable
  }

  // Instance method
  void showCount() {
    print("$name: $count (Total: $totalCount)");
  }

  // Static method
  static void resetTotal() {
    totalCount = 0;
    print("Total count reset to 0");
  }
}

// 📝 StringProcessor - Utility Class
class StringProcessor {
  // Static methods for string operations
  static void processText(String text) {
    print("Original: $text");
    print("Uppercase: ${text.toUpperCase()}");
    print("Lowercase: ${text.toLowerCase()}");
    print("Length: ${text.length}");
    print("Words: ${text.split(' ').length}");
    print("---");
  }

  static String reverse(String text) {
    return text.split('').reversed.join('');
  }

  static bool isPalindrome(String text) {
    String cleaned = text.toLowerCase().replaceAll(' ', '');
    return cleaned == reverse(cleaned);
  }
}

// ⚙️ AppConfig - Configuration Class
class AppConfig {
  // Static configuration values
  static const String appName = "Dart OOP Demo";
  static const String version = "2.0.0";
  static const bool debugMode = true;
  static const int maxRetries = 3;

  // Static method to show configuration
  static void showConfig() {
    print("App Name: $appName");
    print("Version: $version");
    print("Debug Mode: $debugMode");
    print("Max Retries: $maxRetries");
  }

  // Static method to check if debug mode is on
  static bool isDebugMode() {
    return debugMode;
  }
}

// 👤 Person - Static Factory Methods
class Person {
  String name;
  int age;
  String role;

  // Private constructor
  Person._(this.name, this.age, this.role);

  // Static factory methods
  static Person createStudent(String name, int age) {
    return Person._(name, age, "Student");
  }

  static Person createTeacher(String name, int age) {
    return Person._(name, age, "Teacher");
  }

  static Person createAdmin(String name, int age) {
    return Person._(name, age, "Admin");
  }

  void showInfo() {
    print("$name, $age years old, Role: $role");
  }
}

// 🧮 Math - Static methods for mathematical operations
class Math {
  static double sqrt(double number) {
    // Simple square root approximation
    if (number < 0) return double.nan;
    if (number == 0) return 0;

    double guess = number / 2;
    for (int i = 0; i < 10; i++) {
      guess = (guess + number / guess) / 2;
    }
    return guess;
  }

  static double pow(double base, double exponent) {
    return base * exponent; // Simplified for demo
  }
}

/*
🎓 Key Learning Points:

1. **Static Members** belong to the class, not instances
2. **Static Variables** are shared across all instances
3. **Static Methods** are called on the class, not instances
4. **No 'this'** - Static methods can't access instance members
5. **Memory Efficient** - Only one copy of static members exists

💡 Real-World Analogy:
- Library membership card is per library (static), not per person (instance)
- All students share the same school rules (static)
- Each student has their own grades (instance)

🔍 When to Use Static:
- Constants (PI, MAX_VALUE)
- Utility methods (MathHelper, StringProcessor)
- Configuration values (AppConfig)
- Factory methods (Person.createStudent)
- Counters that need to be shared

🚀 Try This:
- Create a static method to generate unique IDs
- Add more utility methods to MathHelper
- Create a static method to validate email addresses
- Implement a singleton pattern using static
*/
