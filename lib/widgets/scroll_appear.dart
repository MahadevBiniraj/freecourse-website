import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollAppear extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Offset begin;
  final double scale;

  const ScrollAppear({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.begin = const Offset(0, 0.2),
    this.scale = 1.0,
  });

  @override
  State<ScrollAppear> createState() => _ScrollAppearState();
}

class _ScrollAppearState extends State<ScrollAppear> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.child.hashCode.toString()),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: widget.child
          .animate(target: _isVisible ? 1 : 0)
          .fadeIn(duration: 800.ms, delay: widget.delay)
          .slide(begin: widget.begin, end: Offset.zero, duration: 800.ms, delay: widget.delay)
          .scale(begin: Offset(widget.scale, widget.scale), end: const Offset(1, 1), duration: 800.ms, delay: widget.delay),
    );
  }
}
