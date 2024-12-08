import 'package:flutter/material.dart';
import 'package:movie_mogul_tycoon/base_widgets/menu_button.dart';
import 'package:movie_mogul_tycoon/base_widgets/movie_proposal_modal.dart';
import 'package:movie_mogul_tycoon/model/game_brain.dart';
import 'package:movie_mogul_tycoon/model/movie_proposal.dart';

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

  gameClockUpdated() {
    setState(() {
      currentDay = gb.getCurrentDay();
    });
  }

  startMovieProposal(
      {required MovieProposal movieProposal,
      required dynamic Function(
              {required bool isGreenlit, required MovieProposal movieProposal})
          finishMovieProposal}) {
    showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      builder: (BuildContext context) {
        return MovieProposalModal(
            movieProposal: movieProposal,
            finishMovieProposal: finishMovieProposal);
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
              _InfoText(text: currentDay),
              _InfoText(text: currentMoney),
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

class _InfoText extends StatelessWidget {
  const _InfoText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 28),
    );
  }
}
