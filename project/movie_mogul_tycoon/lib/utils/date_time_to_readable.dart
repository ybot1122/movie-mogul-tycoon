import 'package:movie_mogul_tycoon/data/months.dart';

dateTimeToReadable(DateTime dt) {
  var day = dt.day;
  var month = months[dt.month - 1];
  var year = dt.year;

  return "$month $day, $year";
}
