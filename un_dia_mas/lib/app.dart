import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:un_dia_mas/core/theme/app_theme.dart';
import 'package:un_dia_mas/features/home/home_screen.dart';

class UnDiaMasApp extends StatelessWidget {
  const UnDiaMasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Un Día Más',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        home: const HomeScreen(),
      ),
    );
  }
}
