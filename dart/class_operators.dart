class Dog {
  final String name;
  final int age;
  final String breed;

  Dog(this.name, this.age, this.breed);

  @override
  bool operator == (covariant Dog secondObject) => secondObject.name == name;

  // We do not need to override these operators because they are not inherited by the implicit Object class.
  bool operator > (covariant Dog secondObject) => age > secondObject.age;

  bool operator >= (covariant Dog secondObject) => age >= secondObject.age;

  bool operator < (covariant Dog secondObject) => age < secondObject.age;

  bool operator <= (covariant Dog secondObject) => age <= secondObject.age;

  @override
  int get hashCode => name.hashCode;
}
