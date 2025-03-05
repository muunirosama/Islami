import 'package:flutter/material.dart';
import 'package:islami/cores/constants/app_assets.dart';
import 'package:islami/models/HeaderSection.dart';
import 'package:islami/models/PrayerTimeCard.dart';
import 'package:islami/models/PrayerTimesService.dart';

class TimesScreen extends StatefulWidget {
  const TimesScreen({super.key});

  @override
  State<TimesScreen> createState() => _TimesScreenState();
}

class _TimesScreenState extends State<TimesScreen> {
  Map<String, dynamic>? _prayerTimes;

  @override
  void initState() {
    super.initState();
    fetchTimes();
  }

  void fetchTimes() async {
    try {
      final data = await PrayerTimesService().fetchPrayerTimes();
      setState(() {
        _prayerTimes = data;
      });
    } catch (e) {
      print("Error fetching prayer times: $e");
    }
  }

  Map<String, dynamic>? get prayerData => _prayerTimes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppAssets.timesBG), // Background Image
        ),
      ),
      child: prayerData == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            HeaderSection(date: prayerData!["date"]),
            PrayerTimeCard(prayerTimes: prayerData!["timings"]),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
