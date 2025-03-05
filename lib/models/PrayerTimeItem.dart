import 'package:flutter/material.dart';
import 'package:islami/cores/themes/app_colors.dart';

class PrayerTimeItem extends StatelessWidget {
  final String title;
  final String time;

  PrayerTimeItem({required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondaryColor
              )
          ),
          Text(time,
              style: TextStyle(
                  fontSize: 22,
                  color: AppColors.secondaryColor
              )
          ),
        ],
      ),
    );
  }
}