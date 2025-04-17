// ignore_for_file: public_member_api_docs
// TODO(jeanvallon): remove this line

import 'package:flutter/material.dart';
import 'package:snowflake_flutter_theme/snowflake_flutter_theme.dart';

/// Error widget
class AppErrorDetailsWidget extends StatelessWidget {
  /// Constructor
  const AppErrorDetailsWidget({
    required this.errorTitle,
    required this.errorMessage,
    this.red = false,
    this.retryButton,
    Key? key,
  }) : super(key: key);

  final String errorTitle;
  final String errorMessage;
  final bool red;
  final ({String label, VoidCallback callback})? retryButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: ThemeSizes.m.asInsets,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText.l(
              errorTitle,
              color: red
                  ? ThemeColors.statusError
                  : ThemeColors.onBackground(context),
            ),
            AppText.m(
              errorMessage,
              color: red
                  ? ThemeColors.statusError
                  : ThemeColors.onBackground(context),
            ),
            const AppGap.m(),
            if (retryButton != null)
              AppButton.primary(
                label: retryButton!.label,
                onPressed: retryButton!.callback,
              ),
          ],
        ),
      ),
    );
  }
}
