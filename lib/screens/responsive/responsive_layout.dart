import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  const ResponsiveLayout({
    super.key,
    required this.mobileScaffold,
    required this.tabletScaffold,
    required this.desktopScaffold,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Mobile view
        if (constraints.maxWidth < 500) {
          return BottomNavbarWrapper(child: mobileScaffold);
        }
        // Tablet view
        else if (constraints.maxWidth < 1100) {
          return BottomNavbarWrapper(child: tabletScaffold);
        }
        // Desktop view
        else {
          return desktopScaffold;
        }
      },
    );
  }
}

// ✅ Wraps mobile/tablet scaffolds with BottomNavbar
class BottomNavbarWrapper extends StatefulWidget {
  final Widget child;

  const BottomNavbarWrapper({super.key, required this.child});

  @override
  State<BottomNavbarWrapper> createState() => _BottomNavbarWrapperState();
}

class _BottomNavbarWrapperState extends State<BottomNavbarWrapper> {

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
