import 'package:flutter/material.dart';
import 'package:islami/cores/constants/app_assets.dart';

class TimesScreen extends StatelessWidget {
  const TimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  AppAssets.timesBG
              )
          )
      ),
    );
  }
}
