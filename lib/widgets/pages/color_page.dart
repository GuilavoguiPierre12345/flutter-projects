import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/color_provider.dart';
import 'package:provider_app/widgets/simple_widgets/color_circle.dart';

class ColorPage extends StatelessWidget {
  ColorPage({super.key});
  List<MaterialColor> colors = Colors.primaries;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
             Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("La couleur actuelle :", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 24)),
                ColorCircle(color: context.watch<ColorProvider>().color),
              ],
            ),
            const Divider(),
            Expanded(
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: colors.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3
                    ),
                    itemBuilder: (ctx, index) {
                        return Center(
                          child: ColorCircle(color: colors[index]),
                        );
                    }
                )
            )
          ],
        ),
    );
  }
}