import 'package:flutter/material.dart';
import 'package:islami/cores/constants/app_assets.dart';
import 'package:islami/cores/themes/app_colors.dart';
import 'package:islami/feautures/layout/pages/hadith%20screen.dart';
import 'package:islami/feautures/layout/pages/quran%20screen.dart';
import 'package:islami/feautures/layout/pages/radio%20screen.dart';
import 'package:islami/feautures/layout/pages/sebha%20screen.dart';
import 'package:islami/feautures/layout/pages/times%20screen.dart';
import 'package:islami/models/recent-data.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<StatefulWidget> createState() =>
      _LayoutPageState();
}
class _LayoutPageState extends State<LayoutPage> {
  int SelectedIndex=0;

  List<Widget> screens = [
    QuranScreen(),
    HadithScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            SelectedIndex=index;
            setState(() {});
          },
          currentIndex: SelectedIndex,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            fixedColor: AppColors.white,
            backgroundColor: AppColors.primaryColor,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.symmetric(horizontal:16, vertical:8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: SelectedIndex==0? AppColors.secondaryColor.withOpacity(0.5)
                        : Colors.transparent
                  ),
                  child: ImageIcon(
                      AssetImage(
                          AppAssets.quranicon
                      )
                  ),
                ),
                label: "Quran",
              ),
              BottomNavigationBarItem(
              icon: Container(
              padding: EdgeInsets.symmetric(horizontal:16, vertical:8),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
                  color: SelectedIndex==1? AppColors.secondaryColor.withOpacity(0.5)
        : Colors.transparent
              ),
                child: ImageIcon(
                    AssetImage(
                        AppAssets.hadith
                    )
                ),
              ),
                label: "Hadith",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.symmetric(horizontal:16, vertical:8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: SelectedIndex==2? AppColors.secondaryColor.withOpacity(0.5)
                          : Colors.transparent
                  ),
                child: ImageIcon(
                    AssetImage(
                        AppAssets.sebhaicon
                    )
                ),
    ),
                label: "Sebha",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.symmetric(horizontal:16, vertical:8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: SelectedIndex==3? AppColors.secondaryColor.withOpacity(0.5)
                          : Colors.transparent
                  ),
                child: ImageIcon(
                    AssetImage(
                        AppAssets.radioicn
                    )
                ),
    ),
                label: "Radio",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.symmetric(horizontal:16, vertical:8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: SelectedIndex==4? AppColors.secondaryColor.withOpacity(0.5)
                          : Colors.transparent
                  ),
                child: ImageIcon(
                    AssetImage(
                        AppAssets.timeicn
                    )
                ),
                ),
                label: "Time",
              ),
            ]
        ),
        body: screens[SelectedIndex],
      ),
    );
  }
}


