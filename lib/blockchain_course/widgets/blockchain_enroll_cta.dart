import 'package:flutter/material.dart';
import '../blockchain_course_theme.dart';

class BlockchainEnrollCTA extends StatelessWidget {
  const BlockchainEnrollCTA({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 120,
      ),
      color: BlockchainCourseColors.background,
      child: Container(
        padding: EdgeInsets.all(isMobile ? 32 : 64),
        decoration: BoxDecoration(
          color: BlockchainCourseColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: BlockchainCourseColors.primary.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: BlockchainCourseColors.primary.withOpacity(0.05),
              blurRadius: 50,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Initialize Your Node",
              textAlign: TextAlign.center,
              style: BlockchainCourseFonts.display(isMobile ? 36 : 56, color: Colors.white),
            ),
            const SizedBox(height: 24),
            Text(
              "Join the decentralized revolution. Master smart contracts and build Web3 applications today.",
              textAlign: TextAlign.center,
              style: BlockchainCourseFonts.body(18, color: BlockchainCourseColors.textSecondary),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: BlockchainCourseColors.primary,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 20,
                shadowColor: BlockchainCourseColors.primary.withOpacity(0.4),
              ),
              child: Text(
                "EXECUTE CONTRACT",
                style: BlockchainCourseFonts.heading(18, weight: FontWeight.w800, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
