import 'package:flutter/material.dart';

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
