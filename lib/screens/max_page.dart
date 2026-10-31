import 'package:flutter/material.dart';
import '../widgets/artwork.dart';
import '../widgets/max_logo.dart';
import '../theme/app_theme.dart';
import '../widgets/section_heading.dart';
import '../widgets/login_dialog.dart';
import '../widgets/max_navigation.dart';

class MaxPage extends StatefulWidget {
  const MaxPage({super.key});
  @override
  State<MaxPage> createState() => _MaxPageState();
}

class _MaxPageState extends State<MaxPage> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
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
            onPressed: () => Navigator.pushNamed(context, '/planes'),
            child: const Text('SUSCRÍBETE', style: TextStyle(fontSize: 10)),
          ),
        ),
      ],
    ),
    bottomNavigationBar: const MaxNavigation(selectedIndex: 0),
    body: SingleChildScrollView(
      controller: scrollController,
      child: Column(
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
                          onPressed: () =>
                              Navigator.pushNamed(context, '/planes'),
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
                          onPressed: () =>
                              Navigator.pushNamed(context, '/catalogo'),
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
