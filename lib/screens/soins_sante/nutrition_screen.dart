import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/screens/soins_sante/nutrition/aliments_interdits_screen.dart';
import '/screens/soins_sante/nutrition/friandises_saines_screen.dart';
import '/screens/soins_sante/nutrition/glucides_avec_moderation_screen.dart';
import '/screens/soins_sante/nutrition/hydratation_screen.dart';
import '/screens/soins_sante/nutrition/legumes_et_fibres_screen.dart';
import '/screens/soins_sante/nutrition/proteines_essentielles_screen.dart';



class NutritionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> nutritionTips = [
    {
      "title": "Protéines essentielles",
      "description":
      "Les chiens ont besoin de protéines animales pour leur croissance et leur énergie. rotéines animales pour leur croissance et leur énergie.",
      "image": "assets/images/soins/proteines.png",
      "color": Colors.brown.shade300,
      "page": ProteinesEssentiellesScreen(),
    },
    {
      "title": "Légumes et fibres",
      "description":
      "Ajoutez des légumes comme carottes, courgettes ou épinards pour améliorer la digestion et la santé intestinale.",
      "image": "assets/images/soins/fibres.png",
      "color": Colors.brown.shade300,
      "page": LegumesEtFibresScreen(),
    },
    {
      "title": "Glucides : avec modération",
      "description":
      "Les glucides fournissent de l'énergie, mais ne doivent pas dépasser 30% de l’alimentation.",
      "image": "assets/images/soins/glucides.png",
      "color": Colors.brown.shade300,
      "page": GlucidesAvecModerationScreen(),
    },
    {
      "title": "Aliments interdits",
      "description":
      "Évitez le chocolat, les raisins, l’oignon, l’ail et l’avocat qui sont toxiques pour les chiens.",
      "image": "assets/images/soins/chocolat.png",
      "color": Colors.brown.shade300,
      "page": AlimentsInterditsScreen(),
    },
    {
      "title": "L'importance de l’hydratation",
      "description":
      "Un chien doit boire entre 50 et 100 ml d’eau par kilo et par jour.",
      "image": "assets/images/soins/hydratation.png",
      "color": Colors.brown.shade300,
      "page": HydratationScreen(),
    },
    {
      "title": "Friandises saines",
      "description":
      "Optez pour des friandises naturelles comme des morceaux de pommes, des bâtonnets de carottes ou des os à mâcher naturels.",
      "image": "assets/images/soins/friandise.png",
      "color": Colors.brown.shade300,
      "page": FriandisesSainesScreen(),
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
              tip["page"],
              // On passe ici la page de détail à afficher lors du tap

            );
          },
        ),
      ),
    );
  }

  Widget _buildNutritionCard(
      String title,
      String description,
      String imagePath,
      Color bgColor,
      BuildContext context,
      Widget page,
      ) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
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
              // Texte à gauche (70%)
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
              // Image à droite (30%)
              Expanded(
                flex: 4,
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
}