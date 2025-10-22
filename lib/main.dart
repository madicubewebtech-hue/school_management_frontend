import 'package:flutter/material.dart';
import 'package:school_management_frontend/screens/auth/login.dart';
import 'package:school_management_frontend/screens/responsive/desktop_scaffold.dart';
import 'package:school_management_frontend/screens/responsive/mobile_scaffold.dart';
import 'package:school_management_frontend/screens/responsive/responsive_layout.dart';
import 'package:school_management_frontend/screens/responsive/tablet_scaffold.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Design',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      home: const  LoginScreen(),
      // home: ResponsiveLayout(
      //   mobileScaffold: const MobileScaffold(),
      //   tabletScaffold: const TabletScaffold(),
      //   desktopScaffold: const DesktopScaffold(),
      // ),
    );
  }
}
