# Abstraction

This basically fetches an image of abstract art and displays it in the app. It also redirects to a certain website, should users decide to buy it. <br />
This is the very first app that contains the following important lessons:
- **Widget Tree**: It refers to how widgets live within one onother. There would be a *root widget* within which all widgets would be nested, which in turn may have further nested widgets. This all can be visualised as a tree.
- **Fonts**: The `pubspec.yaml` file needs to have the `fonts` YAML entry added under `flutter` to detect the paths of all fonts. They can later be used within the style property as strings.
- **Text Class**: The class that is responsible for text rendering. It takes a String and also a property as `style` that takes in `TestStyle` for styling of text.
- **Dart**: The programming language on which Flutter is based. The `dart` directory describes some basic concepts commonly used in working with this framework.
- **StatelessWidgets**: It contains data such that the state associated with the data cannot change over time. Once it is initialised and put into code in the class that inherits the `StatelessWidget`, it cannot change.
- **Hot Reload**: It is the fastest operation to recompile code to reflect changes in app. It preserves the previous app state. This can only work with `StatelessWidget`s, if not obvious.
- **Hot Restart**: It is slower than hot reloads but faster than full restarts. It doesn't preserve the previous app state. It starts the app from its default state.


## Issues to be Addressed

- The current project lacks structure. To improve readability and maintainabiity, it is of paramount importance that a project is structured well.
- The app currently just has one single feature and screen. Multiple screens are a common feature in most apps.
- Alignment and layout is overly simple.
- No backend interaction.
- The filesystem of the device is not at all touched for storage or to save anything else.
- There is no use of state in the app. No stateful widgets as such.