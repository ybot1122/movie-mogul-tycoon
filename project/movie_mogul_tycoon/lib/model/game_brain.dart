import 'dart:async';

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

class GameBrain {
  final startDate = DateTime.utc(1989, DateTime.december, 25);

  Timer? gameClock;
  int currentTick = 0;

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
}
