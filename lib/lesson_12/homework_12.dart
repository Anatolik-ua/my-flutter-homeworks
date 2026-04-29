import 'package:flutter/material.dart';

class HomeworkTwelveScreen extends StatelessWidget {
  const HomeworkTwelveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF2FC),
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Color(0xFF5E5F61),
        ),
        title: const Text(
          'Оцінка візиту до магазину',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        titleSpacing: 8.0,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [SizedBox(width: 16)],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Тут буде все інше (зірки, картки ...)
            Text('Тут буде основний контент'),
          ],
        ),
      ),

      bottomNavigationBar: ColoredBox(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: 34,
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1135BA),
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: const Text(
              'Надіслати',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
