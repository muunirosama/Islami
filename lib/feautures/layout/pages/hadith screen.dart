import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/cores/constants/app_assets.dart';
import 'package:islami/feautures/layout/pages/hadith_item_card.dart';
import 'package:islami/feautures/layout/pages/hadithdata.dart';

class HadithScreen extends StatefulWidget {
   const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  List<Hadithdata> hadithDataList = [];

  @override
  Widget build(BuildContext context) {

   if(hadithDataList.isEmpty) LoadHadithData();

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  AppAssets.hadithBG
              )
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset( AppAssets.logo200),
          CarouselSlider(
              items: hadithDataList.map(
                  (e){
                    return HadithItemCard(
                      hadithData: e,
                    );
                  }
              ).toList(),
              options: CarouselOptions(

                aspectRatio:0.7,
                viewportFraction: 0.68,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                scrollDirection: Axis.horizontal,
              )
          )
        ],
      ),
    );
  }

  LoadHadithData() async{
   String content = await rootBundle.loadString("assets/files/ahadeth.txt");
   List<String> allHadithList = content.split("#");
   for (var element in allHadithList){
     String singleHadith =element.trim();
     int index = singleHadith.indexOf("\n");
    String hadithTitle = singleHadith.substring(0 , index);
    String hadithContent= singleHadith.substring(index + 1);

    var hadithData = Hadithdata(hadithTitle: hadithTitle, hadithContent: hadithContent);
    hadithDataList.add(hadithData);

    setState(() {});

   }
  }
}
