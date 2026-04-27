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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ПЕРШИЙ КОНТЕЙНЕР (Синій)
            Expanded(
              child: Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xFF096EEA),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Color(0xFFFFFD71), size: 20),
                        SizedBox(width: 10),
                        Text(
                          'Привіт, Flutter!',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.star, color: Color(0xFFFFFD71), size: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // ДРУГИЙ КОНТЕЙНЕР (Зелений)
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xFF08E900),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Color(0xFFFFFD71), size: 20),
                      SizedBox(width: 10),
                      Text(
                        'Привіт, Flutter!',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.star, color: Color(0xFFFFFD71), size: 20),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // ТРЕТІЙ КОНТЕЙНЕР (Червоний)
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xFFEA090C),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Color(0xFFFFFD71), size: 20),
                      SizedBox(width: 10),
                      Text(
                        'Привіт, Flutter!',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.star, color: Color(0xFFFFFD71), size: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
