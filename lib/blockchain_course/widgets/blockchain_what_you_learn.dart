import 'package:flutter/material.dart';
import '../blockchain_course_theme.dart';

class BlockchainWhatYouLearn extends StatelessWidget {
  const BlockchainWhatYouLearn({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final skills = [
      {'icon': Icons.lock, 'title': 'Cryptography & Consensus', 'desc': 'Understand hash functions, public/private keys, and Proof of Work/Stake.'},
      {'icon': Icons.code, 'title': 'Solidity Smart Contracts', 'desc': 'Write secure, optimized smart contracts for the Ethereum Virtual Machine (EVM).'},
      {'icon': Icons.currency_exchange, 'title': 'Token Standards', 'desc': 'Create and deploy your own ERC-20 cryptocurrencies and ERC-721 NFTs.'},
      {'icon': Icons.account_balance_wallet, 'title': 'Web3 & Wallets', 'desc': 'Integrate MetaMask and build frontend interfaces using Web3.js and Ethers.js.'},
      {'icon': Icons.security, 'title': 'Smart Contract Security', 'desc': 'Prevent common vulnerabilities like Reentrancy, Overflow, and Front-running.'},
      {'icon': Icons.rocket_launch, 'title': 'DApp Deployment', 'desc': 'Deploy your decentralized applications to IPFS and testnets like Goerli or Sepolia.'},
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Core Protocol Competencies",
            style: BlockchainCourseFonts.display(isMobile ? 36 : 48, color: Colors.white),
          ),
          const SizedBox(height: 24),
          Text(
            "Acquire the technical skills to build secure, decentralized systems on the blockchain.",
            style: BlockchainCourseFonts.body(18, color: BlockchainCourseColors.textSecondary),
          ),
          const SizedBox(height: 64),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 2 : 1.2,
            ),
            itemCount: skills.length,
            itemBuilder: (context, index) {
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
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: BlockchainCourseColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: BlockchainCourseColors.primary.withOpacity(0.2)),
                      ),
                      child: Icon(
                        skills[index]['icon'] as IconData,
                        color: BlockchainCourseColors.primary,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      skills[index]['title'] as String,
                      style: BlockchainCourseFonts.heading(20, color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: Text(
                        skills[index]['desc'] as String,
                        style: BlockchainCourseFonts.body(14, color: BlockchainCourseColors.textSecondary),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
