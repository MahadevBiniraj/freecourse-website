import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme.dart';

class CourseCard extends StatefulWidget {
  final String title;
  final String desc;
  final String imagePath;
  final String tag;
  final String? url;
  final VoidCallback? onTap;

  const CourseCard({
    super.key,
    required this.title,
    required this.desc,
    required this.imagePath,
    required this.tag,
    this.url,
    this.onTap,
  });

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;

  Future<void> _launchUrl() async {
    if (widget.url == null) return;
    final Uri uri = Uri.parse(widget.url!);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch ${widget.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: (widget.url != null || widget.onTap != null)
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap ?? (widget.url != null ? _launchUrl : null),
        child: AnimatedScale(
          scale: isHovered ? 1.02 : 1.0,
          duration: 400.ms,
          curve: Curves.easeOutQuart,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.15),
                        blurRadius: 30,
                        offset: const Offset(0, 15),
                      ),
                    ]
                  : [],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: AnimatedContainer(
                  duration: 400.ms,
                  decoration: BoxDecoration(
                    color: isHovered
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.white.withValues(alpha: 0.03),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: isHovered
                          ? AppColors.primary.withValues(alpha: 0.3)
                          : Colors.white.withValues(alpha: 0.05),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Visual-First: Image on top
                      Expanded(
                        flex: 5,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: AnimatedScale(
                                scale: isHovered ? 1.08 : 1.0,
                                duration: 800.ms,
                                curve: Curves.easeOutCubic,
                                child: Image.asset(
                                  widget.imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Dark gradient overlay
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withValues(alpha: 0.8),
                                    ],
                                    stops: const [0.4, 1.0],
                                  ),
                                ),
                              ),
                            ),
                            // Tag
                            Positioned(
                              top: 20,
                              right: 20,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 5,
                                    sigmaY: 5,
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(
                                        alpha: 0.6,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        color: Colors.white.withValues(
                                          alpha: 0.2,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      widget.tag,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Content below
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  letterSpacing: -0.5,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                widget.desc,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withValues(alpha: 0.5),
                                  height: 1.5,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Text(
                                    "Explore Course",
                                    style: TextStyle(
                                      color: isHovered
                                          ? AppColors.primary
                                          : Colors.white70,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  AnimatedContainer(
                                    duration: 300.ms,
                                    transform: Matrix4.translationValues(
                                      isHovered ? 5 : 0,
                                      0,
                                      0,
                                    ),
                                    child: Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 16,
                                      color: isHovered
                                          ? AppColors.primary
                                          : Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
