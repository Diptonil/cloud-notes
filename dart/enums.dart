enum Person {
  name, age, sex, height, weight;
}

void main() {
  // To see a list of all the enum values.
  print(Person.values);
  // To see an individual item. Printing it off is not of much use.
  print(Person.age);
  // To call `showProperty` function.
  verifyProperty(Person.height);
}

void verifyProperty(Person property) {
  if (property == Person.height || property == Person.weight) {
    print("This is a verifiable property.");
  } else {
    print("This is not a verifiable property.");
  }
}