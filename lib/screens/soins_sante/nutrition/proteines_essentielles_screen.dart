import 'package:flutter/material.dart';

class ProteinesEssentiellesScreen extends StatelessWidget {
  // Styles de texte
  final TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle _boldTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Protéines essentielles")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image principale
              Image.asset("assets/images/soins/proteines.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),

              // Introduction
              Text("L'importance des protéines", style: _titleStyle),
              SizedBox(height: 10),
              Text(
                "Les protéines jouent un rôle fondamental dans la croissance, la réparation des tissus et l'énergie des chiens. Elles fournissent les acides aminés essentiels nécessaires au développement musculaire et au bon fonctionnement du corps.",
                style: _textStyle,
              ),
              SizedBox(height: 20),

              // Avantages et sources
              Text("Avantages et sources", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Avantages",
                "Des protéines de qualité favorisent la croissance, renforcent le système immunitaire et améliorent la récupération après l'effort.",
              ),
              _buildDetailBlock(
                "Sources recommandées",
                "Viandes maigres, œufs, poissons et certaines légumineuses fournissent des protéines adaptées aux besoins canins.",
              ),
              SizedBox(height: 20),

              // Conseils pratiques
              Text("Conseils pratiques", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Choisissez des sources de haute qualité",
                "Privilégiez des viandes fraîches et évitez les sous-produits de moindre qualité.",
              ),
              _buildDetailBlock(
                "Variez les sources",
                "Alternez entre différentes sources pour un profil nutritionnel complet.",
              ),
              SizedBox(height: 20),

              // Erreurs à éviter
              Text("Erreurs à éviter", style: _titleStyle),
              SizedBox(height: 10),
              _buildDetailBlock(
                "Excès de protéines",
                "Un excès peut entraîner des problèmes rénaux, surtout chez les chiens âgés ou fragilisés.",
              ),
              _buildDetailBlock(
                "Sources de faible qualité",
                "Évitez les produits transformés ou contenant des additifs nocifs.",
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