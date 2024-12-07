import 'package:flutter/material.dart';
import 'package:movie_mogul_tycoon/base_widgets/menu_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startGame, {super.key});

  final void Function() startGame;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Movie Mogul Tycoon!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          MenuButton(
            onPressed: startGame,
            text: "Start Game!",
            icon: Icons.arrow_right_alt,
          ),
        ],
      ),
    );
  }
}
