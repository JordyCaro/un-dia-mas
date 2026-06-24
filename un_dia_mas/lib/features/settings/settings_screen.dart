import 'package:flutter/material.dart';
import 'package:un_dia_mas/core/theme/app_colors.dart';
import 'package:un_dia_mas/features/settings/crisis_resources_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Un Día Más no es terapia. Es compañía.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondaryText,
                  height: 1.5,
                ),
          ),
          const SizedBox(height: 24),
          ListTile(
            leading: Icon(Icons.favorite_outline, color: ChispaColors.halo),
            title: const Text('Recursos de apoyo'),
            subtitle: const Text('Colombia'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CrisisResourcesScreen(),
                ),
              );
            },
          ),
          const Divider(height: 32),
          Text(
            'Idioma: Español',
            style: TextStyle(color: AppColors.secondaryText),
          ),
          const SizedBox(height: 8),
          Text(
            'Versión 0.1.0 — MVP',
            style: TextStyle(
              color: AppColors.secondaryText.withValues(alpha: 0.6),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
