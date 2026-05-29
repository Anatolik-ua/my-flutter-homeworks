import 'dart:math' as math; // Імпортуємо math для використання константи pi
import 'package:flutter/material.dart';

class AnimatedBallScreen extends StatefulWidget {
  const AnimatedBallScreen({super.key});

  @override
  State<AnimatedBallScreen> createState() => _AnimatedBallScreenState();
}

class _AnimatedBallScreenState extends State<AnimatedBallScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _ballAnimation;
  late Animation<double> _rotationAnimation; // Додаємо анімацію обертання

  bool _initialized = false;

  final double ballSize = 80;

  late double groundPosition;
  late double topPosition;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    // Налаштовуємо обертання: від 0 до 4 * pi (720 градусів)
    // Curves.easeInOut забезпечує повільний старт, розгін в середині та сповільнення в кінці
    _rotationAnimation =
        Tween<double>(
          begin: 0.0,
          end: 2 * 2 * math.pi,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          ),
        );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      final media = MediaQuery.of(context);

      final screenHeight = media.size.height;
      final statusBar = media.padding.top;
      final appBar = AppBar().preferredSize.height;

      // Верхня межа
      topPosition = statusBar + appBar + 20;

      // Верх темної плашки
      groundPosition = screenHeight - 256 - ballSize;

      _ballAnimation = TweenSequence<double>([
        // Політ вгору
        TweenSequenceItem(
          tween:
              Tween(
                begin: groundPosition,
                end: topPosition,
              ).chain(
                CurveTween(
                  curve: Curves.easeOutCubic,
                ),
              ),
          weight: 45,
        ),

        // Падіння вниз з відскоком
        TweenSequenceItem(
          tween:
              Tween(
                begin: topPosition,
                end: groundPosition,
              ).chain(
                CurveTween(
                  curve: Curves.bounceOut,
                ),
              ),
          weight: 55,
        ),
      ]).animate(_controller);

      _initialized = true;
    }
  }

  void _jump() {
    if (_controller.isAnimating) return;

    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Animated Ball'),
        backgroundColor: const Color(0xFF0D1828),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Фон
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF00263B),
                    Color(0xFF00476D),
                  ],
                ),
              ),
            ),
          ),

          // Нижня плашка
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 256,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF002F49),
                    Color(0xFF00141E),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // М'яч
          if (_initialized)
            AnimatedBuilder(
              // Слухаємо обидві анімації через базовий контролер
              animation: _controller,
              builder: (context, child) {
                return Positioned(
                  top: _ballAnimation.value,
                  left: MediaQuery.of(context).size.width / 2 - ballSize / 2,
                  child: GestureDetector(
                    onTap: _jump,
                    child: Transform.rotate(
                      angle: _rotationAnimation.value, // Закручуємо м'яч
                      child: Container(
                        width: ballSize,
                        height: ballSize,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/ball.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
