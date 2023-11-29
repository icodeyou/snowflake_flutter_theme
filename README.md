# snowflake_flutter_theme

This is a theme that can be imported in a Flutter project.
It gives the constants and the widgets that can be used to design your ui.

## Getting started

### Import the package

Add this to your `pubspec.yaml` :

```yaml
dependencies:
  snowflake_flutter_theme:
    git:
      url: git://github.com/snowflake-project/snowflake_flutter_theme.git
      ref: main
```

### Initialize bot_toast

- Type `flutter pub add bot_toast` in your terminal

- Add this to your `main.dart` :

``` dart
MaterialApp(
      title: 'My app',
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()], //2. registered route observer
      home: XxxxPage(),
  )
```

or

``` dart
//Warning: Don't arbitrarily adjust the position of calling the BotToastInit function 
final botToastBuilder = BotToastInit();  //1. call BotToastInit 
MaterialApp(
      title: 'My app',
      builder: (context, child) {
        child = myBuilder(context,child);  //do something
        child = botToastBuilder(context,child); 
        return child;
      }, 
      navigatorObservers: [BotToastNavigatorObserver()], //2. registered route observer
      home: XxxxPage(),
  )
```
