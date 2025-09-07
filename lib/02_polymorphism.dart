// 📚 Dart OOP Session 2 - Polymorphism Demonstration
// 🎯 Learning Objective: Understand how one interface can have multiple implementations

void main() {
  print("🎭 Polymorphism Demo - One Remote, Multiple Devices\n");

  // Create a list of different animals (polymorphism in action!)
  List<Animal> animals = [
    Dog("Buddy"),
    Cat("Whiskers"),
    Bird("Tweety"),
    Fish("Nemo"),
    Lion("Simba"),
  ];

  print("=== Making All Animals Sound (Same Method, Different Behavior) ===");
  for (Animal animal in animals) {
    animal.makeSound(); // Same method call, different behavior!
    print("");
  }

  print("=== Feeding All Animals ===");
  for (Animal animal in animals) {
    animal.eat(); // Same method call, different behavior!
    print("");
  }

  print("=== Animal Information ===");
  for (Animal animal in animals) {
    animal.showInfo();
    print("");
  }

  // Demonstrate polymorphic method calls
  print("=== Polymorphic Method Calls ===");
  demonstratePolymorphism();
}

// 🏠 Base Class - Animal (The "Remote Control")
abstract class Animal {
  String name;

  Animal(this.name);

  // Abstract methods - must be implemented by child classes
  void makeSound();
  void eat();

  // Concrete method - shared by all animals
  void showInfo() {
    print("I am $name, a ${getAnimalType()}");
  }

  // Abstract method for getting animal type
  String getAnimalType();
}

// 🐕 Dog Implementation
class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void makeSound() {
    print("$name barks: Woof! Woof! Woof!");
  }

  @override
  void eat() {
    print("$name is eating dog food");
  }

  @override
  String getAnimalType() => "Dog";
}

// 🐱 Cat Implementation
class Cat extends Animal {
  Cat(String name) : super(name);

  @override
  void makeSound() {
    print("$name meows: Meow! Meow!");
  }

  @override
  void eat() {
    print("$name is eating cat food");
  }

  @override
  String getAnimalType() => "Cat";
}

// 🐦 Bird Implementation
class Bird extends Animal {
  Bird(String name) : super(name);

  @override
  void makeSound() {
    print("$name chirps: Tweet! Tweet! Tweet!");
  }

  @override
  void eat() {
    print("$name is eating seeds");
  }

  @override
  String getAnimalType() => "Bird";
}

// 🐠 Fish Implementation
class Fish extends Animal {
  Fish(String name) : super(name);

  @override
  void makeSound() {
    print("$name makes bubble sounds: Blub! Blub!");
  }

  @override
  void eat() {
    print("$name is eating fish food");
  }

  @override
  String getAnimalType() => "Fish";
}

// 🦁 Lion Implementation
class Lion extends Animal {
  Lion(String name) : super(name);

  @override
  void makeSound() {
    print("$name roars: ROAR! ROAR! ROAR!");
  }

  @override
  void eat() {
    print("$name is eating meat");
  }

  @override
  String getAnimalType() => "Lion";
}

// 🎯 Function to demonstrate polymorphism
void demonstratePolymorphism() {
  print("Creating animals...");

  // All these are Animal references, but they hold different types
  Animal animal1 = Dog("Rex");
  Animal animal2 = Cat("Fluffy");
  Animal animal3 = Bird("Polly");

  print("\nSame method calls, different behaviors:");

  // Same method call, different implementations
  animal1.makeSound(); // Calls Dog's makeSound
  animal2.makeSound(); // Calls Cat's makeSound
  animal3.makeSound(); // Calls Bird's makeSound

  print("\nPolymorphic method with switch:");
  processAnimal(animal1);
  processAnimal(animal2);
  processAnimal(animal3);
}

// 🎯 Function that processes any animal polymorphically
void processAnimal(Animal animal) {
  print("Processing ${animal.name}:");
  animal.makeSound();
  animal.eat();

  // We can also check the actual type at runtime
  if (animal is Dog) {
    print("This is a dog - it can fetch!");
  } else if (animal is Cat) {
    print("This is a cat - it can climb!");
  } else if (animal is Bird) {
    print("This is a bird - it can fly!");
  }
  print("");
}

/*
🎓 Key Learning Points:

1. **Polymorphism** = "Many Forms"
2. **Same Interface, Different Behavior** - One method call, multiple implementations
3. **Runtime Polymorphism** - The actual method called depends on the object type
4. **Base Class Reference** - Can hold any child class object

💡 Real-World Analogy:
- Remote Control (Animal) works with TV, AC, Sound System (Dog, Cat, Bird)
- Same button (makeSound), different behavior (bark, meow, chirp)

🔍 Benefits:
- Code Flexibility - Easy to add new animal types
- Maintainability - Change implementation without changing interface
- Extensibility - New behaviors without modifying existing code

🚀 Try This:
- Add more animal types (Elephant, Monkey, etc.)
- Create a method that takes Animal parameter
- Use polymorphism in a game scenario
*/
