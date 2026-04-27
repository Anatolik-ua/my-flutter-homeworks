import 'package:flutter/material.dart';

class HomeworkElevenScreen extends StatelessWidget {
  const HomeworkElevenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homework 11'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
            color: const Color(0xFF096EEA),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
