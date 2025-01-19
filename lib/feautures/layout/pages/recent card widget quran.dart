import 'package:flutter/material.dart';
import 'package:islami/cores/constants/app_assets.dart';
import 'package:islami/cores/themes/app_colors.dart';
import 'package:islami/models/recent-data.dart';

class RecentCardQuran extends StatelessWidget {
  const RecentCardQuran({super.key, required this.recentData});
  final RecentData recentData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(recentData.suraName,
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
              ),
              Text(recentData.suraNameAr,
                style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),
              ),
              Text(recentData.suraVerses,
                style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                ),
              ),
            ],
          ),
          Image.asset(AppAssets.recentimg),
        ],
      ),
    );
  }
}
