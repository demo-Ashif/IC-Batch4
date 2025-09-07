// 📚 Dart OOP Session 2 - Interface vs Abstract Class Demonstration
// 🎯 Learning Objective: Understand when to use interfaces vs abstract classes

void main() {
  print("🔌 Interface vs Abstract Class Demo\n");

  // 🎯 Abstract Class Example - Vehicle (with shared code)
  print("=== Abstract Class Example - Vehicle ===");
  List<Vehicle> vehicles = [
    Car("Toyota Camry"),
    Motorcycle("Honda CBR"),
    Truck("Ford F-150"),
  ];

  for (Vehicle vehicle in vehicles) {
    vehicle.start();
    vehicle.accelerate();
    vehicle.brake();
    vehicle.showInfo(); // Shared method from abstract class
    print("");
  }

  // 🎯 Interface Example - Flyable (contract only)
  print("=== Interface Example - Flyable ===");
  List<Flyable> flyableObjects = [
    Bird("Eagle"),
    Airplane("Boeing 737"),
    Drone("DJI Phantom"),
  ];

  for (Flyable flyable in flyableObjects) {
    flyable.fly();
    flyable.land();
    print("");
  }

  // 🎯 Interface Example - Swimmable (contract only)
  print("=== Interface Example - Swimmable ===");
  List<Swimmable> swimmableObjects = [
    Fish("Goldfish"),
    Duck("Mallard"),
    Human("John"),
  ];

  for (Swimmable swimmable in swimmableObjects) {
    swimmable.swim();
    swimmable.dive();
    print("");
  }

  // 🎯 Multiple Interfaces - Duck can both fly and swim
  print("=== Multiple Interfaces - Duck ===");
  Duck duck = Duck("Mallard");
  duck.fly();
  duck.swim();
  duck.land();
  duck.dive();
  print("");

  // 🎯 Interface vs Abstract Class Comparison
  print("=== Interface vs Abstract Class Comparison ===");
  demonstrateDifference();
}

// 🚗 Abstract Class - Vehicle (with shared code)
abstract class Vehicle {
  String name;

  Vehicle(this.name);

  // Abstract methods - must be implemented
  void start();
  void accelerate();
  void brake();

  // Concrete method - shared by all vehicles
  void showInfo() {
    print("Vehicle: $name");
  }

  // Another concrete method
  void honk() {
    print("$name honks: Beep! Beep!");
  }
}

// 🚙 Car Implementation
class Car extends Vehicle {
  Car(String name) : super(name);

  @override
  void start() {
    print("$name car engine starts");
  }

  @override
  void accelerate() {
    print("$name car accelerates");
  }

  @override
  void brake() {
    print("$name car brakes");
  }
}

// 🏍️ Motorcycle Implementation
class Motorcycle extends Vehicle {
  Motorcycle(String name) : super(name);

  @override
  void start() {
    print("$name motorcycle engine roars");
  }

  @override
  void accelerate() {
    print("$name motorcycle accelerates");
  }

  @override
  void brake() {
    print("$name motorcycle brakes");
  }
}

// 🚛 Truck Implementation
class Truck extends Vehicle {
  Truck(String name) : super(name);

  @override
  void start() {
    print("$name truck engine starts");
  }

  @override
  void accelerate() {
    print("$name truck accelerates slowly");
  }

  @override
  void brake() {
    print("$name truck brakes heavily");
  }
}

// ✈️ Interface - Flyable (contract only)
abstract class Flyable {
  // All methods are abstract (contract only)
  void fly();
  void land();

  // No concrete methods allowed in interfaces
}

// 🐦 Bird Implementation
class Bird implements Flyable {
  String name;

  Bird(this.name);

  @override
  void fly() {
    print("$name bird flies with wings");
  }

  @override
  void land() {
    print("$name bird lands on a branch");
  }
}

// ✈️ Airplane Implementation
class Airplane implements Flyable {
  String name;

  Airplane(this.name);

  @override
  void fly() {
    print("$name airplane flies with engines");
  }

  @override
  void land() {
    print("$name airplane lands on runway");
  }
}

// 🚁 Drone Implementation
class Drone implements Flyable {
  String name;

  Drone(this.name);

  @override
  void fly() {
    print("$name drone flies with propellers");
  }

  @override
  void land() {
    print("$name drone lands on ground");
  }
}

// 🏊 Interface - Swimmable (contract only)
abstract class Swimmable {
  // All methods are abstract (contract only)
  void swim();
  void dive();
}

// 🐠 Fish Implementation
class Fish implements Swimmable {
  String name;

  Fish(this.name);

  @override
  void swim() {
    print("$name fish swims with fins");
  }

  @override
  void dive() {
    print("$name fish dives deep");
  }
}

// 🦆 Duck Implementation (implements multiple interfaces)
class Duck implements Flyable, Swimmable {
  String name;

  Duck(this.name);

  // Flyable interface implementation
  @override
  void fly() {
    print("$name duck flies with wings");
  }

  @override
  void land() {
    print("$name duck lands on water");
  }

  // Swimmable interface implementation
  @override
  void swim() {
    print("$name duck swims with webbed feet");
  }

  @override
  void dive() {
    print("$name duck dives for food");
  }
}

// 🏊 Human Implementation
class Human implements Swimmable {
  String name;

  Human(this.name);

  @override
  void swim() {
    print("$name human swims with arms and legs");
  }

  @override
  void dive() {
    print("$name human dives underwater");
  }
}

// 🎯 Function to demonstrate the difference
void demonstrateDifference() {
  print("Abstract Class (Vehicle):");
  print("- Can have concrete methods (showInfo, honk)");
  print("- Can have abstract methods (start, accelerate, brake)");
  print("- Provides shared code + contract");
  print("- Use 'extends' keyword");
  print("");

  print("Interface (Flyable, Swimmable):");
  print("- Only abstract methods (contract only)");
  print("- No concrete methods allowed");
  print("- Provides contract only");
  print("- Use 'implements' keyword");
  print("- Can implement multiple interfaces");
  print("");

  print("When to use Abstract Class:");
  print("- When you want to share common code");
  print("- When you have some common behavior");
  print("- When you want to provide default implementation");
  print("");

  print("When to use Interface:");
  print("- When you only want to define a contract");
  print("- When you want multiple inheritance");
  print("- When you want to ensure all methods are implemented");
  print("- When you want to define capabilities/behaviors");
}

/*
🎓 Key Learning Points:

1. **Abstract Class** (`extends`):
   - Can have concrete methods (shared code)
   - Can have abstract methods (contract)
   - Provides shared code + contract
   - Single inheritance only

2. **Interface** (`implements`):
   - Only abstract methods (contract only)
   - No concrete methods allowed
   - Provides contract only
   - Multiple inheritance possible

3. **When to Use Abstract Class**:
   - When you want to share common code
   - When you have some common behavior
   - When you want to provide default implementation

4. **When to Use Interface**:
   - When you only want to define a contract
   - When you want multiple inheritance
   - When you want to ensure all methods are implemented

💡 Real-World Analogy:
- **Abstract Class** = Car blueprint with common parts (engine, wheels) + specific requirements
- **Interface** = Driver's license (contract) - tells you what you must do, not how to do it

🔍 Benefits:
- **Abstract Class**: Code reuse, shared behavior
- **Interface**: Multiple inheritance, contract enforcement

🚀 Try This:
- Create an abstract class for different types of employees
- Create interfaces for different skills (Programmer, Designer, Manager)
- Implement multiple interfaces in a single class
- Create an abstract class for different types of media with shared methods
*/
