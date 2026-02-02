void main() {
  int a;
  int b;

  a = 0;
  b = ++a; // Increment a before b gets its value.
  assert(a == b); // 1 == 1

  a = 0;
  b = a++; // Increment a after b gets its value.
  assert(a != b); // 1 != 0

  a = 0;
  b = --a; // Decrement a before b gets its value.
  assert(a == b); // -1 == -1

  a = 0;
  b = a--; // Decrement a after b gets its value.
  assert(a != b); // -1 != 0

  String? nameNull;
  String name = "Mattys";

  print(playerName(nameNull));
  print(playerName(name));

  var p = Point()
    ..x = 2
    ..y = 3
    ..z = 4;
  print(p.x); // 2.0
}

String playerName(String? name) {
  if (name != null) {
    return name;
  } else {
    return 'Guest';
  }
}

class Point {
  double? x; // Declare instance variable x, initially null.
  double? y; // Declare y, initially null.
  double z = 0; // Declare z, initially 0.
}
