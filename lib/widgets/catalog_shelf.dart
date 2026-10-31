import 'package:flutter/material.dart';
import '../models/catalog_title.dart';
import 'artwork.dart';

class CatalogShelf extends StatelessWidget {
  const CatalogShelf({super.key, required this.items, this.landscape = false});
  final List<CatalogTitle> items;
  final bool landscape;
  @override
  Widget build(BuildContext context) => SizedBox(
    height: landscape ? 190 : 285,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: items.length,
      separatorBuilder: (_, index) => const SizedBox(width: 14),
      itemBuilder: (context, index) {
        final item = items[index];
        return SizedBox(
          width: landscape ? 235 : 160,
          child: Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, '/detalle', arguments: item),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Artwork(path: item.image, label: item.title),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
