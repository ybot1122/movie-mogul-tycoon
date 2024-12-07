import 'package:flutter/material.dart';
import 'package:movie_mogul_tycoon/constants/game_colors.dart';
import 'package:movie_mogul_tycoon/model/movie_proposal.dart';

class MovieProposalModal extends StatelessWidget {
  const MovieProposalModal(
      {super.key,
      required this.movieProposal,
      required this.finishMovieProposal});

  final MovieProposal movieProposal;
  final dynamic Function(
      {required bool isGreenlit,
      required MovieProposal movieProposal}) finishMovieProposal;

  @override
  Widget build(BuildContext context) {
    var title = movieProposal.title;
    var budget = movieProposal.budget;
    var releaseDate = movieProposal.releaseDate;

    return SizedBox(
      height: 200,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'MOVIE PROPOSAL for $title',
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Budget is \$$budget',
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Release Date is $releaseDate',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Spacer(),
                  OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: GAME_COLORS_GREEN,
                      side: const BorderSide(width: 2),
                    ),
                    icon: const Icon(Icons.check),
                    label: const Text(
                      'GREENLIT!',
                      style: TextStyle(
                        color: GAME_COLORS_GREEN,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: GAME_COLORS_RED,
                      side: const BorderSide(width: 2),
                    ),
                    icon: const Icon(Icons.check),
                    label: const Text(
                      'Reject',
                      style: TextStyle(
                        color: GAME_COLORS_RED,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
