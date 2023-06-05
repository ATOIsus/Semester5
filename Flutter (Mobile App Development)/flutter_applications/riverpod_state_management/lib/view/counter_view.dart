import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = StateProvider<int>((ref) => 10);

class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body:  Center(
        child: Text(
          ref.read(numberProvider).toString(),
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          ref.read(numberProvider.notifier).state+=2
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}