import 'package:flutter/material.dart';

class LegumesEtFibresScreen extends StatelessWidget {
  // Styles de texte
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _boldTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Légumes et fibres")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image principale
              Image.asset("assets/images/soins/fibres.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              // Introduction
              Text("Les bienfaits des légumes", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Les légumes apportent des fibres essentielles pour une bonne digestion et aident à réguler le transit intestinal. Ils fournissent également des vitamines et minéraux indispensables.",
                style: _textStyle,
              ),
              SizedBox(height: 20),

              // Avantages nutritionnels
              Text("Avantages nutritionnels", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Digestion améliorée",
                "Les fibres facilitent le transit intestinal et préviennent la constipation.",
              ),
              _buildDetailBlock(
                "Apport en vitamines",
                "Les légumes riches en antioxydants et vitamine C renforcent le système immunitaire.",
              ),
              SizedBox(height: 20),

              // Conseils pratiques
              Text("Conseils pratiques", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Variez les légumes",
                "Alternez entre carottes, courgettes, épinards et autres pour un apport complet.",
              ),
              _buildDetailBlock(
                "Préservez les nutriments",
                "Privilégiez la cuisson à la vapeur pour conserver les vitamines.",
              ),
              SizedBox(height: 20),

              // Erreurs à éviter
              Text("Erreurs à éviter", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Surdosage en fibres",
                "Un excès peut entraîner des troubles digestifs, respectez les quantités recommandées.",
              ),
              _buildDetailBlock(
                "Légumes inappropriés",
                "Certains légumes peuvent être toxiques ou difficiles à digérer pour les chiens.",
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