import 'package:flutter/material.dart';
import 'package:un_dia_mas/core/theme/app_colors.dart';

enum WorldThemeId {
  prologue,
  fog,
  rain,
  noise,
  solitude,
  storm,
  dawn,
  forest,
  encounters,
  stars,
}

class WorldTheme {
  const WorldTheme({
    required this.id,
    required this.name,
    required this.backgroundColor,
    required this.atmosphereColor,
    required this.lightRadius,
    required this.fogDensity,
    required this.particleCount,
  });

  final WorldThemeId id;
  final String name;
  final Color backgroundColor;
  final Color atmosphereColor;
  final double lightRadius;
  final double fogDensity;
  final int particleCount;

  static const WorldTheme prologue = WorldTheme(
    id: WorldThemeId.prologue,
    name: 'Prólogo',
    backgroundColor: WorldColors.prologueVoid,
    atmosphereColor: Color(0xFF0D0D14),
    lightRadius: 120,
    fogDensity: 0,
    particleCount: 40,
  );

  static const WorldTheme fog = WorldTheme(
    id: WorldThemeId.fog,
    name: 'La Niebla',
    backgroundColor: WorldColors.fogBase,
    atmosphereColor: WorldColors.fogMist,
    lightRadius: 90,
    fogDensity: 0.85,
    particleCount: 60,
  );

  static WorldTheme fromId(String id) => switch (id) {
        'prologue' => prologue,
        'fog' => fog,
        'rain' => fog.copyWith(
            id: WorldThemeId.rain,
            name: 'La Lluvia',
            backgroundColor: WorldColors.rainBase,
          ),
        _ => prologue,
      };

  WorldTheme copyWith({
    WorldThemeId? id,
    String? name,
    Color? backgroundColor,
    Color? atmosphereColor,
    double? lightRadius,
    double? fogDensity,
    int? particleCount,
  }) {
    return WorldTheme(
      id: id ?? this.id,
      name: name ?? this.name,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      atmosphereColor: atmosphereColor ?? this.atmosphereColor,
      lightRadius: lightRadius ?? this.lightRadius,
      fogDensity: fogDensity ?? this.fogDensity,
      particleCount: particleCount ?? this.particleCount,
    );
  }
}
