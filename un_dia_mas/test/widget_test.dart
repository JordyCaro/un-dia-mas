import 'package:flutter_test/flutter_test.dart';
import 'package:un_dia_mas/app.dart';

void main() {
  testWidgets('App carga pantalla de inicio', (tester) async {
    await tester.pumpWidget(const UnDiaMasApp());
    expect(find.text('Un Día Más'), findsOneWidget);
    expect(find.text('La Luz'), findsOneWidget);
  });
}
