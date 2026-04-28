import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class GlobalNetworkSection extends StatelessWidget {
  const GlobalNetworkSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120),
      color: const Color(0xFF8B0000), // Deep Red
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Text(
                  "More than a Bootcamp -\nJoin a global network of skills.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Our graduates work at the world's most innovative companies. Connect with a global community of designers and developers.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          // Network Visualization
          Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/world_map.png',
                  width: screenWidth * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
              // We can add portraits here at specific offsets
              _buildNetworkPortraits(screenWidth),
            ],
          ),
          const SizedBox(height: 40),
          // Row of square portraits
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSquarePortrait('assets/athul.png'),
                _buildSquarePortrait('assets/fahad.png'),
                _buildSquarePortrait('assets/tinu.png'),
                _buildSquarePortrait('assets/malavika.png'),
                _buildSquarePortrait('assets/parvathymrimage.png'),
                _buildSquarePortrait('assets/mahadev.png'),
                _buildSquarePortrait('assets/Kaustubh Mokashi.png'),
                _buildSquarePortrait('assets/Supriya Kasar.png'),
                _buildSquarePortrait('assets/Himanshu Chaudhary.png'),
                _buildSquarePortrait('assets/Archana Anil.png'),
              ],
            ),
          ),
          const SizedBox(height: 80),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFD700), // Gold
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text("JOIN NETWORK", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildNetworkPortraits(double screenWidth) {
    // Simple placeholder for portraits on the map
    return SizedBox(
      width: screenWidth * 0.8,
      height: 400,
      child: Stack(
        children: [
          _PositionedPortrait(top: 100, left: 100, image: 'assets/athul.png'),
          _PositionedPortrait(top: 150, right: 150, image: 'assets/fahad.png'),
          _PositionedPortrait(bottom: 100, left: 200, image: 'assets/tinu.png'),
          _PositionedPortrait(top: 50, center: true, image: 'assets/malavika.png'),
          _PositionedPortrait(bottom: 50, right: 250, image: 'assets/mahadev.png'),
        ],
      ),
    );
  }

  Widget _buildSquarePortrait(String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    ).animate().fadeIn(delay: 800.ms).scale();
  }
}

class _PositionedPortrait extends StatelessWidget {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final bool center;
  final String image;

  const _PositionedPortrait({this.top, this.bottom, this.left, this.right, this.center = false, required this.image});

  @override
  Widget build(BuildContext context) {
    Widget child = Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
    ).animate().scale(delay: 500.ms).fadeIn();

    if (center) {
      return Align(alignment: Alignment.center, child: child);
    }

    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: child,
    );
  }
}
