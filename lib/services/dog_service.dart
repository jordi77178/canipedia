import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/dog.dart';

class DogService {
  static Future<List<Dog>> loadDogs() async {
    try {
      final String response = await rootBundle.loadString('assets/data/bdchiens.json');
      final Map<String, dynamic> data = json.decode(response);

      print("🔍 Données JSON reçues : $data"); // ✅ Debugging

      return data.entries.map((entry) => Dog.fromJson(entry.key, entry.value)).toList();
    } catch (e) {
      print("❌ Erreur lors du chargement du JSON : $e");
      return [];
    }
  }
}