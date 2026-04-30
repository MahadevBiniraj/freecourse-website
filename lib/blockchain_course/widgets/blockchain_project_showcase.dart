import 'package:flutter/material.dart';
import '../blockchain_course_theme.dart';

class BlockchainProjectShowcase extends StatelessWidget {
  const BlockchainProjectShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deployed DApps",
            style: BlockchainCourseFonts.display(isMobile ? 36 : 48, color: Colors.white),
          ),
          const SizedBox(height: 24),
          Text(
            "Build a portfolio of secure, real-world decentralized applications.",
            style: BlockchainCourseFonts.body(18, color: BlockchainCourseColors.textSecondary),
          ),
          const SizedBox(height: 64),
          isMobile
              ? Column(
                  children: [
                    _buildProjectCard(
                      'Custom ERC-20 Token',
                      'Write, test, and deploy your own cryptocurrency to the Ethereum testnet.',
                      Icons.currency_exchange,
                    ),
                    const SizedBox(height: 24),
                    _buildProjectCard(
                      'Decentralized Voting System',
                      'A transparent voting DApp ensuring immutable election results.',
                      Icons.how_to_vote,
                    ),
                    const SizedBox(height: 24),
                    _buildProjectCard(
                      'NFT Minting Platform',
                      'Build a full-stack Web3 app to mint and display ERC-721 digital assets.',
                      Icons.image,
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: _buildProjectCard(
                        'Custom ERC-20 Token',
                        'Write, test, and deploy your own cryptocurrency to the Ethereum testnet.',
                        Icons.currency_exchange,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _buildProjectCard(
                        'Decentralized Voting System',
                        'A transparent voting DApp ensuring immutable election results.',
                        Icons.how_to_vote,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _buildProjectCard(
                        'NFT Minting Platform',
                        'Build a full-stack Web3 app to mint and display ERC-721 digital assets.',
                        Icons.image,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String desc, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: BlockchainCourseColors.glassBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: BlockchainCourseColors.glassBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: BlockchainCourseColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: BlockchainCourseColors.border),
            ),
            child: Icon(icon, color: BlockchainCourseColors.primary, size: 40),
          ),
          const SizedBox(height: 32),
          Text(title, style: BlockchainCourseFonts.heading(24, color: Colors.white)),
          const SizedBox(height: 16),
          Text(desc, style: BlockchainCourseFonts.body(16, color: BlockchainCourseColors.textSecondary)),
        ],
      ),
    );
  }
}
