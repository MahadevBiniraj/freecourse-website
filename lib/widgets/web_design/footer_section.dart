import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          // Ready to Start Banner
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : screenWidth * 0.1),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(isMobile ? 32 : 64),
              decoration: BoxDecoration(
                color: const Color(0xFF8B0000), // Deep Red
                borderRadius: BorderRadius.circular(24),
              ),
              child: Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: Column(
                      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ready to start?",
                          textAlign: isMobile ? TextAlign.center : TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Join the next cohort and start building your career.",
                          textAlign: isMobile ? TextAlign.center : TextAlign.left,
                          style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 18),
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                          ),
                          child: const Text("APPLY NOW", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  if (isMobile) const SizedBox(height: 40),
                  Container(
                    width: isMobile ? 200 : 300,
                    height: isMobile ? 200 : 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage('assets/malavika.png'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 8),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1, end: 0),
          ),
          
          const SizedBox(height: 120),
          
          // Actual Footer
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
            color: const Color(0xFF0F0F0F),
            child: Column(
              children: [
                SizedBox(
                  width: 800,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFooterColumn("Contact", ["hello@portfoliobuilders.in", "+91 9876543210", "Bangalore, India"]),
                      _buildFooterColumn("Links", ["Home", "Courses", "About Us", "Mentors"]),
                      _buildFooterColumn("Legal", ["Terms of Service", "Privacy Policy", "Cookie Policy"]),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
                const Icon(Icons.wb_sunny_outlined, color: Colors.white, size: 48),
                const SizedBox(height: 16),
                const Text(
                  "Portfolio Builders",
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  "© 2026 Portfolio Builders. All rights reserved.",
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterColumn(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        ...links.map((link) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            link,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 16),
          ),
        )),
      ],
    );
  }
}
