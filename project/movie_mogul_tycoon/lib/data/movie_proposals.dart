import 'package:movie_mogul_tycoon/model/movie_proposal.dart';

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
    title: "When The Angels Sing",
    releaseDate: DateTime(1990, DateTime.march, 1),
    proposalDate: DateTime(1990, DateTime.january, 30),
  ),
];
