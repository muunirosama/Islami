import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class PrayerTimesService {
  Future<Map<String, dynamic>> fetchPrayerTimes() async {
    String today = DateFormat('dd-MM-yyyy').format(DateTime.now());

    final url = "https://api.aladhan.com/v1/timingsByCity/$today?city=Cairo&country=Egypt";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      return {
        "timings": data["timings"],
        "date": data["date"]
      };
    } else {
      throw Exception('Failed to load prayer times');
    }
  }
}

