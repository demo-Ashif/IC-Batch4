// 📚 Dart OOP Session 2 - Comprehensive Zoo System Project
// 🎯 Learning Objective: Combine all OOP concepts in a real-world project

void main() {
  print("🦁 Zoo System - Comprehensive OOP Project\n");

  // Create zoo instance
  Zoo zoo = Zoo("Wildlife Adventure Zoo");

  // Add animals to zoo
  zoo.addAnimal(Lion("Simba", 5));
  zoo.addAnimal(Elephant("Dumbo", 8));
  zoo.addAnimal(Eagle("Thunder", 3));
  zoo.addAnimal(Dolphin("Splash", 4));
  zoo.addAnimal(Penguin("Chilly", 2));
  zoo.addAnimal(Monkey("Banana", 6));

  // Add employees
  zoo.addEmployee(Zookeeper("John", 30, "Lion House"));
  zoo.addEmployee(Veterinarian("Dr. Smith", 35, "Surgery"));
  zoo.addEmployee(Guide("Alice", 25, "Education"));

  // Run zoo operations
  zoo.openZoo();
  zoo.feedAllAnimals();
  zoo.performHealthCheck();
  zoo.giveTour();
  zoo.closeZoo();

  // Demonstrate polymorphism
  print("\n=== Polymorphism Demo ===");
  demonstratePolymorphism();

  // Demonstrate static usage
  print("\n=== Static Usage Demo ===");
  demonstrateStaticUsage();

  // Demonstrate enum usage
  print("\n=== Enum Usage Demo ===");
  demonstrateEnumUsage();
}

// 🏛️ Zoo Class - Main system
class Zoo {
  String name;
  List<Animal> animals = [];
  List<Employee> employees = [];
  ZooStatus status = ZooStatus.closed;

  Zoo(this.name);

  void addAnimal(Animal animal) {
    animals.add(animal);
    print("Added ${animal.name} to the zoo");
  }

  void addEmployee(Employee employee) {
    employees.add(employee);
    print("Added ${employee.name} to the zoo staff");
  }

  void openZoo() {
    status = ZooStatus.open;
    print("🦁 $name is now OPEN!");
    print("Animals: ${animals.length}, Staff: ${employees.length}");
  }

  void feedAllAnimals() {
    print("\n🍽️ Feeding all animals...");
    for (Animal animal in animals) {
      animal.eat();
    }
  }

  void performHealthCheck() {
    print("\n🏥 Performing health checks...");
    for (Animal animal in animals) {
      animal.makeSound();
      if (animal.healthStatus == HealthStatus.healthy) {
        print("${animal.name} is healthy ✅");
      } else {
        print("${animal.name} needs attention ⚠️");
      }
    }
  }

  void giveTour() {
    print("\n🎯 Giving zoo tour...");
    for (Employee employee in employees) {
      if (employee is Guide) {
        employee.giveTour(animals);
      }
    }
  }

  void closeZoo() {
    status = ZooStatus.closed;
    print("\n🦁 $name is now CLOSED!");
  }
}

// 🐕 Abstract Animal Class
abstract class Animal {
  String name;
  int age;
  HealthStatus healthStatus;

  Animal(this.name, this.age) : healthStatus = HealthStatus.healthy;

  // Abstract methods
  void makeSound();
  void eat();
  void move();

  // Concrete methods
  void showInfo() {
    print("$name, $age years old, ${getAnimalType()}");
  }

  String getAnimalType();

  void sleep() {
    print("$name is sleeping");
  }
}

// 🦁 Lion - Uses multiple mixins
class Lion extends Animal with Predator, Roarer {
  Lion(String name, int age) : super(name, age);

  @override
  void makeSound() {
    roar();
  }

  @override
  void eat() {
    hunt();
    print("$name is eating meat");
  }

  @override
  void move() {
    print("$name walks majestically");
  }

  @override
  String getAnimalType() => "Lion";
}

// 🐘 Elephant - Uses multiple mixins
class Elephant extends Animal with Herbivore, TrunkUser {
  Elephant(String name, int age) : super(name, age);

  @override
  void makeSound() {
    print("$name trumpets: EEEEE!");
  }

  @override
  void eat() {
    graze();
    print("$name is eating grass and leaves");
  }

  @override
  void move() {
    print("$name walks slowly");
  }

  @override
  String getAnimalType() => "Elephant";
}

// 🦅 Eagle - Uses multiple mixins
class Eagle extends Animal with Predator, Flyer {
  Eagle(String name, int age) : super(name, age);

  @override
  void makeSound() {
    print("$name screeches: SCREECH!");
  }

  @override
  void eat() {
    hunt();
    print("$name is eating small animals");
  }

  @override
  void move() {
    fly();
  }

  @override
  String getAnimalType() => "Eagle";
}

// 🐬 Dolphin - Uses multiple mixins
class Dolphin extends Animal with Swimmer, Intelligent {
  Dolphin(String name, int age) : super(name, age);

  @override
  void makeSound() {
    print("$name clicks: CLICK CLICK!");
  }

  @override
  void eat() {
    print("$name is eating fish");
  }

  @override
  void move() {
    swim();
  }

  @override
  String getAnimalType() => "Dolphin";
}

// 🐧 Penguin - Uses multiple mixins
class Penguin extends Animal with Swimmer, Waddler {
  Penguin(String name, int age) : super(name, age);

  @override
  void makeSound() {
    print("$name honks: HONK!");
  }

  @override
  void eat() {
    print("$name is eating fish");
  }

  @override
  void move() {
    waddle();
  }

  @override
  String getAnimalType() => "Penguin";
}

// 🐒 Monkey - Uses multiple mixins
class Monkey extends Animal with Climber, Intelligent {
  Monkey(String name, int age) : super(name, age);

  @override
  void makeSound() {
    print("$name chatters: CHATTER!");
  }

  @override
  void eat() {
    print("$name is eating fruits");
  }

  @override
  void move() {
    climb();
  }

  @override
  String getAnimalType() => "Monkey";
}

// 🏃 Mixins for different abilities
mixin Predator {
  void hunt() {
    print("Hunting for prey");
  }
}

mixin Herbivore {
  void graze() {
    print("Grazing on plants");
  }
}

mixin Swimmer {
  void swim() {
    print("Swimming gracefully");
  }
}

mixin Flyer {
  void fly() {
    print("Flying high");
  }
}

mixin Climber {
  void climb() {
    print("Climbing trees");
  }
}

mixin Roarer {
  void roar() {
    print("ROAR!");
  }
}

mixin TrunkUser {
  void useTrunk() {
    print("Using trunk to grab objects");
  }
}

mixin Waddler {
  void waddle() {
    print("Waddling on land");
  }
}

mixin Intelligent {
  void think() {
    print("Thinking intelligently");
  }
}

// 👥 Abstract Employee Class
abstract class Employee {
  String name;
  int age;
  String department;

  Employee(this.name, this.age, this.department);

  // Abstract methods
  void work();
  void takeBreak();

  // Concrete methods
  void showInfo() {
    print("$name, $age years old, $department");
  }

  String getEmployeeType();
}

// 🦁 Zookeeper Implementation
class Zookeeper extends Employee {
  Zookeeper(String name, int age, String department)
    : super(name, age, department);

  @override
  void work() {
    print("$name is taking care of animals");
  }

  @override
  void takeBreak() {
    print("$name is taking a break");
  }

  @override
  String getEmployeeType() => "Zookeeper";
}

// 🏥 Veterinarian Implementation
class Veterinarian extends Employee {
  Veterinarian(String name, int age, String department)
    : super(name, age, department);

  @override
  void work() {
    print("$name is treating sick animals");
  }

  @override
  void takeBreak() {
    print("$name is taking a break");
  }

  @override
  String getEmployeeType() => "Veterinarian";
}

// 🎯 Guide Implementation
class Guide extends Employee {
  Guide(String name, int age, String department) : super(name, age, department);

  @override
  void work() {
    print("$name is giving tours");
  }

  @override
  void takeBreak() {
    print("$name is taking a break");
  }

  @override
  String getEmployeeType() => "Guide";

  void giveTour(List<Animal> animals) {
    print("$name is giving a tour of ${animals.length} animals");
    for (Animal animal in animals) {
      animal.showInfo();
    }
  }
}

// 🚦 Enums
enum ZooStatus { open, closed, maintenance }

enum HealthStatus { healthy, sick, injured, recovering }

enum AnimalType { mammal, bird, fish, reptile, amphibian }

// 🧮 Static Utility Class
class ZooUtils {
  static int totalAnimals = 0;
  static int totalEmployees = 0;

  static void incrementAnimalCount() {
    totalAnimals++;
  }

  static void incrementEmployeeCount() {
    totalEmployees++;
  }

  static void showStats() {
    print("Total Animals: $totalAnimals");
    print("Total Employees: $totalEmployees");
  }
}

// 🎯 Function to demonstrate polymorphism
void demonstratePolymorphism() {
  List<Animal> animals = [
    Lion("Simba", 5),
    Elephant("Dumbo", 8),
    Eagle("Thunder", 3),
  ];

  for (Animal animal in animals) {
    animal.makeSound(); // Same method, different behavior
    animal.eat(); // Same method, different behavior
    animal.move(); // Same method, different behavior
    print("");
  }
}

// 🎯 Function to demonstrate static usage
void demonstrateStaticUsage() {
  ZooUtils.incrementAnimalCount();
  ZooUtils.incrementAnimalCount();
  ZooUtils.incrementEmployeeCount();
  ZooUtils.showStats();
}

// 🎯 Function to demonstrate enum usage
void demonstrateEnumUsage() {
  ZooStatus status = ZooStatus.open;
  HealthStatus health = HealthStatus.healthy;
  AnimalType type = AnimalType.mammal;

  print("Zoo Status: $status");
  print("Health Status: $health");
  print("Animal Type: $type");
}

/*
🎓 Key Learning Points:

1. **Abstract Classes** - Animal and Employee base classes
2. **Inheritance** - Lion extends Animal, Zookeeper extends Employee
3. **Polymorphism** - Same method calls, different behaviors
4. **Mixins** - Multiple abilities (Swimmer, Flyer, etc.)
5. **Enums** - Fixed values (ZooStatus, HealthStatus)
6. **Static Members** - ZooUtils for shared functionality
7. **Composition** - Zoo contains animals and employees

💡 Real-World Application:
- **Zoo Management System** - Real-world scenario
- **Code Organization** - Clear separation of concerns
- **Extensibility** - Easy to add new animals/employees
- **Maintainability** - Changes in one place affect all

🔍 Benefits:
- **Scalability** - Easy to add new features
- **Reusability** - Mixins can be used across classes
- **Type Safety** - Enums prevent invalid values
- **Flexibility** - Polymorphism allows different behaviors

🚀 Try This:
- Add more animal types (Tiger, Giraffe, etc.)
- Add more employee types (Security, Maintenance, etc.)
- Create more mixins (Jumper, Runner, etc.)
- Add more enums (FeedingSchedule, MaintenanceType, etc.)
- Implement a feeding schedule system
- Add a ticket system for visitors
*/
