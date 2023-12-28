import 'package:craftybay_app/presentstion/ui/screens/splash_screen.dart';

import 'package:craftybay_app/presentstion/utility/app_colors.dart';
import 'package:craftybay_app/application/state_holders_binders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
static  GlobalKey <NavigatorState> globalKey = GlobalKey<NavigatorState>();
     const CraftyBay({Key? key}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      navigatorKey: CraftyBay.globalKey,
      debugShowCheckedModeBanner: false,
      initialBinding: StateHoldersBinders(),
      theme: ThemeData(
          textTheme: const TextTheme(
              titleMedium: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              titleLarge: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              )),
          primarySwatch:
              MaterialColor(AppColors.primaryColor.value, AppColors().color),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
          inputDecorationTheme: const InputDecorationTheme(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor),
              ))),
    );
  }
}
