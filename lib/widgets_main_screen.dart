import 'package:flutter/material.dart';
import 'package:flutter_lab/navigation/app_router.dart';
import 'package:go_router/go_router.dart';

class WidgetsScreen extends StatelessWidget {
  const WidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homeworks'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavigationCard(
              title: 'Homework 11',
              description: 'Віджети. Частина 1',
              onTap: () => context.goNamed(AppRouter.hw11),
            ),
            NavigationCard(
              title: 'Homework 11 - Interactive',
              description: 'Виніс окремо subtas 5 для інтерактивного завдання',
              onTap: () => context.goNamed(AppRouter.hw11Interactive),
            ),
            NavigationCard(
              title: 'Homework 12',
              description: 'Оцінка візиту до магазину',
              onTap: () => context.goNamed(AppRouter.hw12),
            ),
            NavigationCard(
              title: 'Homework 13',
              description: 'Розуміння обмежень у Flutter',
              onTap: () => context.goNamed(AppRouter.hw13),
            ),
            NavigationCard(
              title: 'Homework 18',
              description: 'Реалізація CounterApp за допомогою BloC та Cubit',
              onTap: () => context.goNamed(AppRouter.hw18),
            ),
            NavigationCard(
              title: 'Homework 19',
              description: 'Оцінка нашого додатку',
              onTap: () => context.goNamed(AppRouter.hw19),
            ),
            NavigationCard(
              title: 'Homework 21',
              description: "Explicit анімація стрибка м'яча",
              onTap: () => context.goNamed(AppRouter.hw21),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationCard extends StatelessWidget {
  const NavigationCard({
    required this.title,
    required this.description,
    required this.onTap,
    super.key,
  });

  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade50,
                Colors.blue.shade100,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.blue.shade700,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
