Iterable<int> getNumbers() sync* {
  int number = 0;
  while (number != 5) {
    yield ++ number;
  }
}

void main() {
  for (final int number in getNumbers()) {
    print(number);
  }
}