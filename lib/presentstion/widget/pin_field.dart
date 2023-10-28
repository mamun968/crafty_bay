import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utility/app_colors.dart';

class PinField extends StatelessWidget {
  const PinField({
    super.key,
    required TextEditingController otpTEController,
  }) : _otpTEController = otpTEController;

  final TextEditingController _otpTEController;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: _otpTEController,
      validator: (String? otp) {
        if (otp?.isEmpty ?? true) {
          return 'Enter your OTP';
        }

        return null;
      },
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 50,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedFillColor: Colors.white,
        activeColor: AppColors.primaryColor,
        inactiveColor: AppColors.primaryColor,
        selectedColor: Colors.black,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onCompleted: (v) {},
      onChanged: (value) {},
      beforeTextPaste: (text) {
        return true;
      },
      appContext: context,
    );
  }
}