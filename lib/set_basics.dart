// sets_basics.dart
// Lesson: Dart Set (unique collection)
//
// What is a Set?
// - A Set stores UNIQUE items (no duplicates).
// - Very fast membership checks (contains).
//
// When to use?
// - You need uniqueness (e.g., unique tags, selected IDs).
// - You need to compare groups (union/intersection/difference).

void main() {
  // 1) Create a Set
  Set<String> fruits = {"apple", "banana", "mango", "banana"};
  print("Initial set: $fruits"); // {apple, banana, mango}

  // 2) Remove item
  fruits.remove("banana");
  print("After remove('banana'): $fruits");

  // 3) Check if contains
  print("Contains 'apple'? ${fruits.contains("apple")}");

  // 4) Set operations
  Set<int> a = {1, 2, 3};
  Set<int> b = {3, 4, 5};

  print("Union: ${a.union(b)}");          // {1,2,3,4,5}
  print("Intersection: ${a.intersection(b)}"); // {3}
  print("Difference: ${a.difference(b)}");     // {1,2}

  // 5) Convert Set to List
  List<String> fruitList = fruits.toList();
  print("First item from list: ${fruitList[0]}");
}
