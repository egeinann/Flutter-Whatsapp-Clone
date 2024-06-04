import 'package:flutter/material.dart';

class ThemeClass {
  // *** LIGHT THEME ***
  static ThemeData lightTheme = ThemeData.light().copyWith(
    dialogBackgroundColor: const Color.fromARGB(
          255, 182, 241, 183),
    scaffoldBackgroundColor: const Color.fromARGB(
        255, 245, 245, 245), // Scaffold widget'ının arka plan rengi
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 245, 245, 245), // AppBar'ın arka plan rengi
      iconTheme:
          IconThemeData(color: Colors.black), // AppBar'daki ikonların rengi
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium:
          TextStyle(color: Color.fromARGB(255, 0, 0, 0)), // Birinci metin rengi
      bodySmall: TextStyle(
          color: Color.fromARGB(255, 28, 28, 28)), // İkinci metin rengi
    ),
    iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 38, 38, 38)), // İkonların genel rengi
    tabBarTheme: const TabBarTheme(labelColor: Color.fromARGB(255, 10, 92, 14)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(
            255, 193, 252, 194)), // Butonun arka plan rengi
        foregroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 18, 89, 36)), // Butonun metin rengi
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 62, 62, 62)), // Metin rengi
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
              color: Color.fromARGB(255, 226, 226, 226)), // Kenar çizgisi rengi
        ),
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
  );

  // *** DARK THEME ***
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    dialogBackgroundColor: const Color.fromARGB(255, 1, 103, 81),
    scaffoldBackgroundColor:
        const Color(0xFF121B22), // Scaffold widget'ının arka plan rengi
    appBarTheme: const AppBarTheme(
      color: Color(0xFF121B22), // AppBar'ın arka plan rengi
      iconTheme:
          IconThemeData(color: Colors.white), // AppBar'daki ikonların rengi
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white), // Birinci metin rengi
      bodySmall: TextStyle(
          color: Color.fromARGB(255, 187, 187, 187)), // İkinci metin rengi
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    tabBarTheme:
        const TabBarTheme(labelColor: Color.fromARGB(255, 198, 248, 226)),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.grey[900], // Düğmenin arka plan rengi
      textTheme: ButtonTextTheme.primary, // Düğme metninin rengi
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFF00A884)), // Butonun arka plan rengi
        foregroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 255, 255, 255)), // Butonun metin rengi
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all<Color>(Colors.white), // Metin rengi,
        side: MaterialStateProperty.all(
          const BorderSide(color: Color.fromARGB(255, 54, 54, 54)),
        ),
      ),
    ),
    bottomAppBarTheme:
        const BottomAppBarTheme(color: Color.fromARGB(255, 7, 13, 18)),
  );
}

// ThemeData genişletmesi TextField - LIGHT THEME
extension MyLightThemeDataExtension on ThemeData {
  Color get appBarColorLight => const Color.fromARGB(
      255, 245, 245, 245); // Light tema için AppBar'ın rengi
}

// ThemeData genişletmesi TextField - DARK THEME
extension MyDarkThemeDataExtension on ThemeData {
  Color get appBarColorDark =>
      const Color.fromARGB(255, 41, 54, 58); // Dark tema için AppBar'ın rengi
}
