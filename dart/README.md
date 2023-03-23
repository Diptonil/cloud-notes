# Dart for Flutter

There is a lot of similarity between C++, Java and Dart in general. The build system is not unnecessarily complex. The only commands that need to be run, from the directory concerned, are:
```sh
# Replace the filename with the real Dart file.
dart first.dart
```


## Basic Pointers

- It is a statically typed language with dynamic behavior support.
- Basic data types (keep it simple during programming):
    - `int`
    - `String`
    - `bool`
    - `num`
    - `double`
    - `List`
    - `Map`
    - `Iterable`
    - `Set`, etc.
- We should refrain from the use of the dynamic behaviour whenever possible. We can do it like we use `var` in Java. We use the dynamic keyword as so:
    ```dart
    dynamic x = 20;
    print(x);
    x = "String now."
    print(x);
    ```
- Like JS, Dart also uses arrow return. It is basically a shorthand for the `{ return value; }` expression. An example is given in `arrow.dart`.
- Iterables are collections meant to be iterated along in loops, not indexed. Lists (child class of Iterable) are collections to be indexed, sorted, add elements, etc. This functionality is important to keep in mind for proper collection type choice. All are possible for Iterables, but anyway `toList()` has to be called, so... no use.
- The `lists.dart` shows how to operate of the `List` data type.
- The `classes.dart` shows a basic example of use of classes in Dart, which is very close to how Java handles classes.


## Class Structure

- We have some unique things about the way classes are written in here. The concepts correspond to Java classes.
- We have these things that we sequentially write:
    - Fields
    - Getters and Setters
    - Constructors
    - Methods
- The `classes.dart` file illustrates a simple class example. However, this just shows a simple case. Real use-cases aren't remotely as easy as this.
- If we are inheriting, we use the keyword `extends` and we use the annotation `@override` at the top of the method we wish to oevrride and provide an original definition for in the child class.
- The `static` and `super` keywords work exacly the same as they did in Java.