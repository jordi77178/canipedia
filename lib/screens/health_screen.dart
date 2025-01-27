import 'package:flutter/material.dart';

class HealthScreen extends StatelessWidget {
  final List<Map<String, String>> healthTips = [
    {"title": "Alimentation équilibrée", "content": "Privilégiez une alimentation riche en protéines et sans céréales."},
    {"title": "Les vaccins essentiels", "content": "Votre chien doit être vacciné contre la rage, la leptospirose et la parvovirose."},
    {"title": "Soins des dents", "content": "Brossez les dents de votre chien pour éviter le tartre."},
    {"title": "Prévenir les parasites", "content": "Utilisez des traitements antiparasitaires contre les puces et tiques."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Soins & Santé")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: healthTips.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                title: Text(healthTips[index]["title"]!, style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(healthTips[index]["content"]!),
                leading: Icon(Icons.health_and_safety, color: Colors.red),
              ),
            );
          },
        ),
      ),
    );
  }
}