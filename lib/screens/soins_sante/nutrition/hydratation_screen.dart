import 'package:flutter/material.dart';

class HydratationScreen extends StatelessWidget {
  // Styles de texte
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _boldTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hydratation")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image principale
              Image.asset("assets/images/soins/hydratation.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              // Introduction
              Text("L'importance de l'hydratation", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "L'eau est essentielle pour le bon fonctionnement de l'organisme. Une hydratation adéquate aide à réguler la température, facilite la digestion et assure le bon fonctionnement des organes.",
                style: _textStyle,
              ),
              SizedBox(height: 20),

              // Recommandations
              Text("Recommandations", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Quantité d'eau",
                "Un chien doit boire entre 50 et 100 ml d'eau par kilo de poids par jour.",
              ),
              _buildDetailBlock(
                "Accès permanent",
                "Assurez-vous que votre chien a toujours accès à de l'eau fraîche et propre.",
              ),
              SizedBox(height: 20),

              // Conseils pratiques
              Text("Conseils pratiques", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Utilisez un bol adapté",
                "Un bol stable et de taille appropriée encourage votre chien à boire régulièrement.",
              ),
              SizedBox(height: 20),

              // Erreurs à éviter
              Text("Erreurs à éviter", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Négliger la vérification",
                "Surveillez régulièrement le niveau d'eau et nettoyez le bol pour éviter les contaminations.",
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