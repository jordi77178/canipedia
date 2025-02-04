import 'package:flutter/material.dart';

class AlimentsInterditsScreen extends StatelessWidget {
  // Styles de texte
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _boldTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aliments interdits")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image principale
              Image.asset("assets/images/soins/chocolat.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              // Introduction
              Text("Aliments toxiques pour les chiens", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Certains aliments, sans danger pour l'homme, peuvent être très dangereux pour les chiens. Il est crucial de connaître ces aliments pour éviter tout risque d'intoxication.",
                style: _textStyle,
              ),
              SizedBox(height: 20),

              // Liste d'aliments interdits
              Text("Liste des aliments interdits", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Chocolat",
                "Contient de la théobromine, pouvant entraîner des troubles cardiaques et neurologiques.",
              ),
              _buildDetailBlock(
                "Raisins et raisins secs",
                "Peuvent provoquer une insuffisance rénale aiguë.",
              ),
              _buildDetailBlock(
                "Oignon et ail",
                "Peuvent causer une anémie hémolytique en détruisant les globules rouges.",
              ),
              _buildDetailBlock(
                "Avocat",
                "Contient une substance toxique pour certains chiens.",
              ),
              SizedBox(height: 20),

              // Conseils pratiques
              Text("Conseils pratiques", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Lisez toujours les étiquettes",
                "Assurez-vous que les aliments ne contiennent pas d'ingrédients toxiques pour votre chien.",
              ),
              SizedBox(height: 20),

              // Erreurs à éviter
              Text("Erreurs à éviter", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Donner des restes de table",
                "Les restes peuvent contenir des ingrédients dangereux ou en quantités excessives.",
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailBlock(String title, String description) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: _boldTextStyle),
            SizedBox(height: 5),
            Text(description, style: _textStyle),
          ],
        ),
      ),
    );
  }
}