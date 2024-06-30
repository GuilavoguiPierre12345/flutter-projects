import 'package:flutter/material.dart';
import 'package:provider_app/models/count_types.dart';
import 'package:provider_app/widgets/simple_widgets/count_button.dart';
import 'package:provider_app/widgets/simple_widgets/counter_text.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You have pushed the button this many times:'),
          CounterText(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CountButton(type: CountType.increment),
              CountButton(type: CountType.reset),
              CountButton(type: CountType.decrement),
            ],
          ),
        ],
      ),
    );
  }
}