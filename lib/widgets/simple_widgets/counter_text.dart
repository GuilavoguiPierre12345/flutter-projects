import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/color_provider.dart';
import 'package:provider_app/providers/count_provider.dart';

class CounterText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final String text = context.watch<CountProvider>().count.toString();
    return Text(
      text,
      style: TextStyle(
        color:context.watch<ColorProvider>().color,
        fontWeight: FontWeight.bold,
        fontSize: 35,
      ),

    );

  }
}