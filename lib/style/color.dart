import 'package:flutter/material.dart';

class ThemeStyle {
  Color primary;
  Color primaryAlt;
  Color primarySplash;
  Color primaryDark;
  Color secondary;
  Color secondaryAlt;
  Color secondarySplash;

  ThemeStyle({
    required this.primary,
    required this.primaryAlt,
    required this.primarySplash,
    required this.primaryDark,
    required this.secondary,
    required this.secondaryAlt,
    required this.secondarySplash,
  });
}

int colorIndex = 0;

List<ThemeStyle> themeStyle = [
  ThemeStyle(
    primary: const Color.fromARGB(255, 31, 114, 16),
    primaryAlt: const Color.fromARGB(255, 70, 210, 45),
    primarySplash: Color.fromARGB(255, 182, 255, 170),
    primaryDark: Color.fromARGB(255, 11, 68, 1),
    secondary: const Color.fromARGB(255, 205, 36, 93),
    secondaryAlt: const Color.fromARGB(255, 229, 72, 124),
    secondarySplash: const Color.fromARGB(255, 255, 139, 178),
  ),
];


Color get primary {
  return themeStyle[colorIndex].primary;
}

Color get primarySplash {
  return themeStyle[colorIndex].primarySplash;
}

Color get primaryAlt {
  return themeStyle[colorIndex].primaryAlt;
}

Color get primaryDark {
  return themeStyle[colorIndex].primaryDark;
}

Color get secondary {
  return themeStyle[colorIndex].secondary;
}

Color get secondaryAlt{
  return themeStyle[colorIndex].secondaryAlt;
}

Color get secondarySplash {
  return themeStyle[colorIndex].secondarySplash;
}

Color get warning {
  return const Color.fromARGB(255, 255, 237, 77);
}

Color get danger {
  return const Color.fromARGB(255, 255, 81, 81);
}

Color get dangerSplash {
  return Color.fromARGB(255, 255, 126, 126);
}

Color get safe {
  return const Color.fromARGB(255, 134, 241, 108);
}

Color get safeAlt {
  return const Color.fromARGB(255, 66, 185, 36);
}

Color get grey1 {
  return const Color.fromARGB(255, 136, 136, 136);
}

Color get grey2 {
  return const Color.fromARGB(255, 217, 217, 217);
}