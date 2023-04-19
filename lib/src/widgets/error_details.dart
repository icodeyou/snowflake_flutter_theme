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
    required this.retryButtonLabel,
    Key? key,
    this.retryCallback,
  }) : super(key: key);

  final String errorTitle;
  final String errorMessage;
  final String retryButtonLabel;
  final VoidCallback? retryCallback;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: ThemeSizes.m.asInsets,
        child: Column(
          children: [
            AppText.l(errorTitle, color: ThemeColors.statusError),
            AppText.m(
              errorMessage,
              color: ThemeColors.statusError,
            ),
            const AppGap.m(),
            if (retryCallback != null)
              AppButton.primary(
                label: retryButtonLabel,
                onPressed: retryCallback,
              )
          ],
        ),
      ),
    );
  }
}
