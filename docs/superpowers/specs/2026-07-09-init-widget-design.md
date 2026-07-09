# Init widget — design

## Purpose

A generic lifecycle wrapper widget so callers can hook into widget lifecycle
events declaratively, without writing a `StatefulWidget` themselves:

```dart
Init(
  onInit: () => print('Widget initialized'),
  onInitPostFrame: () => print('Widget initialized after frame'),
  onDidChangeDependencies: () => print('Dependencies changed'),
  onDispose: () => print('Widget disposed'),
  child: MyChildWidget(),
)
```

## Design

- New file `lib/src/widgets/init.dart` containing `class Init extends StatefulWidget`.
- Constructor: `const Init({super.key, this.onInit, this.onInitPostFrame, this.onDidChangeDependencies, this.onDispose, required this.child})`.
  All callbacks are optional `VoidCallback?`; `child` is a required `Widget`.
- Lifecycle mapping in the state:
  - `initState` → calls `onInit`, then registers `onInitPostFrame` via
    `WidgetsBinding.instance.addPostFrameCallback`, guarded by `mounted` so it
    never fires on an already-disposed widget.
  - `didChangeDependencies` → calls `onDidChangeDependencies` on every call,
    including the initial one right after `initState` (native Flutter
    semantics, forwarded as-is).
  - `dispose` → calls `onDispose` (before `super.dispose()`).
  - `build` → returns `child` unchanged.
- Export from `lib/snowflake_flutter_theme.dart` under the `/// Widgets`
  section, alphabetically ordered with the existing exports.

## Rejected alternatives

- `StatefulElement` subclass: needless complexity for identical behavior.
- `flutter_hooks`: adds a dependency for nothing.

## Testing

Widget tests in `test/init_test.dart`:

- Callback firing order: `onInit` → `onDidChangeDependencies` → `onInitPostFrame`.
- `onDispose` fires when the widget is removed from the tree.
- No crash when all callbacks are null.
- `onInitPostFrame` does not fire if the widget is disposed before the frame
  completes.
- `child` is rendered.
