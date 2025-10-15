import 'package:flutter/material.dart';

class CornerDecoratedContainer extends StatelessWidget {
  final Widget child;
  final Color decorationColor;
  final bool showTopRight;
  final bool showBottomLeft;
  final double topRightSize;
  final double bottomLeftSize;

  const CornerDecoratedContainer({
    Key? key,
    required this.child,
    this.decorationColor = const Color(0xFFB968E5),
    this.showTopRight = true,
    this.showBottomLeft = true,
    this.topRightSize = 200,
    this.bottomLeftSize = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main content
        child,
        
        // Top right corner decoration
        if (showTopRight)
          Positioned(
            top: 0,
            right: 0,
            child: ClipPath(
              clipper: TopRightCornerClipper(),
              child: Container(
                width: topRightSize,
                height: topRightSize,
                color: decorationColor,
              ),
            ),
          ),
        
        // Bottom left corner decoration
        if (showBottomLeft)
          Positioned(
            bottom: 0,
            left: 0,
            child: ClipPath(
              clipper: BottomLeftCornerClipper(),
              child: Container(
                width: bottomLeftSize,
                height: bottomLeftSize,
                color: decorationColor,
              ),
            ),
          ),
      ],
    );
  }
}

// Custom clipper for top right corner with smooth curve
class TopRightCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // Start from top-left corner
    path.moveTo(0, 0);
    // Line to top-right corner
    path.lineTo(size.width, 0);
    // Line down the right side
    path.lineTo(size.width, size.height);
    // Smooth curve from bottom-right to top-left
    path.cubicTo(
      size.width * 0.7, size.height * 0.7,  // Control point 1
      size.width * 0.3, size.height * 0.3,  // Control point 2
      0, 0,                                   // End point (top-left)
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Custom clipper for bottom left corner with smooth curve
class BottomLeftCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // Start from top-left corner
    path.moveTo(0, 0);
    // Smooth curve from top-left to bottom-right
    path.cubicTo(
      size.width * 0.3, size.height * 0.3,  // Control point 1
      size.width * 0.7, size.height * 0.7,  // Control point 2
      size.width, size.height,               // End point (bottom-right)
    );
    // Line to bottom-left corner
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}