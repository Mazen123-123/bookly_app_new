import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAninmation,
  });

  final Animation<Offset> slidingAninmation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAninmation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAninmation,
            child: const Text(
              'Read Free Books',
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
