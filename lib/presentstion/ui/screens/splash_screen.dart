import 'package:craftybay_app/presentstion/ui/auth/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utility/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(const EmailVerificationScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset("assets/images/logo.svg"),
            const Padding(
              padding: EdgeInsets.all(48),
              child: LinearProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                backgroundColor: Colors.amber,
              ),
            ),
            const Spacer(),
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text("Version  1.0.0",
                  style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
