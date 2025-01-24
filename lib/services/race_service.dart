import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class RaceService {
  static Future<List<Map<String, dynamic>>> loadRaceData() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/bdchiens.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      final List<Map<String, dynamic>> raceList = jsonData.entries.map((entry) {
        return {
          'name': entry.key,
          'data': entry.value,
        };
      }).toList();

      raceList.sort((a, b) => a['name'].compareTo(b['name']));

      print("✅ ${raceList.length} races chargées !");
      return raceList;
    } catch (e) {
      print("❌ Erreur chargement races: $e");
      return [];
    }
  }
}