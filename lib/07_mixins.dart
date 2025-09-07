// 📚 Dart OOP Session 2 - Mixin Demonstration
// 🎯 Learning Objective: Understand how to share code across multiple classes without inheritance

void main() {
  print("🔌 Mixin Demo - Code Reuse Without Inheritance\n");

  // 🎯 Basic Mixin Usage - Swimmer and Flyer
  print("=== Basic Mixin Usage ===");
  Duck duck = Duck("Mallard");
  duck.swim();
  duck.fly();
  duck.land();
  duck.dive();
  print("");

  // 🎯 Multiple Mixins - Duck with multiple abilities
  print("=== Multiple Mixins ===");
  Duck duck2 = Duck("Mallard");
  duck2.swim();
  duck2.fly();
  duck2.land();
  duck2.dive();
  duck2.quack();
  print("");

  // 🎯 Mixin with Properties - Swimmer with speed
  print("=== Mixin with Properties ===");
  Fish fish = Fish("Goldfish");
  fish.swim();
  fish.dive();
  print("Fish speed: ${fish.swimSpeed} km/h");
  print("");

  // 🎯 Mixin with Methods - Flyer with altitude
  print("=== Mixin with Methods ===");
  Eagle eagle = Eagle("Bald Eagle");
  eagle.fly();
  eagle.land();
  eagle.takeOff();
  print("Eagle altitude: ${eagle.getAltitude()} meters");
  print("");

  // 🎯 Mixin with Abstract Methods - Drawable
  print("=== Mixin with Abstract Methods ===");
  Circle circle = Circle(5.0);
  Rectangle rectangle = Rectangle(4.0, 6.0);

  circle.draw();
  circle.move(10, 20);
  print("");

  rectangle.draw();
  rectangle.move(5, 15);
  print("");

  // 🎯 Mixin with Concrete Methods - Logger
  print("=== Mixin with Concrete Methods ===");
  Calculator calculator = Calculator();
  calculator.add(5, 3);
  calculator.subtract(10, 4);
  calculator.multiply(6, 7);
  calculator.divide(20, 4);
  print("");

  // 🎯 Mixin with Static Methods - MathUtils
  print("=== Mixin with Static Methods ===");
  MathHelper mathHelper = MathHelper();
  mathHelper.calculateCircleArea(5.0);
  mathHelper.calculateRectangleArea(4.0, 6.0);
  print("");

  // 🎯 Mixin with Getters and Setters - Configurable
  print("=== Mixin with Getters and Setters ===");
  ConfigurableApp app = ConfigurableApp();
  app.setTheme("dark");
  app.setLanguage("en");
  print("Theme: ${app.getTheme()}");
  print("Language: ${app.getLanguage()}");
  print("");

  // 🎯 Mixin with Private Members - Counter
  print("=== Mixin with Private Members ===");
  CounterMixin counter1 = CounterMixin("Counter 1");
  CounterMixin counter2 = CounterMixin("Counter 2");

  counter1.increment();
  counter1.increment();
  counter2.increment();

  print("Counter 1 count: ${counter1.getCount()}");
  print("Counter 2 count: ${counter2.getCount()}");
  print("");

  // 🎯 Mixin with Multiple Inheritance - SuperDuck
  print("=== Mixin with Multiple Inheritance ===");
  SuperDuck superDuck = SuperDuck("Super Mallard");
  superDuck.swim();
  superDuck.fly();
  superDuck.land();
  superDuck.dive();
  superDuck.quack();
  superDuck.takeOff();
  print("Super Duck altitude: ${superDuck.getAltitude()} meters");
  print("");
}

// 🏊 Mixin - Swimmer
mixin Swimmer {
  // Mixin can have properties
  double swimSpeed = 5.0;

  // Mixin can have methods
  void swim() {
    print("Swimming at ${swimSpeed} km/h");
  }

  void dive() {
    print("Diving deep underwater");
  }

  // Mixin can have getters
  double get currentSpeed => swimSpeed;

  // Mixin can have setters
  set speed(double newSpeed) {
    swimSpeed = newSpeed;
  }
}

// ✈️ Mixin - Flyer
mixin Flyer {
  double _altitude = 0.0;

  void fly() {
    _altitude = 100.0;
    print("Flying at ${_altitude} meters altitude");
  }

  void land() {
    _altitude = 0.0;
    print("Landing safely");
  }

  void takeOff() {
    _altitude = 50.0;
    print("Taking off to ${_altitude} meters");
  }

  double getAltitude() => _altitude;
}

// 🎨 Mixin - Drawable (with abstract methods)
mixin Drawable {
  // Abstract methods that must be implemented
  void draw();
  void move(double x, double y);

  // Concrete methods
  void showPosition() {
    print("Object is drawable");
  }
}

// 📝 Mixin - Logger
mixin Logger {
  void log(String message) {
    print("LOG: $message");
  }

  void logError(String error) {
    print("ERROR: $error");
  }

  void logInfo(String info) {
    print("INFO: $info");
  }
}

// 🧮 Mixin - MathUtils
mixin MathUtils {
  static double pi = 3.14159;

  static double circleArea(double radius) {
    return pi * radius * radius;
  }

  static double rectangleArea(double length, double width) {
    return length * width;
  }
}

// ⚙️ Mixin - Configurable
mixin Configurable {
  String _theme = "light";
  String _language = "en";

  void setTheme(String theme) {
    _theme = theme;
  }

  String getTheme() => _theme;

  void setLanguage(String language) {
    _language = language;
  }

  String getLanguage() => _language;
}

// 🔢 Mixin - Counter
mixin Counter {
  int _count = 0;

  void increment() {
    _count++;
  }

  void decrement() {
    _count--;
  }

  int getCount() => _count;

  void reset() {
    _count = 0;
  }
}

// 🦆 Duck - Uses multiple mixins
class Duck with Swimmer, Flyer {
  String name;

  Duck(this.name);

  void quack() {
    print("$name quacks: Quack! Quack!");
  }
}

// 🐠 Fish - Uses Swimmer mixin
class Fish with Swimmer {
  String name;

  Fish(this.name);

  void swim() {
    print("$name fish is swimming");
    super.swim(); // Call mixin method
  }
}

// 🦅 Eagle - Uses Flyer mixin
class Eagle with Flyer {
  String name;

  Eagle(this.name);

  void fly() {
    print("$name eagle is flying");
    super.fly(); // Call mixin method
  }
}

// ⭕ Circle - Uses Drawable mixin
class Circle with Drawable {
  double radius;

  Circle(this.radius);

  @override
  void draw() {
    print("Drawing a circle with radius $radius");
  }

  @override
  void move(double x, double y) {
    print("Moving circle to position ($x, $y)");
  }
}

// 📐 Rectangle - Uses Drawable mixin
class Rectangle with Drawable {
  double length;
  double width;

  Rectangle(this.length, this.width);

  @override
  void draw() {
    print("Drawing a rectangle with length $length and width $width");
  }

  @override
  void move(double x, double y) {
    print("Moving rectangle to position ($x, $y)");
  }
}

// 🧮 Calculator - Uses Logger mixin
class Calculator with Logger {
  void add(double a, double b) {
    double result = a + b;
    log("Adding $a + $b = $result");
  }

  void subtract(double a, double b) {
    double result = a - b;
    log("Subtracting $a - $b = $result");
  }

  void multiply(double a, double b) {
    double result = a * b;
    log("Multiplying $a * $b = $result");
  }

  void divide(double a, double b) {
    if (b != 0) {
      double result = a / b;
      log("Dividing $a / $b = $result");
    } else {
      logError("Cannot divide by zero!");
    }
  }
}

// 🧮 MathHelper - Uses MathUtils mixin
class MathHelper with MathUtils {
  void calculateCircleArea(double radius) {
    double area = MathUtils.circleArea(radius);
    print("Circle area with radius $radius: $area");
  }

  void calculateRectangleArea(double length, double width) {
    double area = MathUtils.rectangleArea(length, width);
    print("Rectangle area with length $length and width $width: $area");
  }
}

// 📱 ConfigurableApp - Uses Configurable mixin
class ConfigurableApp with Configurable {
  void showSettings() {
    print("App settings:");
    print("Theme: ${getTheme()}");
    print("Language: ${getLanguage()}");
  }
}

// 🔢 CounterMixin - Uses Counter mixin
class CounterMixin with Counter {
  String name;

  CounterMixin(this.name);

  void showCount() {
    print("$name count: ${getCount()}");
  }
}

// 🦆 SuperDuck - Uses multiple mixins
class SuperDuck with Swimmer, Flyer, Logger {
  String name;

  SuperDuck(this.name);

  void quack() {
    log("$name quacks: Quack! Quack!");
  }

  void swim() {
    log("$name is swimming");
    super.swim();
  }

  void fly() {
    log("$name is flying");
    super.fly();
  }
}

/*
🎓 Key Learning Points:

1. **Mixin** = Code that can be mixed into classes
2. **Multiple Mixins** = A class can use multiple mixins
3. **Mixin Methods** = Can have concrete and abstract methods
4. **Mixin Properties** = Can have properties, getters, and setters
5. **Mixin Inheritance** = Mixins can extend other mixins
6. **No Constructor** = Mixins cannot have constructors

💡 Real-World Analogy:
- **Plugin** you can attach to classes
- **Swiss Army Knife** - different tools for different needs
- **Lego Blocks** - combine different pieces to build something

🔍 Benefits of Mixins:
- **Code Reuse** - Share code across multiple classes
- **Multiple Inheritance** - Avoid diamond problem
- **Flexibility** - Mix and match behaviors
- **Maintainability** - Update behavior in one place

🚀 Try This:
- Create mixins for different abilities (Runner, Jumper, Climber)
- Create mixins for different behaviors (Eater, Sleeper, Player)
- Create mixins for different utilities (Validator, Formatter, Converter)
- Combine multiple mixins in a single class
- Create mixins that extend other mixins
*/
