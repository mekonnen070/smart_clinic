import 'package:flutter/cupertino.dart';

class AppColors {
  // Basic colors.
  static const Color primary = CupertinoColors.systemGreen;
  static Color secondary = CupertinoColors.systemGreen.withGreen(
    CupertinoColors.systemGreen.green - 70,
  );

  static const Color white = CupertinoColors.white;
  static const Color black = CupertinoColors.black;
}
