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

  void Function()? movieProposalComplete;

  gameClockUpdated() {
    setState(() {
      currentDay = gb.getCurrentDay();
    });
  }

  startMovieProposal() {
    setState(() {
      movieProposalComplete = () {
        print("movie proposal done");
      };
    });

    showModalBottomSheet<void>(
      // context and builder are
      // required properties in this widget
      context: context,
      builder: (BuildContext context) {
        // we set up a container inside which
        // we create center column and display text

        // Returning SizedBox instead of a Container
        return const SizedBox(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text('GeeksforGeeks'),
              ],
            ),
          ),
        );
      },
    );
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
    gb.start(
        gameClockUpdated: gameClockUpdated,
        startMovieProposal: startMovieProposal);
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
