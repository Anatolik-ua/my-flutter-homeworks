import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/lesson_18/homework_bloc/counter_bloc.dart';

class HomeworkBlocScreen extends StatelessWidget {
  const HomeworkBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const _CounterBlocView(),
    );
  }
}

class _CounterBlocView extends StatelessWidget {
  const _CounterBlocView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Counter'),
        backgroundColor: Colors.orange.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Поточне значення лічильника:',
              style: TextStyle(fontSize: 16),
            ),
            BlocBuilder<CounterBloc, int>(
              builder: (context, count) {
                return Text(
                  '$count',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'bloc_inc',
            onPressed: () =>
                context.read<CounterBloc>().add(CounterIncrementPressed()),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'bloc_dec',
            onPressed: () =>
                context.read<CounterBloc>().add(CounterDecrementPressed()),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
