import 'package:flutter/material.dart';
import '../widgets/max_logo.dart';
import '../widgets/max_navigation.dart';
import '../widgets/section_heading.dart';
import '../widgets/catalog_shelf.dart';
import '../data/catalog_data.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const MaxLogo(size: 35)),
    bottomNavigationBar: const MaxNavigation(selectedIndex: 1),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            eyebrow: 'HISTORIAS QUE DEJAN HUELLA',
            title: 'Tu próxima obsesión está aquí.',
          ),
          CatalogShelf(items: titles.take(4).toList()),
          const SectionHeading(
            eyebrow: 'PARA CADA MOMENTO',
            title: 'Encuentra algo que te encante.',
          ),
          CatalogShelf(
            items: [titles[4], titles[5], titles[2], titles[3]],
            landscape: true,
          ),
        ],
      ),
    ),
  );
}
