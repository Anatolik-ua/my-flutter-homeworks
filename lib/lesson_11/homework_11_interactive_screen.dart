import 'package:flutter/material.dart';

class HomeworkElevenInteractiveScreen extends StatefulWidget {
  const HomeworkElevenInteractiveScreen({super.key});

  @override
  State<HomeworkElevenInteractiveScreen> createState() =>
      _HomeworkElevenInteractiveScreenState();
}

class _HomeworkElevenInteractiveScreenState
    extends State<HomeworkElevenInteractiveScreen> {
  bool _isFirstActive = false;
  bool _isSecondActive = false;
  bool _isThirdActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homework 11 - Interactive'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: _buildCard(
                isActive: _isFirstActive,
                baseColor: const Color(0xFF096EEA),
                activeColor: const Color(0xFF04479A),
                onTap: () => setState(() => _isFirstActive = !_isFirstActive),
              ),
            ),
            const SizedBox(height: 8),
            _buildCard(
              isActive: _isSecondActive,
              baseColor: const Color(0xFF08E900),
              activeColor: const Color(0xFF06BA00),
              onTap: () => setState(() => _isSecondActive = !_isSecondActive),
            ),
            const SizedBox(height: 8),
            _buildCard(
              isActive: _isThirdActive,
              baseColor: const Color(0xFFEA090C),
              activeColor: const Color(0xFFCE0003),
              onTap: () => setState(() => _isThirdActive = !_isThirdActive),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required bool isActive,
    required Color baseColor,
    required Color activeColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          color: isActive ? activeColor : baseColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isActive ? Icons.star : Icons.star_border,
                color: const Color(0xFFFFFD71),
              ),
              const SizedBox(width: 10),
              const Text(
                'Привіт, Flutter!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Icon(
                isActive ? Icons.star : Icons.star_border,
                color: const Color(0xFFFFFD71),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
