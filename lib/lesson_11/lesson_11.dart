import 'package:flutter/material.dart';

class LessonEleven extends StatelessWidget {
  const LessonEleven({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson Eleven'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: Column(
          spacing: 10,
          children: [
            Container(
              width: 100,
              height: 300,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 300,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 300,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 300,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
