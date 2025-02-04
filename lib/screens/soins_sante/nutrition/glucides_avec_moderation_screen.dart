import 'package:flutter/material.dart';

class GlucidesAvecModerationScreen extends StatelessWidget {
  // Styles de texte
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _boldTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Glucides : avec modération")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image principale
              Image.asset("assets/images/soins/glucides.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              // Introduction
              Text("Le rôle des glucides", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Les glucides apportent une source d'énergie rapide, mais leur apport doit être contrôlé afin de prévenir la prise de poids.",
                style: _textStyle,
              ),
              SizedBox(height: 20),

              // Utilisation et recommandations
              Text("Utilisation des glucides", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Source d'énergie",
                "Ils offrent une énergie rapide pour l'activité quotidienne, à condition de ne pas en abuser.",
              ),
              _buildDetailBlock(
                "Quantité recommandée",
                "Les glucides ne doivent pas excéder 30% de l'alimentation totale du chien.",
              ),
              SizedBox(height: 20),

              // Conseils pratiques
              Text("Conseils pratiques", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Optez pour des glucides complexes",
                "Privilégiez le riz complet ou les patates douces pour une libération d'énergie plus stable.",
              ),
              SizedBox(height: 20),

              // Erreurs à éviter
              Text("Erreurs à éviter", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Excès de glucides",
                "Un apport trop élevé peut entraîner l'obésité et d'autres problèmes de santé.",
              ),
              _buildDetailBlock(
                "Glucides raffinés",
                "Évitez les glucides transformés, moins nutritifs et susceptibles de provoquer des pics glycémiques.",
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