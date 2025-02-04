import 'package:flutter/material.dart';

class FriandisesSainesScreen extends StatelessWidget {
  // Styles de texte
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _boldTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Friandises saines")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image principale
              Image.asset("assets/images/soins/friandise.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              // Introduction
              Text("Friandises saines pour chiens", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Les friandises naturelles permettent de récompenser votre chien tout en préservant sa santé. Elles sont généralement moins transformées et offrent un meilleur apport nutritionnel.",
                style: _textStyle,
              ),
              SizedBox(height: 20),

              // Avantages
              Text("Avantages", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Moins d'additifs",
                "Les friandises naturelles contiennent moins de conservateurs et d'additifs, garantissant une meilleure qualité nutritionnelle.",
              ),
              _buildDetailBlock(
                "Meilleur contrôle des calories",
                "Permettent de limiter l'apport calorique tout en récompensant le chien.",
              ),
              SizedBox(height: 20),

              // Conseils pratiques
              Text("Conseils pratiques", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Optez pour des produits de qualité",
                "Choisissez des friandises issues de sources naturelles et, si possible, bio.",
              ),
              SizedBox(height: 20),

              // Erreurs à éviter
              Text("Erreurs à éviter", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Excès de friandises",
                "Un apport excessif peut contribuer à une prise de poids et déséquilibrer l'alimentation.",
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