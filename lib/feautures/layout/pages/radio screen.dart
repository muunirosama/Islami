import 'package:flutter/material.dart';
import 'package:islami/cores/constants/app_assets.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  AppAssets.radioBG
              )
          )
      ),
    );
  }
}
