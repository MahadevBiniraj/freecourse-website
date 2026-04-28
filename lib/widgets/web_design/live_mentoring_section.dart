import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class LiveMentoringSection extends StatelessWidget {
  const LiveMentoringSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final mentors = [
      {'name': 'Athul', 'role': 'UX Researcher', 'image': 'assets/athul.png'},
      {'name': 'Malavika', 'role': 'Senior UI Designer', 'image': 'assets/malavika.png'},
      {'name': 'Fahad', 'role': 'Product Manager', 'image': 'assets/fahad.png'},
      {'name': 'Parvathy', 'role': 'Frontend Developer', 'image': 'assets/parvathymrimage.png'},
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 120,
      ),
      color: AppColors.background,
      child: Column(
        children: [
          const Text(
            "Learn from the Best",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 48,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 16),
          const Text(
            "Get 1-on-1 mentoring sessions to guide you through the journey.\nOur mentors are industry experts working at top tech companies.",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 18),
          ).animate().fadeIn(delay: 400.ms),
          const SizedBox(height: 80),
          
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 4,
              crossAxisSpacing: 32,
              mainAxisSpacing: 40,
              childAspectRatio: 0.7, // Adjusted for cleaner layout
            ),
            itemCount: mentors.length,
            itemBuilder: (context, index) {
              final mentor = mentors[index];
              return _MentorCard(mentor: mentor, index: index);
            },
          ),
        ],
      ),
    );
  }
}

class _MentorCard extends StatefulWidget {
  final Map<String, String> mentor;
  final int index;

  const _MentorCard({required this.mentor, required this.index});

  @override
  State<_MentorCard> createState() => _MentorCardState();
}

class _MentorCardState extends State<_MentorCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutQuart,
        transform: Matrix4.translationValues(0, isHovered ? -10 : 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: isHovered ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.15),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    )
                  ] : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Grayscale version (always underneath)
                      ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.grey,
                          BlendMode.saturation,
                        ),
                        child: Image.asset(
                          widget.mentor['image']!,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      // Colored version (fades in on hover)
                      AnimatedOpacity(
                        opacity: isHovered ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Image.asset(
                          widget.mentor['image']!,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.mentor['name']!,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.mentor['role']!,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ).animate().fadeIn(delay: (200 * widget.index).ms).slideY(begin: 0.2, end: 0),
    );
  }
}
