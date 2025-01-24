import 'package:flame/game.dart';
import 'quiz_game_component.dart';

class QuizGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    add(QuizGameComponent());
  }
}