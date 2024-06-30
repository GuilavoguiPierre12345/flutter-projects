import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/color_provider.dart';

class ColorCircle extends StatelessWidget {
  ColorCircle({super.key, required this.color});
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed:( () => context.read<ColorProvider>().changeColor(color) ),
        backgroundColor: color,
        heroTag: color,
    );
  }
}