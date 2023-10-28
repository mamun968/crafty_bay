import 'dart:async';

import 'package:craftybay_app/presentstion/state_holders/email_verification_controller.dart';
import 'package:craftybay_app/presentstion/state_holders/otp_verification_controller.dart';
import 'package:craftybay_app/presentstion/ui/screens/bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utility/app_colors.dart';
import '../../widget/pin_field.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});
  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _remainingTime = 15;
  bool _isTimerActive = true;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime == 0) {
        setState(() {
          _isTimerActive = false;
        });
        timer.cancel();
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(children: [
              const SizedBox(height: 80),
              Center(
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 100,
                ),
              ),
              const SizedBox(height: 16),
              Text("Enter the OTP",
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: 4,
              ),
              Text("A 4 digit code has been sent to your email",
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(
                height: 24,
              ),
              PinField(otpTEController: _otpTEController),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<OtpVerificationController>(
                builder: (controller) {
                  if (controller.otpVerificationInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await verifyOTP(controller);
                        }
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Next"),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      ));
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("The code will expire in"),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        " $_remainingTime seconds",
                        style: const TextStyle(color: AppColors.primaryColor),
                      )),
                ],
              ),
              GetBuilder<EmailVerificationController>(
                builder: (controller) => TextButton(
                    onPressed: _isTimerActive
                        ? null
                        : () async => await resendOtp(controller),
                    child: Text('Resend OTP',
                        style: TextStyle(
                            color: _isTimerActive
                                ? Colors.grey
                                : AppColors.primaryColor))),
              ),
            ]),
          ),
        ),
      )),
    );
  }

  Future<void> resendOtp(EmailVerificationController controller) async {
    final response = await controller.emailController(widget.email);
    if (response) {
      setState(() {
        _remainingTime = 15;
        _isTimerActive = true;
      });
      _startTimer();
    } else {
      Get.snackbar('Something went wrong', response.toString());
    }
  }

  Future<void> verifyOTP(OtpVerificationController controller) async {
    final response =
        await controller.otpController(widget.email, _otpTEController.text);
    if (response) {
      Get.to(() => const BottomNavScreen());
    } else {
      Get.snackbar('Invalid OTP', "Please enter valid OTP",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.grey.shade200);
    }
  }
}
