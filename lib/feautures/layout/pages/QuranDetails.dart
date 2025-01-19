import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/cores/constants/app_assets.dart';
import 'package:islami/cores/themes/app_colors.dart';
import 'package:islami/models/sura.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName= "QuranDetails";

   const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List<String> versesList = [];

  @override
  Widget build(BuildContext context) {
    var args= ModalRoute.of(context)?.settings.arguments as Sura;

   if (versesList.isEmpty) loadData(args.id.toString());

    return  SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image:AssetImage(
                  AppAssets.qurandetailsimg
              ),
                  fit: BoxFit.fill
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: AppColors.primaryColor
            ),
            title: Text(args.nameEn,
            style: TextStyle(
                color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 60),
                child: Text(args.nameAr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) =>
              Text(
                "[${index+1}] ${versesList[index]} ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
            itemCount: versesList.length,
          ),
        )

            ],
          ),
        ),
      ),
    );
  }

  void loadData(String suraId) async{
    String content = await rootBundle.loadString("assets/files/$suraId.txt");
    setState(() {
      versesList = content.split("\n");
    });

  }
}
