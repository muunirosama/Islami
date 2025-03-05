import 'dart:convert';
import 'package:http/http.dart' as http;

class QuranRadioService {
  static const String apiUrl = 'https://mp3quran.net/api/v3/radios?language=ar';

  static Future<List<RadioStation>> fetchRadioStations() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<RadioStation> stations = (data['radios'] as List)
          .map((json) => RadioStation.fromJson(json))
          .toList();
      return stations;
    } else {
      throw Exception('Failed to load radio stations');
    }
  }
}

class RadioStation {
  final String name;
  final String url;

  RadioStation({required this.name, required this.url});

  factory RadioStation.fromJson(Map<String, dynamic> json) {
    return RadioStation(
      name: json['name'],
      url: json['url'],
    );
  }
}
