import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double height;

  const CustomContainer({
    super.key,
    required this.child,
    this.height = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(20),
      height: size.height * height,
      color: const Color(0xff01131B),
      child: child,
    );
  }
}
