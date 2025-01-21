import 'package:flutter/material.dart';
import 'package:islami/cores/constants/app_assets.dart';
import 'package:islami/cores/services/LocalStorageKeys.dart';
import 'package:islami/cores/services/localstorage.dart';
import 'package:islami/cores/themes/app_colors.dart';
import 'package:islami/feautures/layout/pages/layout%20page.dart';
import 'package:islami/feautures/onboarding/models/on-boardingmodel.dart';
import 'package:islami/feautures/onboarding/widgets/onboarding-item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {

  static String routeName= "onboarding";
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var activeIndex=0;
  var  controller = PageController();
  @override
  void initState() {
    super.initState();
    LocalStorageServices.setBool(LocalStoragekey.isFirstTimeRun, false);
  }
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return  Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.islamilogo,
                  height: size.height*0.25,
                ),
                Expanded(
                    child: PageView.builder(
                      controller: controller,
                      onPageChanged: (index){
                        activeIndex=index;
                        setState(() {});
                      },
                      itemCount: OnboardingModel.onboardingList.length,
                      itemBuilder: (BuildContext context, int index) {
                      var onboardingModel= OnboardingModel.onboardingList[index];
                      return OnboardingItem(onboardingModel: onboardingModel);
                    },
                    )
                ),
                Row(
                  children: [
                    Visibility(
                      visible: activeIndex!=0,
                      replacement: Spacer(),
                      child: TextButton(
                          onPressed:(){
                            controller.previousPage(
                                duration:
                                Duration(
                                    microseconds: 500
                                ),
                                curve: Curves.easeInOut
                            );
                            if(activeIndex>0) {
                              activeIndex--;
                            }
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                    ),
                    Spacer(),
                    AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: OnboardingModel.onboardingList.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: AppColors.primaryColor,
                        dotColor: Colors.grey,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed:(){
                          if(activeIndex==OnboardingModel.onboardingList.length-1){
                            Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LayoutPage() ,
                            )
                           );
                          }
                          controller.nextPage(
                              duration:
                              Duration(
                                  microseconds: 500
                              ),
                              curve: Curves.easeInOut
                          );
                          if(activeIndex<OnboardingModel.onboardingList.length) {
                            activeIndex++;
                          }
                        },
                        child: Text(
                          activeIndex==OnboardingModel.onboardingList.length-1
                          ?"Finish"
                          :"Next",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        )
                    )
                  ],
                ),
                SizedBox(height: 16,)

              ],
            ),
          ),
        ),
      );

  }
}
