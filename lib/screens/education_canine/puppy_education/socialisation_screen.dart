// lib/screens/education_canine/puppy_education/socialisation_screen.dart
import 'package:flutter/material.dart';

class SocialisationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Socialisation précoce"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/education/socialisation.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text("Socialisation précoce", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                "Exposez votre chiot à diverses personnes, bruits et environnements dès son plus jeune âge. Cette étape est cruciale pour développer sa confiance et son adaptabilité.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildTipCard("Variez les rencontres", "Rencontrez des personnes de tous âges et de tous horizons."),
              _buildTipCard("Exposition progressive", "Commencez dans un environnement calme avant d'exposer votre chiot à des situations plus stimulantes."),
              _buildTipCard("Utilisez des jeux interactifs", "Les jeux facilitent la socialisation et renforcent la confiance."),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildTipCard("Forcer la rencontre", "Laissez toujours le chiot s'approcher à son rythme."),
              _buildTipCard("Ignorer les signes de stress", "Soyez attentif aux signaux de fatigue ou de peur de votre chiot."),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTipCard(String title, String description) {
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