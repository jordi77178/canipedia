import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'nutrition_screen.dart';
import 'hygiene_screen.dart';
import 'vet_care_screen.dart';
import 'diseases_screen.dart';
import 'physical_health_screen.dart';
import 'mental_health_screen.dart';

class SoinsHomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> sections = [
    {
      "title": "Nutrition & Alimentation",
      "screen": NutritionScreen(),
      "image": "assets/images/nutrition.png"
    },
    {
      "title": "Hygiène & Toilettage",
      "screen": HygieneScreen(),
      "image": "assets/images/hygiene.png"
    },
    {
      "title": "Soins Vétérinaires & Premiers Secours",
      "screen": VetCareScreen(),
      "image": "assets/images/vet_care.png"
    },
    {
      "title": "Maladies & Prévention",
      "screen": DiseasesScreen(),
      "image": "assets/images/diseases.png"
    },
    {
      "title": "Activité Physique & Bien-être",
      "screen": PhysicalHealthScreen(),
      "image": "assets/images/physical_health.png"
    },
    {
      "title": "Santé Mentale & Épanouissement",
      "screen": MentalHealthScreen(),
      "image": "assets/images/mental_health.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Soins & Santé"),
        elevation: 5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey[50]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.85,
            ),
            itemCount: sections.length,
            itemBuilder: (context, index) {
              final section = sections[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => section['screen']),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          section['image'],
                          fit: BoxFit.cover,
                        ).animate().fade(duration: 500.ms),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 15,
                        right: 15,
                        child: Text(
                          section['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black45,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ).animate().fade(duration: 600.ms).slideY(begin: 0.3),
                      ),
                    ],
                  ),
                ).animate().scaleXY(begin: 0.95, end: 1, duration: 400.ms, curve: Curves.easeOut),              );

            },
          ),
        ),
      ),
    );
  }
}