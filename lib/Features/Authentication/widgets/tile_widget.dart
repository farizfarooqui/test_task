import 'package:flutter/material.dart';
import 'package:test_task/Constant/app_colors.dart';

class ProfileTileWidget extends StatelessWidget {
  final String text;
  final Widget icon;
  const ProfileTileWidget({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.green,
              Colors.black87,
            ],
          ),
          borderRadius: BorderRadius.circular(20)),
      child: ListTile(
          title: Text(
            text,
            style: const TextStyle(color: AppColors.white),
          ),
          trailing: icon),
    );
  }
}
