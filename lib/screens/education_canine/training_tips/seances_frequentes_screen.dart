import 'package:flutter/material.dart';

class SeancesFrequentesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Courtes séances mais fréquentes"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/education/chrono.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "Courtes séances mais fréquentes",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Des sessions d'entraînement courtes et régulières sont plus efficaces que de longues sessions occasionnelles. Elles maintiennent l'attention du chien et facilitent l'apprentissage progressif.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildTipDetailCard("Planifiez plusieurs sessions par jour", "Divisez l'entraînement en sessions de 5 à 10 minutes."),
              _buildTipDetailCard("Soyez constant", "Répétez régulièrement pour renforcer l'apprentissage."),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildTipDetailCard("Des séances trop longues", "Elles peuvent entraîner fatigue et démotivation."),
              _buildTipDetailCard("Inconstance", "La régularité est la clé pour progresser."),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTipDetailCard(String title, String description) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.check_circle, color: Colors.green),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}