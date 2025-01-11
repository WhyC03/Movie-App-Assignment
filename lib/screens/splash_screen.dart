import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacementNamed('/actual-screen');
    });
    return Scaffold(
      body: Center(
        child: Image.asset("assets/tvm-header-logo.png"),
      ),
    );
  }
}
