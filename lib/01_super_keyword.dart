// 📚 Dart OOP Session 2 - Super Keyword Demonstration
// 🎯 Learning Objective: Understand how to access parent class members using 'super'

void main() {
  print("🐕 Super Keyword Demo - Animal Family\n");

  // Create different animals
  Dog buddy = Dog("Buddy");
  Cat whiskers = Cat("Whiskers");
  Bird tweety = Bird("Tweety");

  print("=== Animal Sounds ===");
  buddy.makeSound();
  print("");
  whiskers.makeSound();
  print("");
  tweety.makeSound();

  print("\n=== Animal Information ===");
  buddy.showInfo();
  whiskers.showInfo();
  tweety.showInfo();
}

// 🏠 Parent Class - Animal
class Animal {
  String name;
  int age;

  // Constructor
  Animal(this.name, [this.age = 1]);

  // Parent method that can be called by children
  void makeSound() {
    print("$name makes a generic animal sound");
  }

  // Method to show basic info
  void showInfo() {
    print("Name: $name, Age: $age years");
  }

  // Method to get animal type
  String getAnimalType() {
    return "Animal";
  }
}

// 🐕 Child Class - Dog
class Dog extends Animal {
  String breed;

  // Constructor calling parent constructor
  Dog(String name, [String breed = "Mixed"]) : breed = breed, super(name);

  // Override parent method but also call parent's version
  @override
  void makeSound() {
    super.makeSound(); // Call parent's makeSound method
    print("$name barks: Woof! Woof!");
  }

  // Override showInfo to add breed information
  @override
  void showInfo() {
    super.showInfo(); // Call parent's showInfo method
    print("Breed: $breed");
  }

  // Override getAnimalType
  @override
  String getAnimalType() {
    return "Dog";
  }

  // Dog-specific method
  void wagTail() {
    print("$name is wagging tail happily!");
  }
}

// 🐱 Child Class - Cat
class Cat extends Animal {
  bool isIndoor;

  // Constructor
  Cat(String name, [bool isIndoor = true]) : isIndoor = isIndoor, super(name);

  // Override makeSound
  @override
  void makeSound() {
    super.makeSound(); // Call parent's makeSound method
    print("$name meows: Meow! Meow!");
  }

  // Override showInfo
  @override
  void showInfo() {
    super.showInfo(); // Call parent's showInfo method
    print("Indoor Cat: $isIndoor");
  }

  // Override getAnimalType
  @override
  String getAnimalType() {
    return "Cat";
  }

  // Cat-specific method
  void purr() {
    print("$name is purring softly...");
  }
}

// 🐦 Child Class - Bird
class Bird extends Animal {
  bool canFly;

  // Constructor
  Bird(String name, [bool canFly = true]) : canFly = canFly, super(name);

  // Override makeSound
  @override
  void makeSound() {
    super.makeSound(); // Call parent's makeSound method
    print("$name chirps: Tweet! Tweet!");
  }

  // Override showInfo
  @override
  void showInfo() {
    super.showInfo(); // Call parent's showInfo method
    print("Can Fly: $canFly");
  }

  // Override getAnimalType
  @override
  String getAnimalType() {
    return "Bird";
  }

  // Bird-specific method
  void fly() {
    if (canFly) {
      print("$name is flying high!");
    } else {
      print("$name cannot fly.");
    }
  }
}

/*
🎓 Key Learning Points:

1. **super.methodName()** - Calls the parent class method
2. **super.propertyName** - Accesses parent class property
3. **super()** - Calls parent class constructor

💡 Why Use Super?
- Reuse parent class functionality
- Avoid code duplication
- Maintain consistency with parent behavior
- Add to parent behavior rather than replacing it

🔍 Try This:
- Remove super.makeSound() calls and see the difference
- Add more animal types (Fish, Rabbit, etc.)
- Create a method that calls multiple parent methods
*/
