import 'dart:async';

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
    releaseDate: DateTime(1990, DateTime.january, 1),
  ),
  MovieProposal(
    budget: 350000,
    title: "Big Time Boom Boom",
    releaseDate: DateTime(1990, DateTime.february, 1),
  ),
  MovieProposal(
    budget: 500000,
    title: "This Is",
    releaseDate: DateTime(1990, DateTime.march, 1),
  ),
];

class GameBrain {
  final startDate = DateTime.utc(1989, DateTime.december, 25);

  Timer? gameClock;
  int currentTick = 0;
  int currentMoney = 5000000;

  // Call once at start of game
  start(updateCb) {
    gameClock = Timer.periodic(oneSecond, (timer) {
      currentTick += 1;
      updateCb();
    });
  }

  // Call once to end the game
  end() {
    gameClock?.cancel();
  }

  getCurrentDay() {
    var currentDate = startDate.add(Duration(days: currentTick));
    var day = currentDate.day;
    var month = months[currentDate.month - 1];
    var year = currentDate.year;

    return "$month $day, $year";
  }

  getCurrentMoney() {
    return "\$$currentMoney";
  }
}
