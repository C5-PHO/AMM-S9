import 'package:flutter/material.dart';

class MaxNavigation extends StatelessWidget {
  const MaxNavigation({super.key, required this.selectedIndex});
  final int selectedIndex;
  static const routes = ['/', '/catalogo', '/planes'];

  @override
  Widget build(BuildContext context) => NavigationBar(
    selectedIndex: selectedIndex,
    backgroundColor: const Color(0xFF101127),
    indicatorColor: const Color(0xFF1648CC),
    onDestinationSelected: (index) {
      if (index == selectedIndex) return;
      // Las pestañas son destinos principales; los detalles se apilan encima.
      Navigator.pushNamedAndRemoveUntil(context, routes[index], (_) => false);
    },
    destinations: const [
      NavigationDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: 'Inicio',
      ),
      NavigationDestination(
        icon: Icon(Icons.movie_outlined),
        selectedIcon: Icon(Icons.movie),
        label: 'Catálogo',
      ),
      NavigationDestination(
        icon: Icon(Icons.credit_card_outlined),
        selectedIcon: Icon(Icons.credit_card),
        label: 'Planes',
      ),
    ],
  );
}
