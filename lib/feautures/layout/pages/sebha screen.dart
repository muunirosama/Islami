import 'package:flutter/material.dart';
import 'package:islami/cores/constants/app_assets.dart';
import 'package:islami/cores/themes/app_colors.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {

  int counter = 0;
  double angle = 0;
  int currentIndex = 0;
  List<String> list = [ "الحمد لله","استغفر الله العظيم","الله اكبر","لا اله الا الله"];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  AppAssets.sebhaBG
              )
          )
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset( AppAssets.logo200,
              height: size.height * 0.15,),

              SizedBox(height: 16,),

              Center(
                child: Text(list[currentIndex],
                style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                ),
                ),
              ),
              Spacer(),

              Center(
                child: GestureDetector(
                  onTap: onSebhaTab,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: size.width* 0.40),
                        child: Image.asset(AppAssets.masksebha,
                        height: size.height*.10,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: size.height*0.09),
                        child: Stack(
                          alignment: Alignment.center,
                          children:[
                            Transform.rotate(
                              angle: angle,
                              child: Image.asset(
                                AppAssets.sebhabody,
                              width: size.width *.80,
                              ),
                            ),
                            Text(counter.toString(),
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                          ]
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
  onSebhaTab(){
    counter++;
    angle -= 1;
    if(counter==33){
      counter=0;
      currentIndex++;
      if(currentIndex==4) currentIndex=0;
    }
    setState(() {});
  }
}
