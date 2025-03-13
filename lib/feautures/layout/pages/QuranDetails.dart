import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/cores/constants/app_assets.dart';
import 'package:islami/cores/themes/app_colors.dart';
import 'package:islami/models/sura.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = "QuranDetails";

  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List<String> versesList = [];
  List<List<String>> pages = [];
  PageController _pageController = PageController();
  int currentPage = 0;
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var args = ModalRoute.of(context)?.settings.arguments as Sura;
      _loadLastReadPage(args.id.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Sura;

    if (versesList.isEmpty) {
      loadData(args.id.toString(), context);
    }

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.qurandetailsimg),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: AppColors.primaryColor),
            title: Text(
              args.nameEn,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.bookmark,
                  color: isBookmarked ? Colors.yellow : Colors.white,
                ),
                onPressed: () {
                  _saveLastReadPage(args.id.toString()); // ✅ تخزين الصفحة الخاصة بالسورة
                  _toggleBookmark(args.id.toString()); // ✅ تحديث العلامة لهذه السورة
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isBookmarked
                            ? "تم إزالة العلامة المرجعية من الصفحة ${currentPage + 1}"
                            : "تم حفظ الصفحة ${currentPage + 1}",
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          body: pages.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  args.nameAr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                    _checkIfBookmarked(args.id.toString());
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: pages[index].map((verse) {
                              int verseIndex =
                                  versesList.indexOf(verse) + 1;
                              return Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "[$verseIndex] $verse",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ✅ **تحميل البيانات وتقسيمها إلى صفحات**
  void loadData(String suraId, BuildContext context) async {
    String content = await rootBundle.loadString("assets/files/$suraId.txt");
    List<String> allVerses = content.split("\n");

    setState(() {
      versesList = allVerses;
      pages = splitVersesIntoPages(allVerses, context);
    });

    await _loadLastReadPage(suraId); // ✅ تحميل الصفحة الخاصة بالسورة الحالية بعد تجهيز البيانات
  }


  /// ✅ **تقسيم الآيات بناءً على الطول المتاح**
  List<List<String>> splitVersesIntoPages(List<String> verses, BuildContext context) {
    List<List<String>> pages = [];
    List<String> currentPage = [];
    double maxHeight = MediaQuery.of(context).size.height * 0.7;
    double currentHeight = 0.0;

    TextStyle textStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );

    for (String verse in verses) {
      double verseHeight = getTextHeight(verse, textStyle, context);

      if (currentHeight + verseHeight > maxHeight) {
        pages.add(currentPage);
        currentPage = [];
        currentHeight = 0.0;
      }

      currentPage.add(verse);
      currentHeight += verseHeight;
    }

    if (currentPage.isNotEmpty) {
      pages.add(currentPage);
    }

    return pages;
  }

  /// ✅ **حساب ارتفاع النص**
  double getTextHeight(String text, TextStyle style, BuildContext context) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: null,
      textDirection: TextDirection.rtl,
    )..layout(maxWidth: MediaQuery.of(context).size.width - 40);

    return textPainter.height + 16;
  }

  /// ✅ **تحميل آخر صفحة محفوظة**
  Future<void> _loadLastReadPage(String suraId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentPage = prefs.getInt('last_read_page_$suraId') ?? 0; // ✅ استرجاع الصفحة الخاصة بالسورة
    });

    _pageController = PageController(initialPage: currentPage); // ✅ تحديث المتحكم بالصفحة
  }

  /// ✅ **حفظ الصفحة الحالية**
  Future<void> _saveLastReadPage(String suraId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('last_read_page_$suraId', currentPage); // ✅ تخزين الصفحة لكل سورة
  }
  /// ✅ **تفعيل وإلغاء العلامة المرجعية**
  Future<void> _toggleBookmark(String suraId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String bookmarkKey = 'bookmarked_page_$suraId'; // ✅ مفتاح خاص لكل سورة

    if (isBookmarked) {
      await prefs.remove(bookmarkKey); // ✅ إزالة العلامة من هذه السورة فقط
      setState(() {
        isBookmarked = false;
      });
    } else {
      await prefs.setInt(bookmarkKey, currentPage); // ✅ حفظ العلامة لهذه السورة فقط
      setState(() {
        isBookmarked = true;
      });
    }
  }

  /// ✅ **التحقق مما إذا كانت الصفحة محفوظة**
  Future<void> _checkIfBookmarked(String suraId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? bookmarkedPage = prefs.getInt('bookmarked_page_$suraId');

    setState(() {
      isBookmarked = (bookmarkedPage == currentPage);
    });
  }
}
