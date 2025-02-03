import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'basic_training_screen.dart';
import 'behavior_problems_screen.dart';
import 'advanced_training_screen.dart';
import 'puppy_education_screen.dart';
import 'training_tips_screen.dart';

class EducationHomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> sections = [
    {
      "title": "Bases du dressage",
      "screen": BasicTrainingScreen(),
      "image": "assets/images/education/basic_training.png"
    },
    {
      "title": "Comportements problématiques",
      "screen": BehaviorProblemsScreen(),
      "image": "assets/images/education/behavior_problems.png"
    },
    {
      "title": "Dressage avancé",
      "screen": AdvancedTrainingScreen(),
      "image": "assets/images/education/advanced_training.png"
    },
    {
      "title": "Éducation des chiots",
      "screen": PuppyEducationScreen(),
      "image": "assets/images/education/puppy_education.png"
    },
    {
      "title": "Conseils et erreurs à éviter",
      "screen": TrainingTipsScreen(),
      "image": "assets/images/education/training_tips.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Éducation Canine"),
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
              childAspectRatio: 0.8,
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
                            fontSize: 17,
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