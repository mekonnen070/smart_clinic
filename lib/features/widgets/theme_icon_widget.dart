import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_clinic/core/themes/app_theme_controller.dart';

class ThemeIconWidget extends ConsumerWidget {
  const ThemeIconWidget({super.key, required this.brightness});

  final Brightness brightness;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ThemeSwitcher.withTheme(
      builder: (context, switcher, theme) {
        return IconButton(
          onPressed: () async {
            final brightness = theme.brightness;

            switcher.changeTheme(
              theme:
                  brightness == Brightness.dark
                      ? ref.read(themeControllerProvider).lightThemeData
                      : ref.read(themeControllerProvider).darkThemeData,
            );

            ref
                .read(themeControllerProvider.notifier)
                .setThemeMode(
                  brightness == Brightness.dark
                      ? ThemeMode.light
                      : ThemeMode.dark,
                );
          },
          icon: Icon(
            brightness == Brightness.dark ? Icons.dark_mode : Icons.light_mode,
            color: Theme.of(context).buttonTheme.colorScheme?.primary,
          ),
        );
      },
    );
  }
}
