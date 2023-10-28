import 'package:craftybay_app/presentstion/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CompleteProfileScreeen extends StatefulWidget {
  const CompleteProfileScreeen({super.key});

  @override
  State<CompleteProfileScreeen> createState() => _CompleteProfileScreeenState();
}

class _CompleteProfileScreeenState extends State<CompleteProfileScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        Center(
                            child: SvgPicture.asset('assets/images/logo.svg',
                                width: 100)),
                        const SizedBox(height: 16),
                        Text("Complete Profile",
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Get started by completing your profile",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                          hintText: "First Name",
                        )),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                          hintText: "Last Name",
                        )),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                          hintText: "Mobile ",
                        )),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                          hintText: "City",
                        )),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                            maxLines: 4,
                            decoration: const InputDecoration(
                              hintText: "Shipping Address",
                            )),
                        const SizedBox(
                          height: 12,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Get.to(const HomeScreen());
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Complete"),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(Icons.done)
                              ],
                            )),
                      ])))),
    );
  }
}
