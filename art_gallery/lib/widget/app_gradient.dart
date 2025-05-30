import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppGradient extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final double? radius;
  const AppGradient({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100.h,
      width: width ?? 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 0),

        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 0, 0, 0),
            Colors.black.withOpacity(.9),
            Color.fromARGB(255, 34, 28, 18),
          ],
          stops: const [0.0, 0.5, 0.8],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
