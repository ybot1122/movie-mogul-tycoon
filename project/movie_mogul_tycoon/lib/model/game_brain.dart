import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_mogul_tycoon/model/movie_proposal.dart';

const oneSecond = Duration(seconds: 1);
const months = <String>[
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];
final movieProposals = <MovieProposal>[
  MovieProposal(
    budget: 250000,
    title: "Mario World Wonder",
    boxOfficeReturn: 300000,
    releaseDate: DateTime(1990, DateTime.january, 1),
    proposalDate: DateTime(1989, DateTime.december, 30),
  ),
  MovieProposal(
    budget: 350000,
    boxOfficeReturn: 20000,
    title: "Big Time Boom Boom",
    releaseDate: DateTime(1990, DateTime.february, 1),
    proposalDate: DateTime(1990, DateTime.january, 2),
  ),
  MovieProposal(
    budget: 500000,
    boxOfficeReturn: 1000000,
    title: "This Is",
    releaseDate: DateTime(1990, DateTime.march, 1),
    proposalDate: DateTime(1990, DateTime.january, 30),
  ),
];

class GameBrain {
  final startDate = DateTime.utc(1989, DateTime.december, 25);
  var currentDate = DateTime.utc(1989, DateTime.december, 25);

  Timer? gameClock;
  int currentTick = 0;
  int currentMoney = 5000000;
  bool gameClockPaused = false;

  // Call once at start of game
  start(updateCb) {
    gameClock = Timer.periodic(oneSecond, (timer) {
      if (gameClockPaused) return;

      currentTick += 1;
      currentDate = currentDate.add(const Duration(days: 1));

      updateCb();

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
