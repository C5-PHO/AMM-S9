import '../models/catalog_title.dart';

// Cambia aquí los títulos y las rutas si deseas usar otras imágenes.
const catalogMaps = <Map<String, String>>[
  {
    'title': 'The Last of Us',
    'image': 'assets/images/max/the_last_of_us.jpg',
    'genre': 'Drama · Supervivencia',
    'description':
        'Un viaje por un mundo transformado, donde los vínculos humanos son la clave para seguir adelante.',
  },
  {
    'title': 'La casa del dragón',
    'image': 'assets/images/max/la_casa_del_dragon.jpg',
    'genre': 'Fantasía · Drama',
    'description':
        'La lucha por el poder divide a una dinastía y cambia el destino de los Siete Reinos.',
  },
  {
    'title': 'The Batman',
    'image': 'assets/images/max/the_batman.jpg',
    'genre': 'Acción · Suspenso',
    'description':
        'Un misterioso caso lleva al vigilante de Gotham a explorar los secretos de la ciudad.',
  },
  {
    'title': 'Dune: Parte dos',
    'image': 'assets/images/max/dune_2.jpg',
    'genre': 'Ciencia ficción · Aventura',
    'description':
        'En las arenas de Arrakis, un joven debe elegir entre su destino y aquello que más ama.',
  },
  {
    'title': 'Harry Potter',
    'image': 'assets/images/max/harry_potter.jpg',
    'genre': 'Fantasía · Aventura',
    'description':
        'Un mundo de magia, amistad y aventuras espera al otro lado de Hogwarts.',
  },
  {
    'title': 'Friends',
    'image': 'assets/images/max/friends.jpg',
    'genre': 'Comedia',
    'description':
        'Seis amigos comparten las pequeñas y grandes historias de la vida en Nueva York.',
  },
];

final titles = catalogMaps.map(CatalogTitle.fromMap).toList(growable: false);
