import 'package:flutter/material.dart';

class CustomCardContainer extends StatelessWidget {
  final Widget leftContent;    // Left side widget (e.g., text)
  final Widget rightContent;   // Right side widget (e.g., image)
  final double topPosition;    // Position from top in Stack
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final double elevation;

  const CustomCardContainer({
    super.key,
    required this.leftContent,
    required this.rightContent,
    required this.topPosition,
    this.padding,
    this.borderRadius = 20,
    this.elevation = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topPosition,
      left: MediaQuery.of(context).size.width * 0.06,
      right: MediaQuery.of(context).size.width * 0.06,
      child: Card(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Container(
          width: double.infinity,
          padding: padding ?? const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            children: [
              Expanded(flex: 3, child: leftContent),
              const SizedBox(width: 20),
              Expanded(flex: 1, child: rightContent),
            ],
          ),
        ),
      ),
    );
  }
}
