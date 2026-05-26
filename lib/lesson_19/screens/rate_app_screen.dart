import 'package:flutter/material.dart';

class RateAppScreen extends StatelessWidget {
  const RateAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate Our App'),
        backgroundColor: Colors.purple.shade100,
      ),
      body: const Center(
        child: Text(
          'Тут буде дизайн оцінки додатку з Figma',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
