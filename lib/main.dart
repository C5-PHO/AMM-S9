import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

const maxBlue = Color(0xFF003BFF);
const pageColor = Color(0xFF08091B);

// Cambia aquí los títulos y las rutas si deseas usar otras imágenes.
const titles = <Map<String, String>>[
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Max · Laboratorio 09',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: pageColor,
      fontFamily: 'Lato',
      colorScheme: const ColorScheme.dark(
        primary: maxBlue,
        surface: Color(0xFF14162C),
      ),
      cardTheme: const CardThemeData(color: Color(0xFF14162C)),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: maxBlue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    ),
    routes: {'/': (_) => const MaxPage()},
    onGenerateRoute: (settings) {
      if (settings.name == '/detalle' &&
          settings.arguments is Map<String, String>) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) =>
              TitlePage(item: settings.arguments! as Map<String, String>),
        );
      }
      return null;
    },
  );
}

class MaxLogo extends StatelessWidget {
  const MaxLogo({super.key, this.size = 42});
  final double size;
  @override
  Widget build(BuildContext context) => Text(
    'max',
    semanticsLabel: 'Max',
    style: TextStyle(
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w900,
      fontSize: size,
      letterSpacing: -3,
      height: 1.2,
    ),
  );
}

class MaxPage extends StatefulWidget {
  const MaxPage({super.key});
  @override
  State<MaxPage> createState() => _MaxPageState();
}

class _MaxPageState extends State<MaxPage> {
  final scrollController = ScrollController();
  final plansKey = GlobalKey();
  final catalogKey = GlobalKey();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void goTo(GlobalKey key) {
    final target = key.currentContext;
    if (target != null) {
      Scrollable.ensureVisible(
        target,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: const Color(0xFF08091B),
      surfaceTintColor: Colors.transparent,
      title: const MaxLogo(size: 35),
      actions: [
        TextButton(
          onPressed: () => showLogin(context),
          child: const Text(
            'INGRESA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              letterSpacing: 1,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: FilledButton(
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 14),
            ),
            onPressed: () => goTo(plansKey),
            child: const Text('SUSCRÍBETE', style: TextStyle(fontSize: 10)),
          ),
        ),
      ],
    ),
    body: SingleChildScrollView(
      controller: scrollController,
      child: Column(
        // Pocas secciones: se mantienen montadas para navegar a ellas con GlobalKey.
        children: [
          Stack(
            children: [
              const Positioned.fill(
                child: Artwork(
                  path: 'assets/images/max/portada.jpg',
                  label: 'Historias extraordinarias',
                ),
              ),
              const Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0x4408091B), Color(0xBB08091B), pageColor],
                    ),
                  ),
                ),
              ),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 100, 24, 50),
                    child: Column(
                      children: [
                        const MaxLogo(size: 100),
                        const SizedBox(height: 16),
                        const Text(
                          'MUCHO MÁS QUE VER.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'BebasNeue',
                            fontSize: 43,
                            height: 1.08,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Historias que te atrapan.\nPersonajes que se quedan contigo.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 19,
                            height: 1.5,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 26),
                        FilledButton(
                          onPressed: () => goTo(plansKey),
                          child: const Text('ELIGE TU PLAN'),
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'Series icónicas, grandes películas y nuevos favoritos.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 13,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 38),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 22,
                          runSpacing: 12,
                          children: [
                            for (final brand in [
                              'HBO',
                              'WARNER BROS.',
                              'DC',
                              'discovery',
                            ])
                              Text(
                                brand,
                                style: const TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13,
                                  color: Colors.white70,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        TextButton(
                          onPressed: () => goTo(catalogKey),
                          child: const Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Text(
                                'EXPLORA EL CATÁLOGO',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white70,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            key: catalogKey,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 36, 24, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: const AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Artwork(
                      path:
                          'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=1000&q=80',
                      label: 'El cine, donde tú estés',
                      network: true,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Una gran pantalla.\nO la que llevas contigo.',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 27,
                    height: 1.2,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Disfruta tus historias favoritas en TV, computadora, tablet y celular.',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 18),
                for (final feature in const [
                  (
                    Icons.devices_rounded,
                    'Mira donde quieras',
                    'Entretenimiento en tus dispositivos favoritos.',
                  ),
                  (
                    Icons.person_outline_rounded,
                    'Un espacio para cada quien',
                    'Descubre historias para toda la familia.',
                  ),
                ])
                  Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: Icon(feature.$1, color: const Color(0xFF7197FF)),
                      title: Text(
                        feature.$2,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          feature.$3,
                          style: const TextStyle(color: Colors.white60),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Column(
            key: plansKey,
            children: [
              const SectionHeading(
                eyebrow: 'ENTRETENIMIENTO A TU MEDIDA',
                title: 'Elige cómo quieres ver Max.',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Planes ilustrativos para esta maqueta académica.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ),
              const SizedBox(height: 20),
              for (final plan in const [
                {
                  'name': 'Básico con anuncios',
                  'detail': 'Disfruta tus historias con pausas publicitarias.',
                  'icon': 'play',
                },
                {
                  'name': 'Estándar',
                  'detail': 'Una experiencia para tus momentos favoritos.',
                  'icon': 'tv',
                },
                {
                  'name': 'Platino',
                  'detail':
                      'Lleva tu experiencia de entretenimiento más lejos.',
                  'icon': 'star',
                },
              ])
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 14),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: BorderSide(
                        color: plan['name'] == 'Estándar'
                            ? const Color(0xFF6387FF)
                            : Colors.white12,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            plan['name']!,
                            style: const TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            plan['detail']!,
                            style: const TextStyle(
                              color: Colors.white60,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () => demoNotice(
                                context,
                                'Seleccionaste ${plan['name']}',
                              ),
                              child: const Text('SELECCIONAR PLAN'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SectionHeading(
            eyebrow: 'RESOLVEMOS TUS DUDAS',
            title: 'Preguntas frecuentes',
          ),
          for (final faq in const [
            (
              '¿Qué es Max?',
              'Una plataforma de streaming que reúne series, películas y otras historias para distintos gustos.',
            ),
            (
              '¿En qué dispositivos puedo verlo?',
              'En dispositivos compatibles como smart TV, celulares, tablets y computadoras con conexión a internet.',
            ),
            (
              '¿Cómo elijo un plan?',
              'En esta maqueta puedes explorar los planes y seleccionar uno para ver una confirmación de demostración.',
            ),
            (
              '¿Esta aplicación reproduce películas?',
              'No. Es un proyecto académico de diseño de interfaces con Flutter.',
            ),
          ])
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                title: Text(faq.$1, style: const TextStyle(fontSize: 17)),
                childrenPadding: const EdgeInsets.only(bottom: 20),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    faq.$2,
                    style: const TextStyle(color: Colors.white60, height: 1.7),
                  ),
                ],
              ),
            ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 38),
            child: Column(
              children: [
                MaxLogo(size: 40),
                SizedBox(height: 16),
                Text(
                  'Proyecto individual · Laboratorio 09',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
                SizedBox(height: 8),
                Text(
                  'Maqueta académica inspirada en Max.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white38, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({super.key, required this.eyebrow, required this.title});
  final String eyebrow;
  final String title;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(24, 40, 24, 22),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow,
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 10,
            letterSpacing: 2,
            color: Color(0xFF8AA7FF),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 27,
            fontWeight: FontWeight.w800,
            height: 1.25,
          ),
        ),
      ],
    ),
  );
}

class Artwork extends StatelessWidget {
  const Artwork({
    super.key,
    required this.path,
    required this.label,
    this.network = false,
  });
  final String path;
  final String label;
  final bool network;
  @override
  Widget build(BuildContext context) {
    Widget fallback() => Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF193EB0), Color(0xFF181A50), Color(0xFF0C0D22)],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Text(
            label,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'BebasNeue',
              fontSize: 28,
              color: Colors.white38,
            ),
          ),
        ),
      ),
    );
    return network
        ? Image.network(
            path,
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (_, error, stack) => fallback(),
            loadingBuilder: (_, child, progress) =>
                progress == null ? child : fallback(),
          )
        : Image.asset(
            path,
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (_, error, stack) => fallback(),
          );
  }
}

class CatalogShelf extends StatelessWidget {
  const CatalogShelf({super.key, required this.items, this.landscape = false});
  final List<Map<String, String>> items;
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
                    child: Artwork(path: item['image']!, label: item['title']!),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      item['title']!,
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

class TitlePage extends StatelessWidget {
  const TitlePage({super.key, required this.item});
  final Map<String, String> item;
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
            child: Artwork(path: item['image']!, label: item['title']!),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          item['title']!,
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(item['genre']!, style: const TextStyle(color: Color(0xFF8AA7FF))),
        const SizedBox(height: 20),
        Text(
          item['description']!,
          style: const TextStyle(
            fontSize: 17,
            height: 1.7,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 24),
        FilledButton.icon(
          onPressed: () =>
              demoNotice(context, 'Vista previa de ${item['title']}'),
          icon: const Icon(Icons.play_arrow),
          label: const Text('VER AHORA'),
        ),
      ],
    ),
  );
}

void demoNotice(BuildContext context, String message) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text('$message. Demostración académica.')));
}

Future<void> showLogin(BuildContext context) async {
  final formKey = GlobalKey<FormState>();
  await showDialog<void>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('Ingresa a Max'),
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Usa un correo de ejemplo para probar la interfaz.',
                style: TextStyle(color: Colors.white60),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    RegExp(
                      r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
                    ).hasMatch(value?.trim() ?? '')
                    ? null
                    : 'Ingresa un email válido',
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Navigator.pop(dialogContext);
              demoNotice(context, 'Inicio de sesión');
            }
          },
          child: const Text('Continuar'),
        ),
      ],
    ),
  );
}
