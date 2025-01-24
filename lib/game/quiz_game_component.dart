import 'package:flame/components.dart';

class QuizGameComponent extends PositionComponent {
  @override
  Future<void> onLoad() async {
    size = Vector2(300, 300);
    position = Vector2(50, 50);
  }

  void playSuccessAnimation() {
    // TODO: Ajouter une animation quand la réponse est correcte
  }

  void playFailureAnimation() {
    // TODO: Ajouter une animation quand la réponse est incorrecte
  }
}