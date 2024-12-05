import 'package:flutter/material.dart';
import 'package:movie_mogul_tycoon/model/game_brain.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

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
            children: [Text(currentDay)],
          )
        ],
      ),
    );
  }
}
