import 'package:flutter/material.dart';
import 'package:movie_mogul_tycoon/model/game_brain.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.exitGame});

  final void Function() exitGame;

  @override
  State<GameScreen> createState() {
    return _GameScreenState();
  }
}

class _GameScreenState extends State<GameScreen> {
  var gb = GameBrain();

  late String currentDay;

  timerUpdate() {
    setState(() {
      currentDay = gb.getCurrentDay();
    });
  }

  exitGame() {
    gb.end();
    widget.exitGame();
  }

  @override
  void initState() {
    super.initState();
    currentDay = gb.getCurrentDay();
    gb.start(timerUpdate);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(currentDay),
            ],
          ),
          Row(children: [
            OutlinedButton.icon(
              onPressed: exitGame,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_left),
              label: const Text("Exit Game"),
            )
          ])
        ],
      ),
    );
  }
}
