import 'package:azkaryapp/common/ui/home_screen.dart';
import 'package:azkaryapp/core/uitls/functions_helper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    readJson();
    Future.delayed(const Duration(seconds: 3), () {
      navToPage(context: context, page: const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: CircularProgressIndicator(color: Colors.black),
          ),
        )
      ],
    ));
  }
}
