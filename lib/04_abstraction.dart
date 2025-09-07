// 📚 Dart OOP Session 2 - Abstraction Demonstration
// 🎯 Learning Objective: Understand how to hide implementation details and focus on interfaces

void main() {
  print("🎭 Abstraction Demo - Hide Complexity, Show Interface\n");

  // 🎯 Abstract Class Example - Vehicle
  print("=== Vehicle Abstraction ===");
  List<Vehicle> vehicles = [
    Car("Toyota Camry", "Gasoline"),
    Motorcycle("Honda CBR", "Gasoline"),
    ElectricCar("Tesla Model 3", "Electric"),
  ];

  for (Vehicle vehicle in vehicles) {
    vehicle.start();
    vehicle.accelerate();
    vehicle.brake();
    vehicle.showInfo();
    print("");
  }

  // 🎯 Abstract Class Example - Shape
  print("=== Shape Abstraction ===");
  List<Shape> shapes = [
    Circle(5.0),
    Rectangle(4.0, 6.0),
    Triangle(3.0, 4.0, 5.0),
  ];

  for (Shape shape in shapes) {
    print("${shape.name}:");
    print("  Area: ${shape.calculateArea()}");
    print("  Perimeter: ${shape.calculatePerimeter()}");
    shape.draw();
    print("");
  }

  // 🎯 Abstract Class Example - Animal
  print("=== Animal Abstraction ===");
  List<Animal> animals = [Dog("Buddy"), Cat("Whiskers"), Bird("Tweety")];

  for (Animal animal in animals) {
    animal.makeSound();
    animal.move();
    animal.eat();
    print("");
  }
}

// 🚗 Abstract Vehicle Class
abstract class Vehicle {
  String name;
  String fuelType;

  Vehicle(this.name, this.fuelType);

  // Abstract methods - must be implemented by child classes
  void start();
  void accelerate();
  void brake();

  // Concrete method - shared by all vehicles
  void showInfo() {
    print("Vehicle: $name, Fuel: $fuelType");
  }

  // Abstract method for getting vehicle type
  String getVehicleType();
}

// 🚙 Car Implementation
class Car extends Vehicle {
  Car(String name, String fuelType) : super(name, fuelType);

  @override
  void start() {
    print("$name car engine starts with a rumble");
  }

  @override
  void accelerate() {
    print("$name car accelerates smoothly");
  }

  @override
  void brake() {
    print("$name car brakes with ABS system");
  }

  @override
  String getVehicleType() => "Car";
}

// 🏍️ Motorcycle Implementation
class Motorcycle extends Vehicle {
  Motorcycle(String name, String fuelType) : super(name, fuelType);

  @override
  void start() {
    print("$name motorcycle engine roars to life");
  }

  @override
  void accelerate() {
    print("$name motorcycle accelerates with a roar");
  }

  @override
  void brake() {
    print("$name motorcycle brakes with front and rear brakes");
  }

  @override
  String getVehicleType() => "Motorcycle";
}

// ⚡ Electric Car Implementation
class ElectricCar extends Vehicle {
  ElectricCar(String name, String fuelType) : super(name, fuelType);

  @override
  void start() {
    print("$name electric car starts silently");
  }

  @override
  void accelerate() {
    print("$name electric car accelerates instantly");
  }

  @override
  void brake() {
    print("$name electric car brakes with regenerative braking");
  }

  @override
  String getVehicleType() => "Electric Car";
}

// 🔵 Abstract Shape Class
abstract class Shape {
  // Abstract methods - must be implemented by child classes
  double calculateArea();
  double calculatePerimeter();
  void draw();

  // Abstract getter for shape name
  String get name;

  // Concrete method - shared by all shapes
  void showDetails() {
    print("Shape: $name");
    print("Area: ${calculateArea()}");
    print("Perimeter: ${calculatePerimeter()}");
  }
}

// ⭕ Circle Implementation
class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  String get name => "Circle";

  @override
  double calculateArea() {
    return 3.14159 * radius * radius;
  }

  @override
  double calculatePerimeter() {
    return 2 * 3.14159 * radius;
  }

  @override
  void draw() {
    print("Drawing a circle with radius $radius");
  }
}

// 📐 Rectangle Implementation
class Rectangle extends Shape {
  double length;
  double width;

  Rectangle(this.length, this.width);

  @override
  String get name => "Rectangle";

  @override
  double calculateArea() {
    return length * width;
  }

  @override
  double calculatePerimeter() {
    return 2 * (length + width);
  }

  @override
  void draw() {
    print("Drawing a rectangle with length $length and width $width");
  }
}

// 🔺 Triangle Implementation
class Triangle extends Shape {
  double side1;
  double side2;
  double side3;

  Triangle(this.side1, this.side2, this.side3);

  @override
  String get name => "Triangle";

  @override
  double calculateArea() {
    // Using Heron's formula
    double s = (side1 + side2 + side3) / 2;
    return Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
  }

  @override
  double calculatePerimeter() {
    return side1 + side2 + side3;
  }

  @override
  void draw() {
    print("Drawing a triangle with sides $side1, $side2, $side3");
  }
}

// 🐕 Abstract Animal Class
abstract class Animal {
  String name;

  Animal(this.name);

  // Abstract methods - must be implemented by child classes
  void makeSound();
  void move();
  void eat();

  // Concrete method - shared by all animals
  void showInfo() {
    print("Animal: $name");
  }
}

// 🐕 Dog Implementation
class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void makeSound() {
    print("$name barks: Woof! Woof!");
  }

  @override
  void move() {
    print("$name runs on four legs");
  }

  @override
  void eat() {
    print("$name eats dog food");
  }
}

// 🐱 Cat Implementation
class Cat extends Animal {
  Cat(String name) : super(name);

  @override
  void makeSound() {
    print("$name meows: Meow! Meow!");
  }

  @override
  void move() {
    print("$name walks gracefully");
  }

  @override
  void eat() {
    print("$name eats cat food");
  }
}

// 🐦 Bird Implementation
class Bird extends Animal {
  Bird(String name) : super(name);

  @override
  void makeSound() {
    print("$name chirps: Tweet! Tweet!");
  }

  @override
  void move() {
    print("$name flies in the sky");
  }

  @override
  void eat() {
    print("$name eats seeds and insects");
  }
}

// 🧮 Math - Simple math operations
class Math {
  static double sqrt(double number) {
    if (number < 0) return double.nan;
    if (number == 0) return 0;

    double guess = number / 2;
    for (int i = 0; i < 10; i++) {
      guess = (guess + number / guess) / 2;
    }
    return guess;
  }
}

/*
🎓 Key Learning Points:

1. **Abstract Classes** cannot be instantiated directly
2. **Abstract Methods** must be implemented by child classes
3. **Concrete Methods** can be shared by all child classes
4. **Abstraction** hides implementation details
5. **Interface Focus** - Shows what to do, not how to do it

💡 Real-World Analogy:
- Car driver uses steering wheel (interface), doesn't care about engine (implementation)
- TV remote has buttons (interface), doesn't show circuit board (implementation)
- Restaurant menu shows dishes (interface), doesn't show kitchen (implementation)

🔍 Benefits of Abstraction:
- **Simplicity** - Hide complex implementation
- **Flexibility** - Change implementation without affecting interface
- **Maintainability** - Easier to modify and extend
- **Reusability** - Common interface for different implementations

🚀 Try This:
- Add more vehicle types (Truck, Bus, etc.)
- Create abstract class for different types of employees
- Implement abstract class for different types of media (Book, Movie, Music)
- Create abstract class for different types of weapons in a game
*/
