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
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset('assets/images/leading-icon.svg'),
          ),
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
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

            const SizedBox(height: 26),
            const Center(
              child: Text(
                'Яку оціночку поставите відділам?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF13131E),
                ),
              ),
            ),
            const SizedBox(height: 26),

            const AssessmentCategoryCard(title: 'Випічка'),
            const SizedBox(height: 10),
            const AssessmentCategoryCard(title: 'Лавка традицій'),

            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Є що додати?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF13131E),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Поділіться загальним враженням',
                      hintStyle: const TextStyle(color: Color(0xFF878789)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFC9CACA)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFC9CACA)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 36),
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

class AssessmentCategoryCard extends StatelessWidget {
  const AssessmentCategoryCard({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            offset: const Offset(0, 1),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF13131E),
            ),
          ),
          const SizedBox(height: 16),
          _buildRatingRow('Обслуговування'),
          const SizedBox(height: 8),
          _buildRatingRow('Асортимент'),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Розкажіть докладніше',
              hintStyle: const TextStyle(color: Color(0xFF878789)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFC9CACA)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFC9CACA)),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingRow(String label) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6F8FD),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF3C3D40),
              ),
            ),
          ),
          // просто іконки, потім можна зробити їх кнопками
          _buildThumbButton(Icons.thumb_down_alt_outlined, false),
          const SizedBox(width: 12),
          _buildThumbButton(Icons.thumb_up_alt_outlined, true),
        ],
      ),
    );
  }

  Widget _buildThumbButton(IconData icon, bool isActive) {
    final displayIcon = isActive
        ? (icon == Icons.thumb_up_alt_outlined
              ? Icons.thumb_up_alt
              : icon == Icons.thumb_down_alt_outlined
              ? Icons.thumb_down_alt
              : icon)
        : icon;

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF2358D1) : const Color(0xFFEDEFF4),
        shape: BoxShape.circle,
        boxShadow: isActive
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  offset: const Offset(0, 1),
                  blurRadius: 0,
                  spreadRadius: 0,
                ),
              ],
      ),
      child: Icon(
        displayIcon,
        color: isActive ? Colors.white : const Color(0xFF595B5E),
        size: 24,
      ),
    );
  }
}
