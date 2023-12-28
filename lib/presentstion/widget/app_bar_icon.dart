import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({super.key, required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 35,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade200),
      child: Center(
        child: IconButton(
            onPressed: onTap,
            icon: Icon(
              icon,
              size: 22,
              color: Colors.grey,
            )),
      ),
    );
  }
}
