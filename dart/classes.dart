void main() {
  User userOne = new User("Bruce Wayne", 100);
  print(userOne.getAge);
  print(userOne.getUsername);

  userOne.setUsername = "Selina Kyle";
  print(userOne.getAge);
  print(userOne.getUsername);
}

class User {
  // Fields
  String username;
  int age;

  // Getters
  int get getAge {
    return age;
  }

  String get getUsername {
    return username;
  }

  // Setters
  void set setAge(int age) {
    this.age = age;
  }

  void set setUsername(String username) {
    this.username = username;
  }

  // Constructors
  User(String username, int age) : this.age = age, this.username = username;

  // Methods
  bool isAdult() => (this.age >= 21) ? true : false;
}