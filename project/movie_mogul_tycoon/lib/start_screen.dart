import 'package:flutter/material.dart';

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
          OutlinedButton.icon(
            onPressed: () {
              startGame();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Start Game!"),
          )
        ],
      ),
    );
  }
}
