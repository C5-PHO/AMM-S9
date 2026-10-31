class CatalogTitle {
  const CatalogTitle({
    required this.title,
    required this.image,
    required this.genre,
    required this.description,
  });
  factory CatalogTitle.fromMap(Map<String, String> map) => CatalogTitle(
    title: map['title']!,
    image: map['image']!,
    genre: map['genre']!,
    description: map['description']!,
  );
  final String title;
  final String image;
  final String genre;
  final String description;
}
