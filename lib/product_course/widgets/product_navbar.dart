import 'dart:ui';
import 'package:flutter/material.dart';
import '../product_course_theme.dart';

class ProductNavbar extends StatelessWidget {
  final Function(String) onNavigate;

  const ProductNavbar({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : screenWidth * 0.1,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              border: Border(
                bottom: BorderSide(color: ProductCourseColors.glassBorder),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ProductCourseColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.analytics_rounded, color: Colors.black, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "PRODUCT MASTER",
                      style: ProductCourseFonts.heading(20, weight: FontWeight.w800),
                    ),
                  ],
                ),
                if (!isMobile)
                  Row(
                    children: [
                      _NavLink(title: "Curriculum", onTap: () => onNavigate("Curriculum")),
                      const SizedBox(width: 32),
                      _NavLink(title: "Case Studies", onTap: () => onNavigate("Case Studies")),
                      const SizedBox(width: 32),
                      _NavLink(title: "FAQ", onTap: () => onNavigate("FAQ")),
                      const SizedBox(width: 40),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ProductCourseColors.primary,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text("GET STARTED", style: ProductCourseFonts.heading(14, weight: FontWeight.w700, color: Colors.black)),
                      ),
                    ],
                  )
                else
                  const Icon(Icons.menu, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavLink({required this.title, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.title,
          style: ProductCourseFonts.body(
            15,
            color: isHovered ? ProductCourseColors.primary : Colors.white,
            weight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
