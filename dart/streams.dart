/// Stream here is composed of values from 0 to 4 coming at regular intervals.
Stream<int> getNumbers() {
  return Stream.periodic(const Duration(seconds: 2), (number) => number ++).take(5);
}

/// Stream here is composed of values from 0 to infinity coming at regular intervals.
Stream<int> getUnlimitedNumbers() {
  return Stream.periodic(const Duration(seconds: 2), (number) => number ++);
}

/// Stream here is only composed of a single value.
Stream<int> getNumber() {
  return Stream.value(10);
}

void main() async {
  await for (final value in getNumbers()) {
    print(value);
  }
  await for (final value in getNumber()) {
    print(value);
  }
  await for (final value in getUnlimitedNumbers()) {
    print(value);
  }
}