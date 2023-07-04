import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:weather_app/ui/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5))
        .then((value) => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => const HomePage(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: RiveAnimation.asset('assets2/splash.riv')),
    );
  }
}
