import 'dart:math' as math;
import 'package:flutter/material.dart';

class LeftCharacterWidget extends StatelessWidget {
  const LeftCharacterWidget({
    required this.ballY,
    required this.ballX,
    super.key,
  });
  final double ballY;
  final double ballX;

  @override
  Widget build(BuildContext context) {
    const double characterWidth = 145;
    const double characterHeight = 381;
    const double ballSize = 80;

    // позиція персонажа на екрані
    const double charScreenLeft = 20;
    final screenHeight = MediaQuery.of(context).size.height;
    final charScreenTop = screenHeight - 20 - characterHeight;

    // координати точки шиї
    const double neckInsideHeadX = 85;
    const double neckInsideHeadY = 110;

    const neckGlobalX = charScreenLeft + neckInsideHeadX;
    final neckGlobalTop = charScreenTop + neckInsideHeadY;

    final ballCenterX = ballX + (ballSize / 2);
    final ballCenterY = ballY + (ballSize / 2);

    // кут між точкою шиї та центром мяча
    final deltaX = ballCenterX - neckGlobalX;
    final deltaY = ballCenterY - neckGlobalTop;

    var targetAngle = math.atan2(deltaY, deltaX);

    // стартовий кут
    const targetStartAngle = 30 * math.pi / 180;

    targetAngle += targetStartAngle - 0.11;

    return SizedBox(
      width: characterWidth,
      height: characterHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            width: 123,
            height: 276,
            child: Image.asset(
              'assets/images/body.png',
              fit: BoxFit.contain,
            ),
          ),

          // голова крутиться
          Positioned(
            top: 0,
            left: -8,
            width: 131,
            height: 127,
            child: Transform.rotate(
              angle: targetAngle,
              origin: const Offset(
                neckInsideHeadX,
                neckInsideHeadY,
              ),
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/head.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
