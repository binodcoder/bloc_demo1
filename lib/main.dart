import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(colorScheme: const ColorScheme.light()).copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                onSurface: Colors.blue.withOpacity(0))),
      ),
    ));
