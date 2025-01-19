import 'package:flutter/material.dart';
import 'package:islami/cores/constants/app_assets.dart';
import 'package:islami/cores/themes/app_colors.dart';
import 'package:islami/feautures/layout/pages/QuranDetails.dart';
import 'package:islami/feautures/layout/pages/recent%20card%20widget%20quran.dart';
import 'package:islami/feautures/layout/pages/sura%20card%20list.dart';
import 'package:islami/models/recent-data.dart';
import 'package:islami/models/sura.dart';

class QuranScreen extends StatefulWidget {

   QuranScreen({super.key, });

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<RecentData> recentDataList=[
    RecentData(suraName: "Al-Anbia",
        suraNameAr: "الأنبياء",
        suraVerses:"112"),
    RecentData(suraName: "Al-Fatiha",
        suraNameAr: "الفاتحة",
        suraVerses:"7")
  ];

  String searchQuery='';

   List<Sura> suras =[
     Sura(id: 1, nameEn: "Al-Fatiha", nameAr: "الفاتحه", verses: 7),
     Sura(id: 2, nameEn: "Al-Baqarah", nameAr: "البقرة", verses: 286),
     Sura(id: 3, nameEn: "Aal-E-Imran", nameAr: "آل عمران", verses: 200),
     Sura(id: 4, nameEn: "An-Nisa'", nameAr: "النساء", verses: 176),
     Sura(id: 5, nameEn: "Al-Ma'idah", nameAr: "المائدة", verses: 120),
     Sura(id: 6, nameEn: "Al-An'am", nameAr: "الأنعام", verses: 165),
     Sura(id: 7, nameEn: "Al-A'raf", nameAr: "الأعراف", verses: 206),
     Sura(id: 8, nameEn: "Al-Anfal", nameAr: "الأنفال", verses: 75),
     Sura(id: 9, nameEn: "At-Tawbah", nameAr: "التوبة", verses: 129),
     Sura(id: 10, nameEn: "Yunus", nameAr: "يونس", verses: 109),
     Sura(id: 11, nameEn: "Hud", nameAr: "هود", verses: 123),
     Sura(id: 12, nameEn: "Yusuf", nameAr: "يوسف", verses: 111),
     Sura(id: 13, nameEn: "Ar-Ra'd", nameAr: "الرعد", verses: 43),
     Sura(id: 14, nameEn: "Ibrahim", nameAr: "إبراهيم", verses: 52),
     Sura(id: 15, nameEn: "Al-Hijr", nameAr: "الحجر", verses: 99),
     Sura(id: 16, nameEn: "An-Nahl", nameAr: "النحل", verses: 128),
     Sura(id: 17, nameEn: "Al-Isra", nameAr: "الإسراء", verses: 111),
     Sura(id: 18, nameEn: "Al-Kahf", nameAr: "الكهف", verses: 110),
     Sura(id: 19, nameEn: "Maryam", nameAr: "مريم", verses: 98),
     Sura(id: 20, nameEn: "Ta-Ha", nameAr: "طه", verses: 135),
     Sura(id: 21, nameEn: "Al-Anbiya", nameAr: "الأنبياء", verses: 112),
     Sura(id: 22, nameEn: "Al-Hajj", nameAr: "الحج", verses: 78),
     Sura(id: 23, nameEn: "Al-Mu'minun", nameAr: "المؤمنون", verses: 118),
     Sura(id: 24, nameEn: "An-Nur", nameAr: "النّور", verses: 64),
     Sura(id: 25, nameEn: "Al-Furqan", nameAr: "الفرقان", verses: 77),
     Sura(id: 26, nameEn: "Ash-Shu'ara", nameAr: "الشعراء", verses: 227),
     Sura(id: 27, nameEn: "An-Naml", nameAr: "النّمل", verses: 93),
     Sura(id: 28, nameEn: "Al-Qasas", nameAr: "القصص", verses: 88),
     Sura(id: 29, nameEn: "Al-Ankabut", nameAr: "العنكبوت", verses: 69),
     Sura(id: 30, nameEn: "Ar-Rum", nameAr: "الرّوم", verses: 60),
     Sura(id: 31, nameEn: "Luqman", nameAr: "لقمان", verses: 34),
     Sura(id: 32, nameEn: "As-Sajda", nameAr: "السجدة", verses: 30),
     Sura(id: 33, nameEn: "Al-Ahzab", nameAr: "الأحزاب", verses: 73),
     Sura(id: 34, nameEn: "Saba", nameAr: "سبأ", verses: 54),
     Sura(id: 35, nameEn: "Fatir", nameAr: "فاطر", verses: 45),
     Sura(id: 36, nameEn: "Ya-Sin", nameAr: "يس", verses: 83),
     Sura(id: 37, nameEn: "As-Saffat", nameAr: "الصافات", verses: 182),
     Sura(id: 38, nameEn: "Sad", nameAr: "ص", verses: 88),
     Sura(id: 39, nameEn: "Az-Zumar", nameAr: "الزمر", verses: 75),
     Sura(id: 40, nameEn: "Ghafir", nameAr: "غافر", verses: 85),
     Sura(id: 41, nameEn: "Fussilat", nameAr: "فصّلت", verses: 54),
     Sura(id: 42, nameEn: "Ash-Shura", nameAr: "الشورى", verses: 53),
     Sura(id: 43, nameEn: "Az-Zukhruf", nameAr: "الزخرف", verses: 89),
     Sura(id: 44, nameEn: "Ad-Dukhan", nameAr: "الدّخان", verses: 59),
     Sura(id: 45, nameEn: "Al-Jathiya", nameAr: "الجاثية", verses: 37),
     Sura(id: 46, nameEn: "Al-Ahqaf", nameAr: "الأحقاف", verses: 35),
     Sura(id: 47, nameEn: "Muhammad", nameAr: "محمد", verses: 38),
     Sura(id: 48, nameEn: "Al-Fath", nameAr: "الفتح", verses: 29),
     Sura(id: 49, nameEn: "Al-Hujurat", nameAr: "الحجرات", verses: 18),
     Sura(id: 50, nameEn: "Qaf", nameAr: "ق", verses: 45),
     Sura(id: 51, nameEn: "Adh-Dhariyat", nameAr: "الذاريات", verses: 60),
     Sura(id: 52, nameEn: "At-Tur", nameAr: "الطور", verses: 49),
     Sura(id: 53, nameEn: "An-Najm", nameAr: "النجم", verses: 62),
     Sura(id: 54, nameEn: "Al-Qamar", nameAr: "القمر", verses: 55),
     Sura(id: 55, nameEn: "Ar-Rahman", nameAr: "الرحمن", verses: 78),
     Sura(id: 56, nameEn: "Al-Waqi'a", nameAr: "الواقعة", verses: 96),
     Sura(id: 57, nameEn: "Al-Hadid", nameAr: "الحديد", verses: 29),
     Sura(id: 58, nameEn: "Al-Mujadila", nameAr: "المجادلة", verses: 22),
     Sura(id: 59, nameEn: "Al-Hashr", nameAr: "الحشر", verses: 24),
     Sura(id: 60, nameEn: "Al-Mumtahina", nameAr: "الممتحنة", verses: 13),
     Sura(id: 61, nameEn: "As-Saff", nameAr: "الصف", verses: 14),
     Sura(id: 62, nameEn: "Al-Jumu'a", nameAr: "الجمعة", verses: 11),
     Sura(id: 63, nameEn: "Al-Munafiqun", nameAr: "المنافقون", verses: 11),
     Sura(id: 64, nameEn: "At-Taghabun", nameAr: "التغابن", verses: 18),
     Sura(id: 65, nameEn: "At-Talaq", nameAr: "الطلاق", verses: 12),
     Sura(id: 66, nameEn: "At-Tahrim", nameAr: "التحريم", verses: 12),
     Sura(id: 67, nameEn: "Al-Mulk", nameAr: "الملك", verses: 30),
     Sura(id: 68, nameEn: "Al-Qalam", nameAr: "القلم", verses: 52),
     Sura(id: 69, nameEn: "Al-Haqqah", nameAr: "الحاقة", verses: 52),
     Sura(id: 70, nameEn: "Al-Ma'arij", nameAr: "المعارج", verses: 44),
     Sura(id: 71, nameEn: "Nuh", nameAr: "نوح", verses: 28),
     Sura(id: 72, nameEn: "Al-Jinn", nameAr: "الجن", verses: 28),
     Sura(id: 73, nameEn: "Al-Muzzammil", nameAr: "المزّمّل", verses: 20),
     Sura(id: 74, nameEn: "Al-Muddathir", nameAr: "المدّثر", verses: 56),
     Sura(id: 75, nameEn: "Al-Qiyamah", nameAr: "القيامة", verses: 40),
     Sura(id: 76, nameEn: "Al-Insan", nameAr: "الإنسان", verses: 31),
     Sura(id: 77, nameEn: "Al-Mursalat", nameAr: "المرسلات", verses: 50),
     Sura(id: 78, nameEn: "An-Naba'", nameAr: "النبأ", verses: 40),
     Sura(id: 79, nameEn: "An-Nazi'at", nameAr: "النازعات", verses: 46),
     Sura(id: 80, nameEn: "Abasa", nameAr: "عبس", verses: 42),
     Sura(id: 81, nameEn: "At-Takwir", nameAr: "التكوير", verses: 29),
     Sura(id: 82, nameEn: "Al-Infitar", nameAr: "الإنفطار", verses: 19),
     Sura(id: 83, nameEn: "Al-Mutaffifin", nameAr: "المطفّفين", verses: 36),
     Sura(id: 84, nameEn: "Al-Inshiqaq", nameAr: "الإنشقاق", verses: 25),
     Sura(id: 85, nameEn: "Al-Buruj", nameAr: "البروج", verses: 22),
     Sura(id: 86, nameEn: "At-Tariq", nameAr: "الطارق", verses: 17),
     Sura(id: 87, nameEn: "Al-A'la", nameAr: "الأعلى", verses: 19),
     Sura(id: 88, nameEn: "Al-Ghashiyah", nameAr: "الغاشية", verses: 26),
     Sura(id: 89, nameEn: "Al-Fajr", nameAr: "الفجر", verses: 30),
     Sura(id: 90, nameEn: "Al-Balad", nameAr: "البلد", verses: 20),
     Sura(id: 91, nameEn: "Ash-Shams", nameAr: "الشمس", verses: 15),
     Sura(id: 92, nameEn: "Al-Lail", nameAr: "الليل", verses: 21),
     Sura(id: 93, nameEn: "Ad-Duha", nameAr: "الضحى", verses: 11),
     Sura(id: 94, nameEn: "Ash-Sharh", nameAr: "الشرح", verses: 8),
     Sura(id: 95, nameEn: "At-Tin", nameAr: "التين", verses: 8),
     Sura(id: 96, nameEn: "Al-Alaq", nameAr: "العلق", verses: 19),
     Sura(id: 97, nameEn: "Al-Qadr", nameAr: "القدر", verses: 5),
     Sura(id: 98, nameEn: "Al-Bayyina", nameAr: "البينة", verses: 8),
     Sura(id: 99, nameEn: "Az-Zalzalah", nameAr: "الزلزلة", verses: 8),
     Sura(id: 100, nameEn: "Al-Adiyat", nameAr: "العاديات", verses: 11),
     Sura(id: 101, nameEn: "Al-Qari'a", nameAr: "القارعة", verses: 11),
     Sura(id: 102, nameEn: "At-Takathur", nameAr: "التكاثر", verses: 8),
     Sura(id: 103, nameEn: "Al-Asr", nameAr: "العصر", verses: 3),
     Sura(id: 104, nameEn: "Al-Humazah", nameAr: "الهمزة", verses: 9),
     Sura(id: 105, nameEn: "Al-Fil", nameAr: "الفيل", verses: 5),
     Sura(id: 106, nameEn: "Quraish", nameAr: "قريش", verses: 4),
     Sura(id: 107, nameEn: "Al-Ma'un", nameAr: "الماعون", verses: 7),
     Sura(id: 108, nameEn: "Al-Kawthar", nameAr: "الكوثر", verses: 3),
     Sura(id: 109, nameEn: "Al-Kafirun", nameAr: "الكافرون", verses: 6),
     Sura(id: 110, nameEn: "An-Nasr", nameAr: "النصر", verses: 3),
     Sura(id: 111, nameEn: "Al-Masad", nameAr: "المسد", verses: 5),
     Sura(id: 112, nameEn: "Al-Ikhlas", nameAr: "الإخلاص", verses: 4),
     Sura(id: 113, nameEn: "Al-Falaq", nameAr: "الفلق", verses: 5),
     Sura(id: 114, nameEn: "An-Nas", nameAr: "الناس", verses: 6),
   ];

   List<Sura> searchSuraModel=[];

   @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
            image: AssetImage(
                AppAssets.quranBG
            )
        )
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Image.asset( AppAssets.quranislamilogo),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                cursorColor: AppColors.primaryColor,

                onChanged: (value){
                  searchQuery = value;
                  search();
                  setState(() {});
                },
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.white
                ),
                decoration: InputDecoration(
                  hintText: "Sura Name",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.white
                  ),
                  fillColor: AppColors.secondaryColor.withOpacity(.5),
                  filled: true,
                  enabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                    color:AppColors.primaryColor
                  ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color:AppColors.primaryColor
                    ),
                  ),
                  prefixIcon: ImageIcon(
                      AssetImage(
                    AppAssets.icn,
                  ),
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
           Visibility(
             visible: searchQuery.isEmpty,
             replacement: ListView.separated(
               shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               itemBuilder: (context,index)=> GestureDetector(
                 onTap: (){
                   Navigator.pushNamed(
                     context,
                     QuranDetails.routeName,
                     arguments: suras[searchSuraModel[index].id-1],
                   );
                 },
                 child: SuraCardList(
                   sura: searchSuraModel[index],
                 ),
               ),
               separatorBuilder: (context,index)=> const Divider(
                 endIndent: 60,
                 indent: 60,
               ),
               itemCount: searchSuraModel.length,
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                   child: Text(
                     "Most Recently",
                     style: TextStyle(
                         fontSize: 16,
                         fontWeight: FontWeight.bold,
                         color: AppColors.white
                     ),
                   ),
                 ),
                 SizedBox(
                   height: 155,
                   child: ListView.builder(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (context,index) =>
                         RecentCardQuran(
                           recentData: recentDataList[index],
                         ),
                     itemCount: recentDataList.length,
                   ),
                 ),
                 Padding (
                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                   child: Text(
                     "Suras List",
                     style: TextStyle(
                         fontSize: 16,
                         fontWeight: FontWeight.bold,
                         color: AppColors.white
                     ),
                   ),
                 ),
                 ListView.separated(
                   shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics(),
                   itemBuilder: (context,index)=> GestureDetector(
                     onTap: (){
                       Navigator.pushNamed(
                         context,
                         QuranDetails.routeName,
                         arguments: suras[suras[index].id-1],
                       );
                     },
                     child: SuraCardList(
                       sura: suras[index],
                     ),
                   ),
                   separatorBuilder: (context,index)=> const Divider(
                     endIndent: 60,
                     indent: 60,
                   ),
                   itemCount: suras.length,
                 ),
               ],
             ),
           )
          ]
            ),
      )
    );
  }

  // onSuraTap(int index){
  //    Navigator.pushNamed(
  //     context,
  //     QuranDetails.routeName,
  //     arguments: suras[index],
  //   );
  // }

  void search(){
     searchSuraModel= [];
     for(var sura in suras){
       if(sura.nameAr.toLowerCase().contains(searchQuery.toLowerCase()) ||
           sura.nameEn.toLowerCase().contains(searchQuery.toLowerCase())
       ){
         searchSuraModel.add(sura);
       }
     }
  }
}