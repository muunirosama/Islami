import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final Map<String, dynamic> date;

  HeaderSection({required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16,),
        Text(
          date["readable"],
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        Text(
          "${date["hijri"]["day"]} ${date["hijri"]["month"]["en"]}, ${date["hijri"]["year"]} AH",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 18),
      ],
    );
  }
}