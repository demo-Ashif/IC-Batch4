void main() {
  int age = 18;

  //Keyword
  //Formula
  //Operator

  //If-else statement
  if (age >= 18) {
    // If statement
    print('You can register for voting! Your age: $age');
  } else {
    // Else statement
    print('You have to wait until turn 18!');
  }

  int score = 81; // Grade A

  //>=60 D
  //>=70 C
  //>=75 B
  //>=80 A

  // else-if Statement/Ladder

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

  // Nested if-else
  String role = 'admin';
  bool active = true; // Account active

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

//Control flow
