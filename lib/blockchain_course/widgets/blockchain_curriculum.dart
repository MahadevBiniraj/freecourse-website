import 'package:flutter/material.dart';
import '../blockchain_course_theme.dart';

class BlockchainCurriculum extends StatefulWidget {
  const BlockchainCurriculum({super.key});

  @override
  State<BlockchainCurriculum> createState() => _BlockchainCurriculumState();
}

class _BlockchainCurriculumState extends State<BlockchainCurriculum> {
  int? _expandedIndex;

  final modules = [
    {
      'title': 'Module 1: Blockchain Fundamentals',
      'lessons': [
        'How Blockchains Work (Blocks, Hashes, Chains)',
        'Cryptography & Public Key Infrastructure',
        'Consensus Mechanisms (PoW, PoS)',
        'The Ethereum Network & EVM',
      ],
    },
    {
      'title': 'Module 2: Introduction to Solidity',
      'lessons': [
        'Solidity Syntax & Data Types',
        'Functions, Modifiers, & Events',
        'Mappings & Structs',
        'Deploying via Remix IDE',
      ],
    },
    {
      'title': 'Module 3: Advanced Smart Contracts',
      'lessons': [
        'Inheritance & Interfaces',
        'Gas Optimization Techniques',
        'Calling External Contracts',
        'Smart Contract Security Best Practices',
      ],
    },
    {
      'title': 'Module 4: Tokens & NFTs',
      'lessons': [
        'Understanding the ERC-20 Standard',
        'Creating a Custom Cryptocurrency',
        'The ERC-721 Standard for NFTs',
        'Minting & Managing Digital Assets',
      ],
    },
    {
      'title': 'Module 5: Web3 Frontend Integration',
      'lessons': [
        'Introduction to Web3.js & Ethers.js',
        'Connecting MetaMask to a Web App',
        'Reading & Writing Data to the Blockchain',
        'Handling Transactions & Receipts',
      ],
    },
    {
      'title': 'Module 6: Full-Stack DApp Development',
      'lessons': [
        'Setting up Hardhat/Truffle',
        'Writing Automated Tests for Smart Contracts',
        'Deploying to Testnets (Sepolia)',
        'Hosting the Frontend on IPFS/Vercel',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      color: BlockchainCourseColors.surface,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.2,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: BlockchainCourseColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: BlockchainCourseColors.primary.withOpacity(0.3)),
                ),
                child: Text(
                  "GENESIS_BLOCK",
                  style: BlockchainCourseFonts.code(12, color: BlockchainCourseColors.primary, weight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            "Node Sync Sequence",
            style: BlockchainCourseFonts.display(isMobile ? 36 : 48, color: Colors.white),
          ),
          const SizedBox(height: 64),
          ...List.generate(modules.length, (index) => _buildModule(index)),
        ],
      ),
    );
  }

  Widget _buildModule(int index) {
    final isExpanded = _expandedIndex == index;
    final module = modules[index];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: BlockchainCourseColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isExpanded ? BlockchainCourseColors.primary : BlockchainCourseColors.border,
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: isExpanded,
          onExpansionChanged: (expanded) {
            setState(() {
              _expandedIndex = expanded ? index : null;
            });
          },
          iconColor: BlockchainCourseColors.primary,
          collapsedIconColor: BlockchainCourseColors.textSecondary,
          title: Text(
            module['title'] as String,
            style: BlockchainCourseFonts.heading(18, color: isExpanded ? BlockchainCourseColors.primary : Colors.white),
          ),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: BlockchainCourseColors.border)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: (module['lessons'] as List<String>).map((lesson) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        const Icon(Icons.link, color: BlockchainCourseColors.textSecondary, size: 16),
                        const SizedBox(width: 12),
                        Text(lesson, style: BlockchainCourseFonts.body(16)),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
