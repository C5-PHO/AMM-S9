import 'package:flutter/material.dart';
import 'models/catalog_title.dart';
import 'screens/max_page.dart';
import 'screens/title_page.dart';
import 'theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Max · Laboratorio 09',
    debugShowCheckedModeBanner: false,
    theme: appTheme,
    routes: {'/': (_) => const MaxPage()},
    onGenerateRoute: (settings) {
      if (settings.name == '/detalle' && settings.arguments is CatalogTitle) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => TitlePage(item: settings.arguments! as CatalogTitle),
        );
      }
      return null;
    },
  );
}
