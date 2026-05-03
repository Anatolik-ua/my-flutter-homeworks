import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeworkTwelveScreen extends StatelessWidget {
  const HomeworkTwelveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF2FC),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 8,
            top: 16,
            bottom: 16,
          ),
          child: SvgPicture.asset('assets/images/leading-icon.svg'),
        ),
        title: const Text(
          'Оцінка візиту до магазину',
          style: TextStyle(
            color: Color(0xFF202124),
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [SizedBox(width: 16)],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: Colors.black.withValues(alpha: 0.06),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SvgPicture.asset(
                        index < 4
                            ? 'assets/images/Rating_active.svg'
                            : 'assets/images/Rating_inactive.svg',
                        width: 44,
                        height: 44,
                      ),
                    );
                  }),
                ),
              ),
            ),

            // const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Text(
                    'Яку оціночку поставите відділам?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1D1E20),
                    ),
                  ),
                  SizedBox(height: 24),

                  Text('Тут буде основний контент'),
                ],
              ),
            ),
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
