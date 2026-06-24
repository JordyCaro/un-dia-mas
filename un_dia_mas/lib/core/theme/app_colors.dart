import 'package:flutter/material.dart';

/// Colores de La Chispa / La Luz — dibujados por código.
abstract final class ChispaColors {
  static const Color coreCenter = Color(0xFFFFF4D6);
  static const Color coreEdge = Color(0xFFFF9A5C);
  static const Color corona = Color(0xFFFFB347);
  static const Color halo = Color(0xFFFFD89B);
  static const Color spark = Color(0xFFFFE8B0);
  static const Color trail = Color(0xFFFFD89B);
}

/// Fondos y atmósfera por mundo.
abstract final class WorldColors {
  static const Color prologueVoid = Color(0xFF050508);
  static const Color fogBase = Color(0xFF1A2332);
  static const Color fogMist = Color(0xFF8B9CB3);
  static const Color rainBase = Color(0xFF1E2A38);
  static const Color uiText = Color(0xFFE8E4DC);
  static const Color uiTextDim = Color(0xFF9A9590);
}

abstract final class AppColors {
  static const Color background = Color(0xFF0A0A0F);
  static const Color surface = Color(0xFF14141C);
  static const Color accent = ChispaColors.halo;
  static const Color primaryText = WorldColors.uiText;
  static const Color secondaryText = WorldColors.uiTextDim;
}
