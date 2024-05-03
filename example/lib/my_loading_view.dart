import 'dart:math';

import 'package:flutter/material.dart';

class MyLoadingView extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const MyLoadingView({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.7)),
              width: double.infinity,
              height: double.infinity,
              child: const Center(
                child: MyLoadingIcon(),
              ),
            ),
          ),
      ],
    );
  }
}

class MyLoadingIcon extends StatefulWidget {
  const MyLoadingIcon({super.key});

  @override
  State<MyLoadingIcon> createState() => _LoadingState();
}

class _LoadingState extends State<MyLoadingIcon> with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))
    ..repeat();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: controller.value * 2 * pi,
          child: child,
        );
      },
      child: Image.asset(
        'assets/images/loader.png',
        width: 60,
        height: 60,
      ),
    );
  }
}
