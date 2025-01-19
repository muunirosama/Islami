import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami/cores/themes/app_colors.dart';
import 'package:islami/feautures/onboarding/pages/on-boardingscreen.dart';

import '../../../cores/constants/app_assets.dart';

class SplashScreen1 extends StatelessWidget {
  static String routeName= "splash1";
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 4) ,() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const OnBoardingScreen()
          )
      );
    },
    );
     var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
         image: DecorationImage(
           fit: BoxFit.cover,
           image:AssetImage(
               AppAssets.splashbackground
           ),
         )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
                child: FadeInDown(
                  duration: const Duration(seconds: 2),
                  child: Image.asset(
                      AppAssets.glow,
                    height: size.height * 0.25,
                  ),
                )
            ),
            Container(
              margin: EdgeInsets.only(bottom:size.height * 0.25),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: FadeInLeft(
                    duration: const Duration(seconds: 2),
                    child: Image.asset(
                        AppAssets.leftshape,
                      width: size.width * 0.25,
                    ),
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:size.height * 0.25),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: FadeInRight(
                    duration: const Duration(seconds: 2),
                    child: Image.asset(
                        AppAssets.rightshape,
                      width: size.width * 0.25,
                    ),
                  )
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: FadeInUp(
                  duration: const Duration(seconds: 2),
                  child: Image.asset(
                    AppAssets.logo2,
                    width: size.width * 0.75,
                  ),
                )
            ),
            Align(
                alignment: Alignment.center,
                child: ZoomIn(
                  duration: const Duration(seconds: 2),
                  child: Image.asset(
                    AppAssets.logo1,
                    height: size.height * 0.40,
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
