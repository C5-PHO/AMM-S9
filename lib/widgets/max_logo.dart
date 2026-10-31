import 'package:flutter/material.dart';

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
