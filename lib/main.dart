import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

const netflixRed = Color(0xFFE50914);
const primeBlue = Color(0xFF00A8E1);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Streaming · Lab 09',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF08090D),
      fontFamily: 'Lato',
      colorScheme: const ColorScheme.dark(primary: netflixRed),
      cardTheme: const CardThemeData(color: Color(0xFF171923)),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Color(0xAA171717),
        border: OutlineInputBorder(),
      ),
    ),
    initialRoute: '/',
    routes: {
      '/': (_) => const PlatformMenu(),
      '/netflix': (_) => const NetflixPage(),
      '/prime': (_) => const PrimePage(),
    },
  );
}

class PlatformMenu extends StatelessWidget {
  const PlatformMenu({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 580),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(28),
            children: [
              const Icon(Icons.live_tv_rounded, size: 52, color: primeBlue),
              const SizedBox(height: 28),
              const Text(
                'TU PRÓXIMA HISTORIA',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'BebasNeue', fontSize: 38),
              ),
              const SizedBox(height: 8),
              const Text(
                'Elige dónde comienza.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white60, fontSize: 17),
              ),
              const SizedBox(height: 36),
              for (final platform in const [
                {
                  'name': 'NETFLIX',
                  'route': '/netflix',
                  'subtitle': 'Películas, series y mucho más',
                },
                {
                  'name': 'prime video',
                  'route': '/prime',
                  'subtitle': 'Grandes historias. Un solo lugar.',
                },
              ])
                Card(
                  margin: const EdgeInsets.only(bottom: 18),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(24),
                    title: Text(
                      platform['name']!,
                      style: TextStyle(
                        fontFamily: platform['route'] == '/netflix'
                            ? 'BebasNeue'
                            : 'OpenSans',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: platform['route'] == '/netflix'
                            ? netflixRed
                            : primeBlue,
                      ),
                    ),
                    subtitle: Text(platform['subtitle']!),
                    trailing: const Icon(Icons.arrow_forward_rounded),
                    onTap: () =>
                        Navigator.pushNamed(context, platform['route']!),
                  ),
                ),
              const SizedBox(height: 20),
              const Text(
                'LAB 09  /  APLICACIONES MULTIPLATAFORMA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 2,
                  color: Colors.white38,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

// Las rutas locales se mantienen en un solo lugar para reemplazar las imágenes.
const netflixTitles = [
  {
    'title': 'Stranger Things',
    'image': 'assets/images/netflix/stranger_things.jpg',
  },
  {'title': 'Merlina', 'image': 'assets/images/netflix/merlina.jpg'},
  {
    'title': 'El juego del calamar',
    'image': 'assets/images/netflix/el_juego_del_calamar.jpg',
  },
  {
    'title': 'La casa de papel',
    'image': 'assets/images/netflix/la_casa_de_papel.jpg',
  },
];
const primeTitles = [
  {'title': 'The Boys', 'image': 'assets/images/prime/the_boys.jpg'},
  {'title': 'Fallout', 'image': 'assets/images/prime/fallout.jpg'},
  {
    'title': 'Los anillos de poder',
    'image': 'assets/images/prime/los_anillos_de_poder.jpg',
  },
  {'title': 'Reacher', 'image': 'assets/images/prime/reacher.jpg'},
];

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key, required this.prime});
  final bool prime;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(4, 8, 16, 8),
    child: Row(
      children: [
        IconButton(
          tooltip: 'Volver al menú',
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        Expanded(
          child: Text(
            prime ? 'prime video' : 'NETFLIX',
            style: TextStyle(
              fontFamily: prime ? 'OpenSans' : 'BebasNeue',
              fontWeight: FontWeight.bold,
              color: prime ? Colors.white : netflixRed,
              fontSize: prime ? 19 : 30,
            ),
          ),
        ),
        PopupMenuButton<String>(
          tooltip: 'Idioma',
          icon: const Icon(Icons.language, size: 22),
          onSelected: (_) =>
              demoNotice(context, 'Idioma de la maqueta: español'),
          itemBuilder: (_) => [
            const PopupMenuItem(value: 'es', child: Text('Español')),
          ],
        ),
        TextButton(
          onPressed: () => demoNotice(context, 'Inicio de sesión'),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: prime ? const Color(0xFF183043) : netflixRed,
          ),
          child: const Text('Iniciar sesión', style: TextStyle(fontSize: 12)),
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
    Widget placeholder() => Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF263B51), Color(0xFF301426), Color(0xFF10151F)],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.movie_outlined, size: 36, color: Colors.white30),
              const SizedBox(height: 10),
              Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'BebasNeue',
                  fontSize: 24,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return network
        ? Image.network(
            path,
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (_, error, stack) => placeholder(),
            loadingBuilder: (_, child, progress) =>
                progress == null ? child : placeholder(),
          )
        : Image.asset(
            path,
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (_, error, stack) => placeholder(),
          );
  }
}

class NetflixPage extends StatelessWidget {
  const NetflixPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: ListView(
        children: [
          const BrandHeader(prime: false),
          SizedBox(
            height: 700,
            child: Stack(
              fit: StackFit.expand,
              children: [
                const Artwork(
                  path: 'assets/images/netflix/portada.jpg',
                  label: 'NETFLIX',
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x55000000),
                        Color(0xDD000000),
                        Color(0xFF08090D),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 620),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Películas y series\nilimitadas y mucho más',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 36,
                              height: 1.12,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Disfruta donde quieras. Cancela cuando quieras.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 17),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            '¿Quieres ver Netflix ya? Ingresa tu email para comenzar.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white70),
                          ),
                          const SizedBox(height: 18),
                          const SignupForm(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const ContentShelf(
            title: 'Tendencias',
            titles: netflixTitles,
            ranked: true,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 26, 24, 12),
            child: Text(
              'Más motivos para unirte',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          for (final benefit in const [
            (
              'Disfruta en tu TV',
              'Tus historias favoritas en la pantalla grande.',
              Icons.tv_rounded,
            ),
            (
              'Descarga y lleva tus favoritos',
              'Siempre tendrás algo para ver, incluso sin conexión.',
              Icons.download_rounded,
            ),
            (
              'Disfruta donde quieras',
              'En tu teléfono, tablet, laptop y TV.',
              Icons.devices_rounded,
            ),
            (
              'Crea perfiles para niños',
              'Un espacio de aventuras para los más pequeños.',
              Icons.face_rounded,
            ),
          ])
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            benefit.$1,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            benefit.$2,
                            style: const TextStyle(color: Colors.white60),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(benefit.$3, size: 36, color: const Color(0xFFE58ED1)),
                  ],
                ),
              ),
            ),
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 30, 24, 12),
            child: Text(
              'Preguntas frecuentes',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          for (final faq in const [
            (
              '¿Qué es Netflix?',
              'Es una plataforma de streaming con películas, series y documentales.',
            ),
            (
              '¿Dónde puedo ver Netflix?',
              'En dispositivos compatibles conectados a internet: teléfonos, tablets, computadoras y televisores.',
            ),
            (
              '¿Cómo cancelo?',
              'La membresía se administra desde la cuenta de Netflix. Esta aplicación es una maqueta académica.',
            ),
            (
              '¿Qué puedo ver?',
              'Una variedad de series, películas, documentales y contenido familiar.',
            ),
          ])
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              child: ExpansionTile(
                backgroundColor: const Color(0xFF252525),
                collapsedBackgroundColor: const Color(0xFF252525),
                title: Text(faq.$1),
                childrenPadding: const EdgeInsets.all(18),
                children: [Text(faq.$2)],
              ),
            ),
          const PageFooter(brand: 'Netflix'),
        ],
      ),
    ),
  );
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Form(
    key: formKey,
    child: Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(labelText: 'Email'),
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          validator: (value) =>
              RegExp(
                r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
              ).hasMatch(value?.trim() ?? '')
              ? null
              : 'Ingresa un email válido',
        ),
        const SizedBox(height: 14),
        FilledButton.icon(
          style: FilledButton.styleFrom(
            backgroundColor: netflixRed,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              demoNotice(context, 'Registro');
            }
          },
          icon: const Icon(Icons.chevron_right),
          iconAlignment: IconAlignment.end,
          label: const Text(
            'Comenzar',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

class PrimePage extends StatelessWidget {
  const PrimePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFF00050D),
    body: SafeArea(
      child: ListView(
        children: [
          const BrandHeader(prime: true),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text(
                  'Inicio',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 24),
                TextButton(
                  onPressed: () => demoNotice(context, 'Películas'),
                  child: const Text(
                    'Películas',
                    style: TextStyle(color: Colors.white60),
                  ),
                ),
                TextButton(
                  onPressed: () => demoNotice(context, 'Series'),
                  child: const Text(
                    'Series',
                    style: TextStyle(color: Colors.white60),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 700,
            child: Stack(
              fit: StackFit.expand,
              children: [
                const Artwork(
                  path: 'assets/images/prime/portada.jpg',
                  label: 'PRIME ORIGINALS',
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x2200050D),
                        Color(0xCC00050D),
                        Color(0xFF00050D),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(28),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'BIENVENIDO A PRIME VIDEO',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 11,
                              color: primeBlue,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Grandes historias.\nUn solo lugar.',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 36,
                              height: 1.12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 18),
                          const Text(
                            'Descubre películas, series y producciones originales que no querrás perderte.',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              color: Colors.white70,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 24),
                          FilledButton(
                            onPressed: () =>
                                demoNotice(context, 'Suscripción a Prime'),
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 22,
                                vertical: 18,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Únete a Prime',
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 22),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const ContentShelf(
            title: 'Originales y exclusivos',
            titles: primeTitles,
            prime: true,
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Una experiencia de cine',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: const SizedBox(
                    height: 180,
                    child: Artwork(
                      network: true,
                      path:
                          'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=1000&q=80',
                      label: 'El cine, en casa',
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Tu entretenimiento, a tu manera',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Disfruta desde tus dispositivos favoritos y descubre tu próxima gran historia.',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    height: 1.6,
                    color: Colors.white60,
                  ),
                ),
                const SizedBox(height: 20),
                for (final feature in const [
                  (
                    Icons.devices,
                    'Mira donde quieras',
                    'TV, móvil, tablet o computadora.',
                  ),
                  (
                    Icons.download_outlined,
                    'Descarga tus favoritos',
                    'Disfruta contenido sin conexión.',
                  ),
                ])
                  Card(
                    child: ListTile(
                      leading: Icon(feature.$1, color: primeBlue),
                      title: Text(feature.$2),
                      subtitle: Text(feature.$3),
                    ),
                  ),
              ],
            ),
          ),
          const PageFooter(brand: 'Prime Video'),
        ],
      ),
    ),
  );
}

class ContentShelf extends StatelessWidget {
  const ContentShelf({
    super.key,
    required this.title,
    required this.titles,
    this.ranked = false,
    this.prime = false,
  });
  final String title;
  final List<Map<String, String>> titles;
  final bool ranked;
  final bool prime;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: prime ? 'OpenSans' : 'Lato',
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: prime ? 180 : 235,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          scrollDirection: Axis.horizontal,
          itemCount: titles.length,
          separatorBuilder: (_, index) => const SizedBox(width: 14),
          itemBuilder: (context, index) {
            final item = titles[index];
            return SizedBox(
              width: prime ? 240 : 145,
              child: Card(
                margin: EdgeInsets.zero,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => showDialog<void>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(item['title']!),
                      content: const Text(
                        'Vista de demostración del catálogo. La reproducción no está incluida en este laboratorio.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cerrar'),
                        ),
                      ],
                    ),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Artwork(path: item['image']!, label: item['title']!),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black87],
                          ),
                        ),
                      ),
                      if (ranked)
                        Positioned(
                          top: 8,
                          left: 10,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: 46,
                              shadows: [Shadow(blurRadius: 8)],
                            ),
                          ),
                        ),
                      Positioned(
                        left: 12,
                        right: 12,
                        bottom: 12,
                        child: Text(
                          item['title']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

class PageFooter extends StatelessWidget {
  const PageFooter({super.key, required this.brand});
  final String brand;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(28),
    child: Column(
      children: [
        const Divider(color: Colors.white12),
        const SizedBox(height: 18),
        Text(
          brand,
          style: const TextStyle(
            color: Colors.white60,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Proyecto académico · Interfaces de demostración',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.white38),
        ),
      ],
    ),
  );
}

void demoNotice(BuildContext context, String action) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        '$action: demostración académica, sin conexión a cuentas reales.',
      ),
    ),
  );
}
