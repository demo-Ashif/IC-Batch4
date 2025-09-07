// 📚 Dart OOP Session 2 - Enum Demonstration
// 🎯 Learning Objective: Understand how to use enums for fixed sets of values

void main() {
  print("🚦 Enum Demo - Fixed Set of Values\n");

  // 🎯 Basic Enum Usage - Traffic Light
  print("=== Traffic Light Enum ===");
  TrafficLight currentLight = TrafficLight.red;
  print("Current light: $currentLight");

  // Switch statement with enum
  switch (currentLight) {
    case TrafficLight.red:
      print("Stop!");
      break;
    case TrafficLight.yellow:
      print("Get ready!");
      break;
    case TrafficLight.green:
      print("Go!");
      break;
  }
  print("");

  // 🎯 Enum with Methods - Days of Week
  print("=== Days of Week Enum ===");
  DayOfWeek today = DayOfWeek.monday;
  print("Today is: ${today.name}");
  print("Is weekend: ${today.isWeekend}");
  print("Next day: ${today.nextDay}");
  print("Day number: ${today.dayNumber}");
  print("");

  // 🎯 Enum with Values - Priority
  print("=== Priority Enum ===");
  Priority taskPriority = Priority.high;
  print("Task priority: ${taskPriority.name}");
  print("Priority level: ${taskPriority.level}");
  print("Priority color: ${taskPriority.color}");
  print("");

  // 🎯 Enum Iteration
  print("=== Enum Iteration ===");
  print("All traffic lights:");
  for (TrafficLight light in TrafficLight.values) {
    print("- $light");
  }
  print("");

  // 🎯 Enum in Classes - Game State
  print("=== Game State Enum ===");
  Game game = Game();
  game.start();
  game.pause();
  game.resume();
  game.end();
  print("");

  // 🎯 Enum with Switch Expression (Dart 3.0+)
  print("=== Switch Expression with Enum ===");
  Status status = Status.loading;
  String message = switch (status) {
    Status.loading => "Please wait...",
    Status.success => "Operation completed successfully!",
    Status.error => "Something went wrong!",
    Status.idle => "Ready to start",
  };
  print("Status message: $message");
  print("");

  // 🎯 Enum with Custom Methods - Card Suit
  print("=== Card Suit Enum ===");
  CardSuit suit = CardSuit.hearts;
  print("Suit: ${suit.name}");
  print("Symbol: ${suit.symbol}");
  print("Color: ${suit.color}");
  print("Is red: ${suit.isRed}");
  print("");

  // 🎯 Enum in Collections
  print("=== Enum in Collections ===");
  List<Priority> priorities = [
    Priority.low,
    Priority.medium,
    Priority.high,
    Priority.critical,
  ];
  priorities.sort((a, b) => a.level.compareTo(b.level));
  print("Sorted priorities:");
  for (Priority priority in priorities) {
    print("- ${priority.name}: Level ${priority.level}");
  }
  print("");

  // 🎯 Enum with Switch and Default
  print("=== Enum Switch with Default ===");
  processTrafficLight(TrafficLight.red);
  processTrafficLight(TrafficLight.yellow);
  processTrafficLight(TrafficLight.green);
  print("");

  // 🎯 Enum with Custom Constructor
  print("=== Enum with Custom Constructor ===");
  HttpStatus status200 = HttpStatus.ok;
  print("Status: ${status200.name}");
  print("Code: ${status200.code}");
  print("Message: ${status200.message}");
  print("");
}

// 🚦 Basic Enum - Traffic Light
enum TrafficLight { red, yellow, green }

// 📅 Enum with Methods - Days of Week
enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  // Custom methods
  bool get isWeekend => this == saturday || this == sunday;

  DayOfWeek get nextDay {
    switch (this) {
      case DayOfWeek.monday:
        return DayOfWeek.tuesday;
      case DayOfWeek.tuesday:
        return DayOfWeek.wednesday;
      case DayOfWeek.wednesday:
        return DayOfWeek.thursday;
      case DayOfWeek.thursday:
        return DayOfWeek.friday;
      case DayOfWeek.friday:
        return DayOfWeek.saturday;
      case DayOfWeek.saturday:
        return DayOfWeek.sunday;
      case DayOfWeek.sunday:
        return DayOfWeek.monday;
    }
  }

  int get dayNumber {
    switch (this) {
      case DayOfWeek.monday:
        return 1;
      case DayOfWeek.tuesday:
        return 2;
      case DayOfWeek.wednesday:
        return 3;
      case DayOfWeek.thursday:
        return 4;
      case DayOfWeek.friday:
        return 5;
      case DayOfWeek.saturday:
        return 6;
      case DayOfWeek.sunday:
        return 7;
    }
  }
}

// ⚡ Enum with Values - Priority
enum Priority {
  low(1, "Low"),
  medium(2, "Medium"),
  high(3, "High"),
  critical(4, "Critical");

  const Priority(this.level, this.color);

  final int level;
  final String color;
}

// 🎮 Enum in Classes - Game State
enum GameState { menu, playing, paused, gameOver }

class Game {
  GameState _state = GameState.menu;

  void start() {
    _state = GameState.playing;
    print("Game started! State: $_state");
  }

  void pause() {
    if (_state == GameState.playing) {
      _state = GameState.paused;
      print("Game paused! State: $_state");
    } else {
      print("Cannot pause game in $_state state");
    }
  }

  void resume() {
    if (_state == GameState.paused) {
      _state = GameState.playing;
      print("Game resumed! State: $_state");
    } else {
      print("Cannot resume game in $_state state");
    }
  }

  void end() {
    _state = GameState.gameOver;
    print("Game ended! State: $_state");
  }
}

// 📊 Enum for Status
enum Status { loading, success, error, idle }

// 🃏 Enum with Custom Methods - Card Suit
enum CardSuit {
  hearts,
  diamonds,
  clubs,
  spades;

  String get symbol {
    switch (this) {
      case CardSuit.hearts:
        return "♥";
      case CardSuit.diamonds:
        return "♦";
      case CardSuit.clubs:
        return "♣";
      case CardSuit.spades:
        return "♠";
    }
  }

  String get color {
    switch (this) {
      case CardSuit.hearts:
      case CardSuit.diamonds:
        return "Red";
      case CardSuit.clubs:
      case CardSuit.spades:
        return "Black";
    }
  }

  bool get isRed => color == "Red";
}

// 🌐 Enum with Custom Constructor - HTTP Status
enum HttpStatus {
  ok(200, "OK"),
  notFound(404, "Not Found"),
  serverError(500, "Internal Server Error"),
  unauthorized(401, "Unauthorized");

  const HttpStatus(this.code, this.message);

  final int code;
  final String message;
}

// 🎯 Function to process traffic light
void processTrafficLight(TrafficLight light) {
  switch (light) {
    case TrafficLight.red:
      print("🚦 Red light: Stop!");
      break;
    case TrafficLight.yellow:
      print("🚦 Yellow light: Get ready!");
      break;
    case TrafficLight.green:
      print("🚦 Green light: Go!");
      break;
  }
}

/*
🎓 Key Learning Points:

1. **Enum** = Fixed set of values
2. **Enum Values** are constants and cannot be changed
3. **Switch Statements** work perfectly with enums
4. **Enum Methods** can be added for custom behavior
5. **Enum Values** can have associated data
6. **Type Safety** - prevents invalid values

💡 Real-World Analogy:
- Traffic lights: red, yellow, green (fixed set)
- Days of week: Monday, Tuesday, etc. (fixed set)
- Card suits: hearts, diamonds, clubs, spades (fixed set)

🔍 Benefits of Enums:
- **Type Safety** - prevents invalid values
- **Readability** - clear, meaningful names
- **Maintainability** - easy to add/remove values
- **Performance** - efficient memory usage
- **IDE Support** - autocomplete and error checking

🚀 Try This:
- Create enum for different types of users (admin, user, guest)
- Create enum for different types of notifications (email, sms, push)
- Create enum for different types of payment methods
- Create enum for different types of weather conditions
- Add methods to your enums for custom behavior
*/
