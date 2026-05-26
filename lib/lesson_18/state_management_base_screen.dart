import 'package:flutter/material.dart';
import 'package:flutter_lab/navigation/app_router.dart';
import 'package:go_router/go_router.dart';

class StateManagementBaseScreen extends StatelessWidget {
  const StateManagementBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HW-18. State Management'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Навігацію налаштуємо через goNamed у наступних кроках
                context.goNamed(AppRouter.cubitExample);
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Cubit Example', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.goNamed('bloc_example');
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Bloc Example', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
