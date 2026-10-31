import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets(
    'Netflix route validates email and opens FAQ without layout errors',
    (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const MyApp());
      await tester.tap(find.text('NETFLIX'));
      await tester.pumpAndSettle();
      expect(find.byType(SignupForm), findsOneWidget);
      await tester.ensureVisible(find.text('Comenzar'));
      await tester.tap(find.text('Comenzar'));
      await tester.pumpAndSettle();
      expect(find.text('Ingresa un email válido'), findsOneWidget);
      await tester.enterText(
        find.byType(TextFormField),
        'estudiante@example.com',
      );
      await tester.ensureVisible(find.text('Comenzar'));
      await tester.tap(find.text('Comenzar'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Registro: demostración'), findsOneWidget);
      await tester.scrollUntilVisible(
        find.text('¿Qué es Netflix?'),
        400,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.tap(find.text('¿Qué es Netflix?'));
      await tester.pumpAndSettle();
      expect(
        find.text(
          'Es una plataforma de streaming con películas, series y documentales.',
        ),
        findsOneWidget,
      );
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('Prime route and back navigation work on a narrow phone', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 740);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('prime video'));
    await tester.pumpAndSettle();
    expect(find.text('Grandes historias.\nUn solo lugar.'), findsOneWidget);
    await tester.drag(find.byType(ListView).first, const Offset(0, -400));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Únete a Prime'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Suscripción a Prime:'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.scrollUntilVisible(
      find.byTooltip('Volver al menú'),
      -400,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.byTooltip('Volver al menú'));
    await tester.pumpAndSettle();
    expect(find.text('TU PRÓXIMA HISTORIA'), findsOneWidget);
  });
}
