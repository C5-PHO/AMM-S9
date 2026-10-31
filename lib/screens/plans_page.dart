import 'package:flutter/material.dart';
import '../widgets/max_logo.dart';
import '../widgets/max_navigation.dart';
import '../widgets/section_heading.dart';
import '../widgets/demo_notice.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const MaxLogo(size: 35)),
    bottomNavigationBar: const MaxNavigation(selectedIndex: 2),
    body: SingleChildScrollView(
      child: Column(
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
              'detail': 'Lleva tu experiencia de entretenimiento más lejos.',
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
    ),
  );
}
