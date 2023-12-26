import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/screens/homepage.dart';
import 'package:quiz_app/utils/responsive.dart';

import '../utils/colors.dart';
import '../widgets/text/textstyle.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Screen ? size;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            () =>
            Navigator.pushReplacement(
                context, PageRouteBuilder(
                pageBuilder: (_, __, ___) => Homepage()))

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child:  CustomeText(child: 'Quiz APP', size: 0.06, fontWeight: FontWeight.w700, color: secondaryColor),
      ),
    );
  }
}
