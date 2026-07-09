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
