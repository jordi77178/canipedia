import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailRaceScreen extends StatelessWidget {
  final Map<String, dynamic> race;

  DetailRaceScreen({required this.race});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = race['data'];
    final String? photoUrl = data['photo_url'];

    return Scaffold(
      appBar: AppBar(
        title: Text(race['name'], style: GoogleFonts.lobster(fontSize: 24, color: Colors.white)),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          if (photoUrl != null && photoUrl.isNotEmpty)
            Image.network(photoUrl, errorBuilder: (_, __, ___) => Icon(Icons.error)),
          Text('Description: ${data['description'] ?? 'Aucune description disponible'}'),
        ],
      ),
    );
  }
}