import 'package:flutter/material.dart';
import 'package:islami/cores/themes/app_colors.dart';
import 'package:islami/models/PrayerTimeItem.dart';

class PrayerTimeCard extends StatelessWidget {
  final Map<String, dynamic> prayerTimes;

  PrayerTimeCard({required this.prayerTimes});

  @override
  Widget build(BuildContext context) {
    List<String> prayerNames = [
      "Fajr", "Sunrise", "Dhuhr", "Asr", "Maghrib", "Isha"
    ];

    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: prayerNames.map((prayer) {
          return PrayerTimeItem(
            title: prayer,
            time: prayerTimes[prayer] ?? "--:--",
          );
        }).toList(),
      ),
    );
  }
}