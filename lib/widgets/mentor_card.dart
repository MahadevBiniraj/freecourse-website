import 'package:flutter/material.dart';

class MentorCard extends StatefulWidget {
  final String name;
  final String role;
  final String image;

  const MentorCard({
    super.key,
    required this.name,
    required this.role,
    required this.image,
  });

  @override
  State<MentorCard> createState() => _MentorCardState();
}

class _MentorCardState extends State<MentorCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutQuart,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white.withValues(alpha: 0.05), // Subtle background
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.grey,
                    BlendMode.saturation,
                  ),
                  child: widget.image.startsWith('http')
                      ? Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        )
                      : Image.asset(
                          widget.image,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.role,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
