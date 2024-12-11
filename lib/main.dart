import 'package:flutter/material.dart';
import 'package:golrang_task/app_startup.dart';
import 'package:golrang_task/core/dependency_injection.dart';

void main() {

  DependencyInjection().setup();

  runApp(const AppStartup());
}
