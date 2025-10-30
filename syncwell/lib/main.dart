import 'package:flutter/material.dart';
import 'package:syncwell/features/main_shell.dart';
import 'core/app/theme.dart';

void main() {
  runApp(const SyncWellApp());
}

class SyncWellApp extends StatelessWidget {
  const SyncWellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'SyncWell',
      theme: buildTheme(),
      home: const MainShell(),
    );
  }
}
