import 'package:flutter/material.dart';
import 'package:islami/cores/constants/app_assets.dart';
import 'package:islami/cores/themes/app_colors.dart';
import 'package:islami/models/recent-data.dart';
import 'package:islami/models/sura.dart';

class RecentCardQuran extends StatelessWidget {

  final Sura suras;
  RecentCardQuran({
    super.key,
    required this.suras
});

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
              Text(suras.nameEn,
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
              ),
              Text(suras.nameAr,
                style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),
              ),
              Text("${suras.verses} Verses",
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
