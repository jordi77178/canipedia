import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ApiService {
  static Future<List<Map<String, dynamic>>> fetchRaces() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/bdchiens.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      return jsonData.entries.map((entry) {
        return {
          'name': entry.key,
          'data': entry.value,
        };
      }).toList();
    } catch (e) {
      throw Exception('Erreur lors du chargement des races: $e');
    }
  }
}