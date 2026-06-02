import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_lab/lesson_21/left_character_widget.dart';

class AnimatedBallScreen extends StatefulWidget {
  const AnimatedBallScreen({super.key});

  @override
  State<AnimatedBallScreen> createState() => _AnimatedBallScreenState();
}

class _AnimatedBallScreenState extends State<AnimatedBallScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _ballAnimation;
  late Animation<double> _rotationAnimation;

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

      topPosition = statusBar + appBar + 20;

      groundPosition = screenHeight - 256 - ballSize;

      _ballAnimation = TweenSequence<double>([
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
    final media = MediaQuery.of(context);
    final statusBar = media.padding.top;
    final appBarHeight = AppBar().preferredSize.height;
    final instructionTop = statusBar + appBarHeight + 40.0;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Animated Ball',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color(0xFF0D1828),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
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

          Positioned(
            top: instructionTop,
            left: 0,
            right: 0,
            child: const IgnorePointer(
              ignoring: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: Center(
                  child: Text(
                    "Для старту анімації натисніть на м'ячик",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF67808F),
                      fontSize: 22,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            ),
          ),

          // персонаж
          if (_initialized)
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final screenWidth = MediaQuery.of(context).size.width;
                final targetLeft =
                    screenWidth - (screenWidth / 3) - (ballSize / 2);

                return Positioned(
                  bottom: 20,
                  left: 20,
                  child: LeftCharacterWidget(
                    ballY: _ballAnimation.value,
                    ballX: targetLeft,
                  ),
                );
              },
            ),

          // мяч
          if (_initialized)
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final screenWidth = MediaQuery.of(context).size.width;

                final targetLeft =
                    screenWidth - (screenWidth / 3) - (ballSize / 2);

                return Positioned(
                  top: _ballAnimation.value,
                  left: targetLeft,
                  child: GestureDetector(
                    onTap: _jump,
                    child: Transform.rotate(
                      angle: _rotationAnimation.value,
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
