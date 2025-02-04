import 'package:flutter/material.dart';

class PunitionInutileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Évitez les punitions inutiles"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/education/punirinutile.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "Évitez les punitions inutiles",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Punir un chien après coup ne fonctionne pas et peut même aggraver les comportements indésirables. Privilégiez le renforcement positif et la patience pour guider votre chien.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildTipDetailCard("Utilisez le renforcement positif", "Récompensez les bons comportements plutôt que de punir les mauvais."),
              _buildTipDetailCard("Soyez patient", "Laissez le temps à votre chien d'apprendre et de comprendre."),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildTipDetailCard("Punir après-coup", "Les punitions tardives ne permettent pas de lier l'erreur à l'action."),
              _buildTipDetailCard("Utiliser la violence", "La violence endommage la relation de confiance avec votre chien."),
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