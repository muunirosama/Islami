import 'package:flutter/material.dart';
import 'package:islami/cores/constants/app_assets.dart';
import 'package:islami/cores/themes/app_colors.dart';
import 'package:islami/models/sura.dart';



class SuraCardList extends StatelessWidget {
  final Sura sura;

  const SuraCardList({super.key,
    required this.sura,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Container(
            width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AppAssets.suranumber,
                )
                )
              ),
            child: Text(
            sura.id.toString(),
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.white
            ),
            ),
          ),

          const SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sura.nameEn,
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.white
              ),
              ),

              const SizedBox(height: 6),

              Text("${sura.verses} verses",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white
                ),
              )
            ],
          ),
          const Spacer(),

          Text(sura.nameAr,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white
            ),
          )
        ],
      ),
    );
  }
}
