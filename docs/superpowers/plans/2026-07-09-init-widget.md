# Init Widget Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a generic `Init` lifecycle wrapper widget (onInit, onInitPostFrame, onDidChangeDependencies, onDispose) to the snowflake_flutter_theme package.

**Architecture:** A single plain `StatefulWidget` in `lib/src/widgets/init.dart` that forwards its state lifecycle methods to optional callbacks and builds its `child` unchanged. Exported from the package barrel file.

**Tech Stack:** Flutter, flutter_test (already in dev_dependencies).

## Global Constraints

- Spec: `docs/superpowers/specs/2026-07-09-init-widget-design.md`
- Strict lints (`lib/analysis_options.yaml`): single quotes, trailing commas required, max 80 chars/line, constructors sorted first, package imports only.
- `onDidChangeDependencies` fires on EVERY `didChangeDependencies` call, including the initial one right after `initState` (native Flutter semantics, forwarded as-is).
- `onInitPostFrame` must be guarded by `mounted` so it never fires after dispose.

---

### Task 1: Init widget + export + tests

**Files:**
- Create: `lib/src/widgets/init.dart`
- Create: `test/init_test.dart`
- Modify: `lib/snowflake_flutter_theme.dart` (Widgets export section, alphabetical order)

**Interfaces:**
- Consumes: nothing from other tasks.
- Produces: `class Init extends StatefulWidget` with constructor
  `const Init({super.key, this.onInit, this.onInitPostFrame, this.onDidChangeDependencies, this.onDispose, required this.child})`,
  where all callbacks are `VoidCallback?` and `child` is `Widget`.
  Exported from `package:snowflake_flutter_theme/snowflake_flutter_theme.dart`.

- [ ] **Step 1: Write the failing tests**

Create `test/init_test.dart` (there is no `test/` directory yet — creating the file creates it):

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

void main() {
  testWidgets('renders child', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Init(child: Text('hello', textDirection: TextDirection.ltr)),
    );
    expect(find.text('hello'), findsOneWidget);
  });

  testWidgets(
    'fires onInit, onDidChangeDependencies, onInitPostFrame in order',
    (WidgetTester tester) async {
      final List<String> calls = <String>[];
      await tester.pumpWidget(
        Init(
          onInit: () => calls.add('init'),
          onInitPostFrame: () => calls.add('postFrame'),
          onDidChangeDependencies: () => calls.add('didChangeDependencies'),
          child: const SizedBox(),
        ),
      );
      expect(calls, <String>['init', 'didChangeDependencies', 'postFrame']);
    },
  );

  testWidgets('fires onDispose when removed from the tree',
      (WidgetTester tester) async {
    bool disposed = false;
    await tester.pumpWidget(
      Init(
        onDispose: () => disposed = true,
        child: const SizedBox(),
      ),
    );
    expect(disposed, isFalse);
    await tester.pumpWidget(const SizedBox());
    expect(disposed, isTrue);
  });

  testWidgets(
    'fires onDidChangeDependencies again when dependencies change',
    (WidgetTester tester) async {
      int count = 0;
      Widget build(TextDirection direction) {
        return Directionality(
          textDirection: direction,
          child: Init(
            onDidChangeDependencies: () => count++,
            child: const Text('dep'),
          ),
        );
      }

      await tester.pumpWidget(build(TextDirection.ltr));
      expect(count, 1);
      await tester.pumpWidget(build(TextDirection.rtl));
      expect(count, 2);
    },
  );

  testWidgets('does not crash when all callbacks are null',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Init(child: SizedBox()));
    await tester.pumpWidget(const SizedBox());
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'onInitPostFrame does not fire if disposed before the frame completes',
    (WidgetTester tester) async {
      bool fired = false;
      // EnginePhase.build stops the frame pipeline after the build phase,
      // so the post-frame callback scheduled in initState stays pending.
      await tester.pumpWidget(
        Init(
          onInitPostFrame: () => fired = true,
          child: const SizedBox(),
        ),
        phase: EnginePhase.build,
      );
      await tester.pumpWidget(
        const SizedBox(), // Init disposed, still no frame completed
        phase: EnginePhase.build,
      );
      await tester.pump(); // full frame: pending post-frame callback runs
      expect(fired, isFalse);
    },
  );
}
```

**Note:** the named `phase:` parameter on `pumpWidget` requires Flutter
3.24+. If the project's Flutter version predates it, pass it positionally:
`tester.pumpWidget(widget, Duration.zero, EnginePhase.build)`.

- [ ] **Step 2: Run tests to verify they fail**

Run: `flutter test test/init_test.dart`
Expected: FAIL to compile with errors like `The function 'Init' isn't defined` / `Undefined name 'Init'`.

- [ ] **Step 3: Write the implementation and export**

Create `lib/src/widgets/init.dart`:

```dart
import 'package:flutter/widgets.dart';

/// A generic wrapper widget exposing lifecycle hooks declaratively.
///
/// ```dart
/// Init(
///   onInit: () => print('Widget initialized'),
///   onInitPostFrame: () => print('Widget initialized after frame'),
///   onDidChangeDependencies: () => print('Dependencies changed'),
///   onDispose: () => print('Widget disposed'),
///   child: MyChildWidget(),
/// )
/// ```
class Init extends StatefulWidget {
  /// Constructor
  const Init({
    super.key,
    this.onInit,
    this.onInitPostFrame,
    this.onDidChangeDependencies,
    this.onDispose,
    required this.child,
  });

  /// Called synchronously in [State.initState].
  final VoidCallback? onInit;

  /// Called after the first frame has been rendered.
  ///
  /// Not called if the widget is disposed before the frame completes.
  final VoidCallback? onInitPostFrame;

  /// Called every time [State.didChangeDependencies] runs, including the
  /// initial call right after [State.initState].
  final VoidCallback? onDidChangeDependencies;

  /// Called in [State.dispose].
  final VoidCallback? onDispose;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  State<Init> createState() => _InitState();
}

class _InitState extends State<Init> {
  @override
  void initState() {
    super.initState();
    widget.onInit?.call();
    if (widget.onInitPostFrame != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          widget.onInitPostFrame?.call();
        }
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.onDidChangeDependencies?.call();
  }

  @override
  void dispose() {
    widget.onDispose?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
```

In `lib/snowflake_flutter_theme.dart`, add to the `/// Widgets` section in
alphabetical order (after `gradient.dart`, before `loader.dart`):

```dart
export 'src/widgets/init.dart';
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `flutter test test/init_test.dart`
Expected: All 6 tests PASS.

- [ ] **Step 5: Run the analyzer**

Run: `flutter analyze`
Expected: `No issues found!` (fix any lint complaints — trailing commas, line length — before committing).

- [ ] **Step 6: Commit**

```bash
git add lib/src/widgets/init.dart lib/snowflake_flutter_theme.dart test/init_test.dart
git commit -m "feat: add Init lifecycle wrapper widget"
```
