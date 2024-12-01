import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SetakSetik',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF6D4C41),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.brown,
        ).copyWith(secondary: const Color(0xFF842323)),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Raleway', color: const Color(0xFFF5F5DC)),
          bodyMedium: TextStyle(fontFamily: 'Raleway', color: const Color(0xFF3E2723)),
          bodySmall: TextStyle(fontFamily: 'Raleway', color: const Color(0xFFF5F5DC)),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFF5F5DC),
          titleTextStyle: TextStyle(
            fontFamily: 'Playfair Display',
            color: const Color(0xFF3E2723),
            fontSize: 20,
          ),
        ),
        useMaterial3: true,
        ),
      home: const HomePage(),
    );
  }
}