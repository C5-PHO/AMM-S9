import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/app.dart';

void main() {
  for (final width in [320.0, 390.0]) {
    testWidgets('Max navigation and plans at $width px', (tester) async {
      tester.view.physicalSize = Size(width, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();
      expect(find.text('MUCHO MÁS QUE VER.'), findsOneWidget);
      await tester.ensureVisible(find.text('EXPLORA EL CATÁLOGO'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('EXPLORA EL CATÁLOGO'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('The Last of Us').last);
      await tester.pumpAndSettle();
      expect(find.text('Drama · Supervivencia'), findsOneWidget);
      await tester.pageBack();
      await tester.pumpAndSettle();
      await tester.tap(find.text('SUSCRÍBETE'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('SELECCIONAR PLAN').first);
      await tester.pumpAndSettle();
      expect(
        find.textContaining('Seleccionaste Básico con anuncios'),
        findsOneWidget,
      );
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('Login validates locally and FAQ expands', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    await tester.tap(find.text('INGRESA'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continuar'));
    await tester.pumpAndSettle();
    expect(find.text('Ingresa un email válido'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'alumno@example.com');
    await tester.tap(find.text('Continuar'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Inicio de sesión.'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('¿Qué es Max?'),
      500,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('¿Qué es Max?'));
    await tester.pumpAndSettle();
    expect(
      find.text(
        'Una plataforma de streaming que reúne series, películas y otras historias para distintos gustos.',
      ),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });
}
