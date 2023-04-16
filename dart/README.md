# Dart for Flutter

There is a lot of similarity between C++, Java and Dart in general. The build system is not unnecessarily complex. The only commands that need to be run, from the directory concerned, are:
```sh
# Replace the filename with the real Dart file.
dart first.dart
```


## Basic Pointers

- It is a statically typed language with dynamic behavior support.
- Marking a function or a method's return type as `void` is not necessary. It can be skipped.
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
- Enumerations are supported in Dart (see `enums.dart`). In Flutter, enums have gotten a lot more complex and extensive, making it possible to use them for a whole lot of customizable things. But they aren't discussed since they are highly specialized towards specific use-cases.


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
- Constructors here are a bit different. We can use shorthand to ease writing constructors and make it quicker and more convenient. The example in `classes.dart` makes it clear. It can be customized further, of course. But we would have better examples in the example apps.
- We can also have abstract classes. They cannot be instantiated. They exist just to be inherited.


## Factory Constructors

Sometimes, we tend to initialise objects with similar values. They become a special sub-type of objects under a class. One solution to this is to use the primary class as a superclass, extend it to other subclasses that are specialised. So anytime similar objects are to be created, the subclass gets instantiated, not the superclass. <br />
But Dart makes it easier with the concept of factory constructors. We have, in each class, many factory constructors, each one made for a set of similar classes. So the resultant object has its class uniform to the rest, but with minimal code gets instantiated differently. <br />
All this becomes clearer when we see `factory_constructors.dart`.


## Overriding Operators

Sometimes we may choose to use operators like '==', '>', et cetera with objects, which are treated as data. To specify their behaviour, we need to override their defaults. This is done in `class_operators.dart`.


## Final V Const

In Java, `final` did the job of `const`. Things are different here, though. They serve the similar purpose of creating values that cannot be changed. However:
- **final**: Used when a value is initialized at runtime. We use this in case we are making some API calls or fetching backend data. Can be used inside a class.
- **const**: Used when a value is initialized at compile-time. We use this when we are absolutely certain of its contents since that would carry over throughout the app. Cannot be used inside a class.


## Null Safety

 - Previously, deevlopers used constant checks in their app code to check for instances where a particular value might be having `null` data. That was important because using a `null` valued variable unknowingly can result in app breakages.
 - Dart has come up with null-safety, which means that unless the developers explicitly want, a variable can never be allowed to contain `null`s.
 - To enable nulls, we need to write out the variable declaration that is not type inferred and is explicit. We place a `?` after the declaration.
- Optionals are referred to as nullables.


## Null Aware Operators

Certain operators exist that let us do oftenly used if-else operataions in a single line. Refer to `null_aware.dart`.


## Extensions

- They are a tool to add some extended logic to a class which doesn't necessarily have to belong to that particular class. Maybe some additional untested feature, future release material, loosely related things, etc. Use is given in `factory_constructors.dart`.
- They are something that need to be used with great care. Sparse use is fine, but overuse is not recommended.
- This basically allows us to segregate features and not clutter our class code.


## Futures

- The `Future` class is used in asynchronous programming. It is used to signify that data is going to be dealt with in the future.
- This may be done in cases when the operation performed by a function is quite heavy and would take some time.
- The keyword `async` is used to earmark a function to operate asynchronously. To mark a fuction as `async` means that internally it would call some other function or do some task that would not be synchronous.
- The keyword `await` goes hand in hand with `async`. This cannot exist without `async`. If we try to return a Future object without `await`, we just get the object state, immediately. This means that we are not waiting for the future to do the job. If we apply `await`, this means that we are waiting the results. Once it comes, we see the proper data.
- The use is given in `future.dart`.


## Streams

They are a flow of continuous asynchronous data that either never stops or would stop gradually. A Future just stops after sending an asynchronous value. A Stream never stops. Look at `streams.dart`.


## Generators

- They are used when we are not ready with all the values in an iterable right at a given time. Things get generated on the fly.
- They are very similar to the ones used in Python. 
- We use the `sync` keyword since here we are generating things, not returning. The keyword used here to generate items is `yield`.
- We can also have asynchronous generators in which we use `Streams` with `Iterables`. But these are a rare find in Flutter development.
- Have a look at `generators.dart`.


## Resources

**DartPad** is a website that allows trial and use of Dart code.