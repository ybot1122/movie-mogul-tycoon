import 'package:flutter/material.dart';
import 'package:movie_mogul_tycoon/base_widgets/menu_button.dart';
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
  late String currentMoney;

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
    currentMoney = gb.getCurrentMoney();
    gb.start(timerUpdate);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(currentDay),
              Text(currentMoney),
            ],
          ),
          const Spacer(),
          Row(mainAxisSize: MainAxisSize.max, children: [
            const Spacer(),
            MenuButton(
              text: "Exit Game",
              icon: Icons.arrow_left,
              onPressed: exitGame,
            ),
            const Spacer(),
          ]),
        ],
      ),
    );
  }
}
