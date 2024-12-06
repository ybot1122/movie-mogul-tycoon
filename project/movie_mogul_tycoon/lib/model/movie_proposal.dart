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
}
