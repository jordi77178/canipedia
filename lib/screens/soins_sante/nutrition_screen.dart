import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NutritionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> nutritionTips = [
    {
      "title": "🥩 Protéines essentielles",
      "description": "Les chiens ont besoin de protéines animales pour leur croissance et leur énergie. Viandes maigres, œufs et poissons sont idéaux.",
      "image": "assets/images/proteins.png",
      "color": Colors.red.shade300,
    },
    {
      "title": "🥦 Légumes et fibres",
      "description": "Ajoutez des légumes comme carottes, courgettes ou épinards pour améliorer la digestion et la santé intestinale.",
      "image": "assets/images/vegetables.png",
      "color": Colors.green.shade400,
    },
    {
      "title": "🥔 Glucides : avec modération",
      "description": "Les glucides (riz, patates douces) fournissent de l'énergie, mais ne doivent pas dépasser 30% de l’alimentation.",
      "image": "assets/images/carbs.png",
      "color": Colors.orange.shade300,
    },
    {
      "title": "🛑 Aliments interdits",
      "description": "Évitez le chocolat, les raisins, l’oignon, l’ail et l’avocat qui sont toxiques pour les chiens.",
      "image": "assets/images/forbidden_food.png",
      "color": Colors.red.shade700,
    },
    {
      "title": "💧 L'importance de l’hydratation",
      "description": "Un chien doit boire entre 50 et 100 ml d’eau par kilo et par jour pour rester en bonne santé.",
      "image": "assets/images/hydration.png",
      "color": Colors.blue.shade400,
    },
    {
      "title": "🦴 Friandises saines",
      "description": "Optez pour des friandises naturelles comme des morceaux de pommes, des bâtonnets de carottes ou des os à mâcher naturels.",
      "image": "assets/images/treats.png",
      "color": Colors.brown.shade400,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nutrition & Alimentation")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: nutritionTips.length,
          itemBuilder: (context, index) {
            final tip = nutritionTips[index];
            return _buildNutritionCard(
              tip["title"],
              tip["description"],
              tip["image"],
              tip["color"],
              context,
            );
          },
        ),
      ),
    );
  }

  Widget _buildNutritionCard(
      String title, String description, String imagePath, Color bgColor, BuildContext context) {
    return GestureDetector(
      onTap: () => _showNutritionDetail(context, title, description, imagePath),
      child: Card(
        elevation: 6,
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: bgColor ?? Colors.grey,
          ),
          child: Row(
            children: [
              // ✅ Texte à gauche (prend 70% de la largeur)
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        description,
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
              // ✅ Image totalement à droite (prend 30% de la largeur)
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
        ),
      ).animate().fade(duration: 500.ms).slideX(begin: 0.1),
    );
  }

  void _showNutritionDetail(BuildContext context, String title, String description, String imagePath) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2)],
                ),
                child: Column(
                  children: [
                    // ✅ Titre et bouton de fermeture
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.close, size: 28, color: Colors.grey[700]),
                          onPressed: () => Navigator.pop(context),
                        ).animate().rotate(duration: 600.ms),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 10),
                    // ✅ Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(imagePath, height: 150, fit: BoxFit.cover),
                    ).animate().fade(duration: 500.ms).scaleXY(begin: 0.9, end: 1),
                    SizedBox(height: 15),
                    // ✅ Description détaillée
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            description,
                            style: TextStyle(fontSize: 16, height: 1.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}