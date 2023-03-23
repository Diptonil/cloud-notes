void main() {
  // If we did not use the `int` generic, the List would permit entry of all data types. But that isn't a recommended practice.
  List<int> list = [];

  list.add(1);
  list.add(2);
  list.add(3);
  print(list);
  list.remove(2);
  print(list);
}