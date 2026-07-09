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
    'fires onDidChangeDependencies once when no dependency is registered',
    (WidgetTester tester) async {
      // Native semantics: didChangeDependencies re-fires only for states
      // that registered an inherited dependency. Init registers none, so
      // the callback fires exactly once (right after onInit), even when
      // an ancestor inherited widget changes.
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
      expect(count, 1);
    },
  );

  testWidgets('does not crash when all callbacks are null',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Init(child: SizedBox()));
    await tester.pumpWidget(const SizedBox());
    expect(tester.takeException(), isNull);
  });
}
