import 'package:flutter/material.dart';
import 'package:islami/cores/constants/app_assets.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:islami/cores/themes/app_colors.dart';
import 'package:islami/models/Radio_service.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});
  @override
  _RadioScreenState createState() => _RadioScreenState();
}
class _RadioScreenState extends State<RadioScreen> {
  late Future<List<RadioStation>> _radioStations;
  final AudioPlayer _audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.loop);
  String? _playingUrl;

  bool _isMuted = false;
  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
    });
    _audioPlayer.setVolume(_isMuted ? 0.0 : 1.0);
  }
  @override
  void initState() {
    super.initState();
    _radioStations = QuranRadioService.fetchRadioStations();
  }
  void _togglePlay(String url) async {
    if (_playingUrl == url) {
      await _audioPlayer.pause();
      setState(() {
        _playingUrl = null;
      });
    } else {
      await _audioPlayer.stop();
      await _audioPlayer.setSourceUrl(url);
      await _audioPlayer.resume();
      setState(() {
        _playingUrl = url;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppAssets.radioBG),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              "Quran Radio",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: FutureBuilder<List<RadioStation>>(
                future: _radioStations,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Failed to load data', style: TextStyle(color: Colors.white)));
                  }

                  final stations = snapshot.data!;
                  return ListView.builder(
                    itemCount: stations.length,
                    itemBuilder: (context, index) {
                      final station = stations[index];
                      bool isPlaying = station.url == _playingUrl;

                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          title: Text(
                            station.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20
                            ),
                          ),
                          leading: IconButton(
                            icon: Icon(
                              isPlaying ? Icons.pause_circle : Icons.play_circle,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () => _togglePlay(station.url),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              _isMuted ? Icons.volume_off : Icons.volume_up,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: _toggleMute,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

