void main() {
  // Simply store an integer whose type cannot be changed.
  int x = 10;
  // Simply store a value that is inferred as an integer but cannot change types.
  var y = 20;
  // Simply store an integer that can also hold a null.
  int? z = 30;
  // Simply store a value that is inferred as an integer and can change types in the future, but not null.
  Object a = 40;
  // Simply store a value that is inferred as an integer and can change types in the future, but also supports null. The next declaration is better than to use `Object?`.
  Object? b = 50;
  // Alternative to the previous declaration. Much cleaner and recommended.
  dynamic c = 60;
  // When declared value is a compile-time constant and never null. It can be inferred.
  const d = 70;
  // When declared value is a compile-time constant and never null. Explicit mention of type.
  const int e = 80;
  // When declared value is a run-time constant and never null. It can be inferred.
  final f = 90;
  // When declared value is a run-time constant and never null. Explicit mention of type.
  final int g = 100;

  print(x);
  print(y);
  print(z);
  print(a);
  print(b);
  print(c);
  print(d);
  print(e);
  print(f);
  print(g);

  // No errors here.
  z = null;
  a = 1.1;
  b = 2.2;
}