import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/models/count_types.dart';
import 'package:provider_app/providers/color_provider.dart';
import 'package:provider_app/providers/count_provider.dart';

class CountButton extends StatelessWidget {
  CountButton({super.key, required this.type});
  CountType type;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: (() => handleAction(context) ),
        heroTag: type,
        backgroundColor:context.watch<ColorProvider>().color,
        child: type.getIcon(),
    );
  }

  handleAction(BuildContext ctx) {
    switch (type) {
      case CountType.increment : ctx.read<CountProvider>().incrementCounter(); break;
      case CountType.reset : ctx.read<CountProvider>().resetCounter(); break;
      case CountType.decrement : ctx.read<CountProvider>().decrementCounter(); break;
    }
  }
}