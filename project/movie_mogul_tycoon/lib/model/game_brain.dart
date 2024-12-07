import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_mogul_tycoon/constants/one_second.dart';
import 'package:movie_mogul_tycoon/data/months.dart';
import 'package:movie_mogul_tycoon/data/movie_proposals.dart';
import 'package:movie_mogul_tycoon/model/movie_proposal.dart';

class GameBrain {
  final startDate = DateTime.utc(1989, DateTime.december, 25);
  var currentDate = DateTime.utc(1989, DateTime.december, 25);

  late final void Function() startMovieProposal;

  Timer? gameClock;
  int currentTick = 0;
  int currentMoney = 5000000;
  bool gameClockPaused = false;

  // Call once at start of game
  start(
      {required void Function() gameClockUpdated,
      required void Function() startMovieProposal}) {
    gameClock = Timer.periodic(oneSecond, (timer) {
      if (gameClockPaused) return;

      currentTick += 1;
      currentDate = currentDate.add(const Duration(days: 1));

      gameClockUpdated();

      // Check if Movie is being proposed on this day
      Iterable<MovieProposal> mps = movieProposals
          .where((m) => DateUtils.isSameDay(m.proposalDate, currentDate));

      if (mps.isNotEmpty) {
        // make movie proposal
        MovieProposal mp = mps.first;
        String title = mp.title;
        print('Proposing movie: $title');
      }
    });
  }

  // Call once to end the game
  end() {
    gameClock?.cancel();
  }

  getCurrentDay() {
    var day = currentDate.day;
    var month = months[currentDate.month - 1];
    var year = currentDate.year;

    return "$month $day, $year";
  }

  getCurrentMoney() {
    return "\$$currentMoney";
  }
}
