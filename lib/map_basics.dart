// maps_basics.dart
// Lesson: Dart Map (key -> value dictionary)
//
// What is a Map?
// - Stores data as key-value pairs.
// - Lookup is done by KEY (like a dictionary).
//
// When to use?
// - You need to connect two pieces of data (id->user, country->capital).
// - You want fast lookups by a unique key.

void main() {
  // 1) Create a Map
  Map<String, String> countryCapital = {
    "Bangladesh": "Dhaka",
    "India": "New Delhi",
    "USA": "Washington DC",
  };

  // 2) Access item
  print("Capital of Bangladesh: ${countryCapital["Bangladesh"]}");

  // 3) Add item
  countryCapital["Japan"] = "Tokyo";
  print("After adding Japan: $countryCapital");

  // 4) Update item
  countryCapital["USA"] = "Washington D.C.";
  print("After updating USA: $countryCapital");

  // 5) Remove item
  countryCapital.remove("India");
  print("After removing India: $countryCapital");

  // 6) Check if a KEY exists
  print("Has key 'Bangladesh'? ${countryCapital.containsKey("Bangladesh")}");

  // 7) Check if a VALUE exists
  print("Has value 'Dhaka'? ${countryCapital.containsValue("Dhaka")}");

  // 8) Loop through Map
  Map<String, int> scores = {"Alice": 90, "Bob": 85};
  scores.forEach((name, mark) {
    print("$name scored $mark");
  });

  // 9) Convert keys & values to List
  List<String> names = scores.keys.toList();
  List<int> marks = scores.values.toList();
  print("Names: $names");
  print("Marks: $marks");
}
