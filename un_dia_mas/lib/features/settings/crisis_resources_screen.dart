import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:un_dia_mas/core/theme/app_colors.dart';

class CrisisResource {
  const CrisisResource({
    required this.name,
    required this.description,
    required this.action,
    required this.uri,
  });

  final String name;
  final String description;
  final String action;
  final Uri uri;
}

/// Recursos de crisis — Colombia (v1).
final colombiaCrisisResources = [
  CrisisResource(
    name: 'Línea 106',
    description:
        'Orientación en salud mental y apoyo emocional. Bogotá y nivel nacional.',
    action: 'Llamar',
    uri: Uri(scheme: 'tel', path: '106'),
  ),
  CrisisResource(
    name: 'Línea de la Vida',
    description:
        'Atención en crisis emocional y prevención. Disponible 24 horas.',
    action: 'Llamar al 123',
    uri: Uri(scheme: 'tel', path: '123'),
  ),
  CrisisResource(
    name: 'Línea 106 — desde fuera de Bogotá',
    description: 'Línea gratuita nacional de orientación en salud mental.',
    action: 'Llamar',
    uri: Uri(scheme: 'tel', path: '018000113113'),
  ),
  CrisisResource(
    name: 'Ministerio de Salud',
    description: 'Información sobre rutas de atención en salud mental.',
    action: 'Abrir web',
    uri: Uri.parse('https://www.minsalud.gov.co'),
  ),
];

class CrisisResourcesScreen extends StatelessWidget {
  const CrisisResourcesScreen({super.key});

  Future<void> _open(Uri uri) async {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('No se pudo abrir $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recursos de apoyo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Si estás en crisis, no estás solo. Estos recursos están disponibles en Colombia.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondaryText,
                  height: 1.5,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Un Día Más no sustituye atención profesional.',
            style: TextStyle(
              color: ChispaColors.halo.withValues(alpha: 0.7),
              fontSize: 13,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 24),
          ...colombiaCrisisResources.map((resource) {
            return Card(
              color: AppColors.surface,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text(resource.name),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    resource.description,
                    style: const TextStyle(height: 1.4),
                  ),
                ),
                trailing: TextButton(
                  onPressed: () => _open(resource.uri),
                  child: Text(resource.action),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
