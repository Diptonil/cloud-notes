# Flutter Commands

These commands are always going to be handy in Flutter development.


## Create a Project

The `xxx.domain` is a very important line as it is the identifier that is to be associated with the project during its release. This follows a structure similar to how Java does things. Despite the convenience that one's IDE may provide, this is hands down the best way to start a Flutter app and be in control of things.
```sh
flutter create --org xxx.domain appname
```


## Upgrade Flutter

To upgrade the Flutter Engine as and when upgrades are released.
```sh
flutter upgrade
```


## Add Dependencies

```sh
flutter pub add <dependency>
```


## Add FlutterFire

FlutterFire is a tool to integrate a Firebase backend with Flutter by just issuing simple customizable commands. It was a long process before this CLI had come out. That process could have a lot of errors and mess-ups. Not anymore.
```sh
dart pub global activate flutterfire_cli 
```