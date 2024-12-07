import 'package:movie_mogul_tycoon/utils/date_time_to_readable.dart';
import 'package:movie_mogul_tycoon/utils/int_to_readable_currency.dart';

class MovieProposal {
  int budget;
  int boxOfficeReturn;
  String title;
  DateTime releaseDate;
  DateTime proposalDate;

  MovieProposal(
      {required this.budget,
      required this.title,
      required this.boxOfficeReturn,
      required this.releaseDate,
      required this.proposalDate});

  getReleaseDate() {
    return dateTimeToReadable(releaseDate);
  }

  getBudgetAmount() {
    return intToReadableCurrency(budget);
  }
}
