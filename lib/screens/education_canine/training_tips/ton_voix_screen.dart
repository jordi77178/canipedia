import 'package:flutter/material.dart';

class TonVoixScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Utilisation du bon ton de voix"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/education/ton.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "Utilisation du bon ton de voix",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Un ton calme et ferme aide le chien à comprendre vos commandes, tandis qu'un ton agressif ou criard peut induire de la peur et de la confusion.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildTipDetailCard("Utilisez un ton constant", "Utilisez toujours le même ton pour les mêmes commandes."),
              _buildTipDetailCard("Parlez calmement", "Adoptez une voix posée pour rassurer votre chien."),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildTipDetailCard("Crier ou hausser le ton", "Crier peut perturber et effrayer votre chien."),
              _buildTipDetailCard("Changer fréquemment de ton", "Cela crée de la confusion et nuit à l'apprentissage."),
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