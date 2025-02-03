import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'map_screen.dart';
import 'country_list_screen.dart';

class CountrySelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chiens par Pays", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Explorez les races de chiens à travers le monde",
              style: TextStyle(fontSize: 18, color: Colors.black87),
              textAlign: TextAlign.center,
            ).animate().fade(duration: 700.ms).slideY(begin: -0.1),

            const SizedBox(height: 30),

            _buildOptionCard(
              context,
              icon: Icons.map_rounded,
              title: "Voir sur la Carte",
              subtitle: "Découvrez les races de chiens sur une carte interactive",
              color: Colors.brown.shade300,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapScreen()),
              ),
            ).animate().fade(duration: 600.ms).slideY(begin: 0.1),

            const SizedBox(height: 20),

            _buildOptionCard(
              context,
              icon: Icons.list_rounded,
              title: "Voir la Liste des Pays",
              subtitle: "Accédez aux races par pays dans une liste détaillée",
              color: Colors.brown.shade300,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CountryListScreen()),
              ),
            ).animate().fade(duration: 800.ms).slideY(begin: 0.2),
          ],
        ),
      ),
    );
  }

  /// 📌 Carte interactive pour chaque option
  Widget _buildOptionCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required Color color,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color.withOpacity(0.9),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(2, 4)),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, size: 50, color: Colors.white),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 24, color: Colors.white70),
            ],
          ),
        ),
      ),
    );
  }
}