import 'package:flutter/material.dart';
import 'package:islami/cores/constants/app_assets.dart';
import 'package:islami/cores/themes/app_colors.dart';
import 'package:islami/feautures/layout/pages/hadithdata.dart';

class HadithItemCard extends StatelessWidget {
  final  Hadithdata hadithData;
  const HadithItemCard({super.key, required this.hadithData});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
          bottom: 20,
        top: 5
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
            AppAssets.hadithboard,
        ),
          fit: BoxFit.fitHeight
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
          Text( hadithData.hadithTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ListView(
                children: [
                  Text(hadithData.hadithContent,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
