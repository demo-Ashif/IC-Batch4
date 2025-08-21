
## Conditional Statements

### 1. If Statement
The basic `if` statement executes a block of code when a condition is true.

```dart
void main() {
  int age = 18;
  
  if (age >= 18) {
    print('You can register for voting! Your age: $age');
  }
}
```

### 2. If-Else Statement
The `if-else` statement provides an alternative execution path when the condition is false.

```dart
void main() {
  int age = 16;
  
  if (age >= 18) {
    print('You can register for voting! Your age: $age');
  } else {
    print('You have to wait until turn 18!');
  }
}
```

### 3. Else-If Statement (If-Else Ladder)
Multiple conditions can be checked using `else if` statements.

```dart
void main() {
  int score = 81;
  
  if (score >= 80) {
    print('Grade A');
  } else if (score >= 75) {
    print('Grade B');
  } else if (score >= 70) {
    print('Grade C');
  } else if (score >= 60) {
    print('Grade D');
  } else {
    print('Grade F');
  }
}
```

### 4. Nested If-Else
If statements can be nested inside other if statements for complex logic.

```dart
void main() {
  String role = 'admin';
  bool active = true;
  
  if (active) {
    if (role == 'admin') {
      print('Show admin panel');
    } else {
      print('Show home panel');
    }
  } else {
    print('Account inactive');
  }
}
```

## Switch Case Statements

### Basic Switch Case
The `switch` statement evaluates an expression and executes code based on matching cases.

```dart
void main() {
  String status = 'pending';
  
  switch (status) {
    case 'pending':
      print('We received your order');
      break;
    case 'processing':
      print('We are preparing your order');
      break;
    case 'shipped':
      print('We have delivered your order');
      break;
    default:
      print('Unknown status');
  }
}
```

### Switch Case with Return
Using `return` instead of `break` to exit the function immediately.

```dart
String getStatusMessage(String status) {
  switch (status) {
    case 'pending':
      return 'We received your order';
    case 'processing':
      return 'We are preparing your order';
    case 'shipped':
      return 'We have delivered your order';
    default:
      return 'Unknown status';
  }
}
```

### Switch Case with Continue
Using `continue` to skip to the next iteration (useful in loops with switch).

```dart
void main() {
  List<String> statuses = ['pending', 'processing', 'shipped', 'invalid'];
  
  for (String status in statuses) {
    switch (status) {
      case 'invalid':
        continue; // Skip invalid statuses
      case 'pending':
        print('Processing pending order');
        break;
      case 'processing':
        print('Order is being prepared');
        break;
      case 'shipped':
        print('Order has been shipped');
        break;
    }
  }
}
```

## Loop Structures

### 1. For Loop
The traditional `for` loop with initialization, condition, and increment/decrement.

```dart
void main() {
  // Basic for loop
  for (int i = 1; i <= 5; i++) {
    print('Count: $i');
  }
  
  // For loop with break
  for (int i = 1; i <= 100; i++) {
    if (i > 50) {
      break; // Stop the loop when i > 50
    }
    print(i);
  }
  
  // For loop with continue
  for (int i = 1; i <= 10; i++) {
    if (i % 2 == 0) {
      continue; // Skip even numbers
    }
    print('Odd number: $i');
  }
}
```

### 2. For-In Loop
The `for-in` loop iterates over elements in a collection.

```dart
void main() {
  List<String> fruits = ['apple', 'banana', 'orange', 'grape'];
  
  // Basic for-in loop
  for (String fruit in fruits) {
    print('I like $fruit');
  }
  
  // For-in loop with break
  for (String fruit in fruits) {
    if (fruit == 'orange') {
      break; // Stop when we find orange
    }
    print('Processing: $fruit');
  }
  
  // For-in loop with continue
  for (String fruit in fruits) {
    if (fruit == 'banana') {
      continue; // Skip banana
    }
    print('Eating: $fruit');
  }
}
```

### 3. While Loop
The `while` loop executes code while a condition is true.

```dart
void main() {
  int count = 0;
  
  // Basic while loop
  while (count < 5) {
    print('Count: $count');
    count++;
  }
  
  // While loop with break
  int number = 1;
  while (true) {
    if (number > 10) {
      break; // Exit infinite loop
    }
    print('Number: $number');
    number++;
  }
  
  // While loop with continue
  int i = 0;
  while (i < 10) {
    i++;
    if (i % 2 == 0) {
      continue; // Skip even numbers
    }
    print('Odd: $i');
  }
}
```

### 4. Do-While Loop
The `do-while` loop executes code at least once, then checks the condition.

```dart
void main() {
  int attempts = 0;
  
  // Basic do-while loop
  do {
    print('Attempt ${attempts + 1}');
    attempts++;
  } while (attempts < 3);
  
  // Do-while loop with break
  int value = 0;
  do {
    if (value == 5) {
      break; // Exit when value reaches 5
    }
    print('Value: $value');
    value++;
  } while (value < 10);
  
  // Do-while loop with continue
  int counter = 0;
  do {
    counter++;
    if (counter == 3) {
      continue; // Skip printing when counter is 3
    }
    print('Counter: $counter');
  } while (counter < 5);
}
```

## Key Concepts

### Break Statement
- **Purpose**: Exits the current loop or switch statement immediately
- **Usage**: Can be used in `for`, `while`, `do-while` loops and `switch` statements
- **Effect**: Skips all remaining iterations and continues with the next statement after the loop

### Continue Statement
- **Purpose**: Skips the current iteration and continues with the next iteration
- **Usage**: Can be used in `for`, `while`, and `do-while` loops
- **Effect**: Skips the current iteration but continues the loop

### Return Statement
- **Purpose**: Exits the current function and returns a value
- **Usage**: Can be used in `switch` statements to exit the function immediately
- **Effect**: Terminates the function execution and returns control to the caller

## Best Practices

1. **Use meaningful variable names** for better code readability
2. **Keep loops simple** and avoid deeply nested structures
3. **Use break and continue sparingly** to maintain code clarity
4. **Always include a default case** in switch statements
5. **Ensure loop termination** to avoid infinite loops
6. **Use appropriate loop types** based on your specific use case
