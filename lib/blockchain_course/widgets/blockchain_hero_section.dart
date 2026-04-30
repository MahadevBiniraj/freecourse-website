import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../blockchain_course_theme.dart';

class BlockchainHeroSection extends StatelessWidget {
  final VoidCallback onViewCurriculum;

  const BlockchainHeroSection({super.key, required this.onViewCurriculum});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 800),
      decoration: const BoxDecoration(
        color: BlockchainCourseColors.background,
      ),
      child: Stack(
        children: [
          // Background Glows
          Positioned(
            top: -200,
            left: -200,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    BlockchainCourseColors.primary.withOpacity(0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          
          // Network Node Background (Faint Grid)
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: CustomPaint(painter: _NetworkNodePainter()),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : screenWidth * 0.1,
              vertical: 140,
            ),
            child: Row(
              children: [
                // Left Content
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animated Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: BlockchainCourseColors.primary.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: BlockchainCourseColors.primary.withOpacity(0.2)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.link, color: BlockchainCourseColors.primary, size: 14),
                            const SizedBox(width: 8),
                            Text(
                              "BLOCK: 0x8F9A • STATUS: SECURE",
                              style: BlockchainCourseFonts.code(12, color: BlockchainCourseColors.primary, weight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 600.ms),

                      const SizedBox(height: 32),

                      // Heading
                      RichText(
                        text: TextSpan(
                          style: BlockchainCourseFonts.display(isMobile ? 48 : 72, weight: FontWeight.w900, color: Colors.white),
                          children: [
                            const TextSpan(text: "Build the Future of\n"),
                            TextSpan(
                              text: "Web3 & Blockchain",
                              style: TextStyle(color: BlockchainCourseColors.primary),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1),

                      const SizedBox(height: 24),

                      Text(
                        "Master smart contracts, cryptography, and Ethereum. Learn to build secure, decentralized applications (DApps) and deploy them to the blockchain.",
                        style: BlockchainCourseFonts.body(20, color: BlockchainCourseColors.textSecondary, weight: FontWeight.w400),
                      ).animate().fadeIn(delay: 200.ms, duration: 800.ms),

                      const SizedBox(height: 48),

                      // CTAs
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: BlockchainCourseColors.primary,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              elevation: 20,
                              shadowColor: BlockchainCourseColors.primary.withOpacity(0.4),
                            ),
                            child: Text("CONNECT WALLET", style: BlockchainCourseFonts.heading(16, weight: FontWeight.w800, color: Colors.black)),
                          ),
                          OutlinedButton(
                            onPressed: onViewCurriculum,
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: BlockchainCourseColors.border),
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text("VIEW CONTRACT", style: BlockchainCourseFonts.heading(16, weight: FontWeight.w700, color: Colors.white)),
                          ),
                        ],
                      ).animate().fadeIn(delay: 400.ms),
                      
                      const SizedBox(height: 80),

                      // Floating Tech Snippet
                      if (!isMobile)
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.03),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white.withOpacity(0.05)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  _dot(Colors.red),
                                  const SizedBox(width: 6),
                                  _dot(Colors.amber),
                                  const SizedBox(width: 6),
                                  _dot(Colors.green),
                                  const SizedBox(width: 12),
                                  Text("Token.sol", style: BlockchainCourseFonts.code(12, color: BlockchainCourseColors.textSecondary)),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "pragma solidity ^0.8.0;\n\ncontract Web3Token {\n    mapping(address => uint256) public balances;\n    \n    function transfer(address to, uint256 amount) public {\n        require(balances[msg.sender] >= amount, \"Insufficient funds\");\n        balances[msg.sender] -= amount;\n        balances[to] += amount;\n    }\n}",
                                style: BlockchainCourseFonts.code(13, color: Colors.white70),
                              ),
                            ],
                          ),
                        ).animate(onPlay: (c) => c.repeat(reverse: true))
                        .moveY(begin: 0, end: -10, duration: 3.seconds, curve: Curves.easeInOut),
                    ],
                  ),
                ),

                // Right Content (Hero Illustration)
                if (!isMobile)
                  Expanded(
                    flex: 4,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Hero Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            'assets/courses/blockchain.png', // The generated image
                            width: 600,
                            fit: BoxFit.contain,
                          ),
                        )
                        .animate(onPlay: (controller) => controller.repeat(reverse: true))
                        .moveY(begin: 0, end: -15, duration: 2.5.seconds, curve: Curves.easeInOut),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(Color color) => Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle));
}

class _NetworkNodePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = BlockchainCourseColors.primary.withOpacity(0.3)
      ..strokeWidth = 1.0;

    const spacing = 50.0;

    for (var i = 0.0; i < size.width; i += spacing) {
      for (var j = 0.0; j < size.height; j += spacing) {
        canvas.drawCircle(Offset(i, j), 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
