import 'package:flutter/material.dart';

class RecompensesMotivationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Récompenses et motivation"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/education/recompense.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "Récompenses et motivation",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Utilisez des friandises, des caresses et des mots d'encouragement pour renforcer les comportements positifs. Les récompenses motivent le chien et facilitent l'apprentissage de nouveaux ordres.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildTipDetailCard("Choisissez des récompenses adaptées", "Utilisez des friandises de petite taille et de qualité."),
              _buildTipDetailCard("Récompensez immédiatement", "Félicitez et récompensez dès que le chien exécute correctement une commande."),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildTipDetailCard("Récompenser de manière inappropriée", "Ne donnez pas de friandises si le comportement n'est pas correct."),
              _buildTipDetailCard("Trop en faire", "Évitez de récompenser chaque fois, afin de ne pas créer d'attentes non réalistes."),
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