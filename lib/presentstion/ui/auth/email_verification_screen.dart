import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../state_holders/email_verification_controller.dart';
import 'otp_verification_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  
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
              Text("Welcome Back",
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Please enter your email address",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                  controller: _emailTEController,
                  validator: (String? email) {
                    if (email?.isEmpty ?? true) {
                      return 'Enter your email address';
                    } else if (email!.isEmail == false) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "email",
                  )),
              const SizedBox(height: 20),
              GetBuilder<EmailVerificationController>(builder: (controller) {
                if (controller.emailVerificationInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await verifyEmail(controller);
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
              }),
            ]),
          ),
        )),
      ),
    );
  }

  Future<void> verifyEmail(EmailVerificationController controller) async {
    final response = await controller
        .emailController( _emailTEController.text.trim());
    if (response) {
      Get.to(() =>  OtpVerificationScreen( email: _emailTEController.text.trim()));
    } else {
      if (mounted) {
        Get.snackbar('Something went wrong', response.toString());
      }
    }
  }
}
