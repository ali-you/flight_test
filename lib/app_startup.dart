import 'package:flutter/material.dart';
import 'package:golrang_task/features/main/presentation/screens/main_screen.dart';

class AppStartup extends StatelessWidget {
  const AppStartup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golrang',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
