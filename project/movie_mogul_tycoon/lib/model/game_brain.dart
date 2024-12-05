import 'dart:async';

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
  final startDate = DateTime.utc(1989, DateTime.november, 9);
  int currentTick = 0;

  // Only call this method once at start of the game
  start(updateCb) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      currentTick += 1;
      updateCb();
    });
  }

  getCurrentDay() {
    var currentDate = startDate.add(Duration(days: currentTick));
    var day = currentDate.day;
    var month = months[currentDate.month];
    var year = currentDate.year;

    return "$month $day, $year";
  }
}
