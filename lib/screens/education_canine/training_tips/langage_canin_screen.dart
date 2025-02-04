import 'package:flutter/material.dart';

class LangageCaninScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comprendre le langage canin"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/education/dialogue.png", height: 250, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "Comprendre le langage canin",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Apprenez à décoder les signaux corporels de votre chien, tels que la posture, les mouvements de la queue et les expressions faciales. Cette connaissance vous permettra de mieux comprendre ses émotions et ses besoins.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text("Conseils pratiques", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildTipDetailCard("Observer attentivement", "Prenez le temps d'observer votre chien dans différentes situations."),
              _buildTipDetailCard("Se former sur le sujet", "Informez-vous sur les signaux canins pour améliorer votre communication."),
              SizedBox(height: 20),
              Text("Erreurs à éviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildTipDetailCard("Ignorer les signaux", "Ne négligez pas les signes de stress ou d'inconfort de votre chien."),
              _buildTipDetailCard("Interpréter trop rapidement", "Ne tirez pas de conclusions hâtives sans observer l'ensemble du comportement."),
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