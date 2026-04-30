import 'package:flutter/material.dart';
import '../blockchain_course_theme.dart';

class BlockchainFooter extends StatelessWidget {
  const BlockchainFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 48,
      ),
      decoration: const BoxDecoration(
        color: BlockchainCourseColors.background,
        border: Border(top: BorderSide(color: BlockchainCourseColors.border)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.currency_bitcoin, color: BlockchainCourseColors.primary),
                  const SizedBox(width: 8),
                  Text(
                    "Web3.Build",
                    style: BlockchainCourseFonts.heading(18, color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  _footerLink("Etherscan"),
                  const SizedBox(width: 24),
                  _footerLink("GitHub"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Divider(color: BlockchainCourseColors.border),
          const SizedBox(height: 32),
          Text(
            "© 2024 PortfolioBuilders. Network Synced.",
            style: BlockchainCourseFonts.code(14, color: BlockchainCourseColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String text) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        style: BlockchainCourseFonts.code(14, color: BlockchainCourseColors.textSecondary),
      ),
    );
  }
}
