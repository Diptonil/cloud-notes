  // This is handly when we do not have much logic and need to return something that can be returned by evaluating just one line of code/ expression.

void main() {
  print(getAgeOne());
  print(getAgeTwo());
}

// The regular way.
int getAgeOne() {
  return 21;
}

// The more syntactic way.
int getAgeTwo() => 21;