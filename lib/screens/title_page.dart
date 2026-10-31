import 'package:flutter/material.dart';
import '../widgets/artwork.dart';
import '../widgets/max_logo.dart';
import '../widgets/demo_notice.dart';
import '../models/catalog_title.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({super.key, required this.item});
  final CatalogTitle item;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const MaxLogo(size: 35)),
    body: ListView(
      padding: const EdgeInsets.all(24),
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 360,
            child: Artwork(path: item.image, label: item.title),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          item.title,
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(
              Icons.movie_outlined,
              size: 18,
              color: Color(0xFF8AA7FF),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                item.genre,
                style: const TextStyle(color: Color(0xFF8AA7FF)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          item.description,
          style: const TextStyle(
            fontSize: 17,
            height: 1.7,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 24),
        FilledButton.icon(
          onPressed: () => demoNotice(context, 'Vista previa de ${item.title}'),
          icon: const Icon(Icons.play_arrow),
          label: const Text('VER AHORA'),
        ),
      ],
    ),
  );
}
