import 'package:flutter/material.dart';
import '../product_course_theme.dart';

class ProductStatsBar extends StatelessWidget {
  const ProductStatsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60),
      decoration: BoxDecoration(
        color: ProductCourseColors.surface,
        border: Border.symmetric(
          horizontal: BorderSide(color: Colors.white.withOpacity(0.05)),
        ),
      ),
      child: Center(
        child: Wrap(
          spacing: isMobile ? 40 : 100,
          runSpacing: 40,
          alignment: WrapAlignment.center,
          children: [
            _statItem("Enrolled", "12,400+", Icons.people_outline),
            _statItem("Hours", "48 hrs", Icons.timer_outlined),
            _statItem("Rating", "4.9/5", Icons.star_border_rounded),
            _statItem("Level", "Managerial", Icons.bar_chart_rounded),
          ],
        ),
      ),
    );
  }

  Widget _statItem(String label, String value, IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: ProductCourseColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: ProductCourseColors.primary, size: 24),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: ProductCourseFonts.heading(24)),
            Text(label, style: ProductCourseFonts.body(14, color: ProductCourseColors.textSecondary)),
          ],
        ),
      ],
    );
  }
}
