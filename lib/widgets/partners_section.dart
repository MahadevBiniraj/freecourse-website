import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';

class PartnersSection extends StatelessWidget {
  const PartnersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final partners = [
      'AT&T',
      'Microsoft',
      'UNICEF',
      'IBM',
      'Netflix',
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      color: AppColors.surface,
      child: Column(
        children: [
          Text(
            "Our graduates work at",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
          ),
          const SizedBox(height: 40),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...partners.map((name) => _PartnerLogo(name: name)),
                ...partners.map((name) => _PartnerLogo(name: name)),
              ],
            ).animate(onPlay: (controller) => controller.repeat()).moveX(
                  begin: 0,
                  end: -600,
                  duration: 20.seconds,
                ),
          ),
        ],
      ),
    );
  }
}

class _PartnerLogo extends StatelessWidget {
  final String name;
  const _PartnerLogo({required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        name,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white.withValues(alpha: 0.5),
              fontWeight: FontWeight.w900,
            ),
      ),
    );
  }
}
