import 'package:flutter/material.dart';
import 'package:golrang_task/core/router/app_router.dart';
import '';

class AppStartup extends StatelessWidget {
  const AppStartup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Golrang',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfff5f5f6),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        fontFamily: "iranSans"
      ),
      routerConfig: AppRouter.instance.router,
    );
  }
}
