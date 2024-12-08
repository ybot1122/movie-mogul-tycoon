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
    var budget = movieProposal.getBudgetAmount();
    var releaseDate = movieProposal.getReleaseDate();

    return SizedBox(
      height: 350,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(children: [
                Spacer(),
                Text('MOVIE PROPOSAL',
                    style: TextStyle(
                      fontSize: 18,
                    )),
                Spacer(),
              ]),
              const SizedBox(height: 20),
              Row(children: [
                const Spacer(),
                Text(title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                const Spacer(),
              ]),
              const SizedBox(height: 20),
              _InfoRow(text: budget, label: "Budget"),
              const SizedBox(height: 5),
              _InfoRow(text: releaseDate, label: "Release Date"),
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

class _InfoRow extends StatelessWidget {
  const _InfoRow({super.key, required this.text, required this.label});

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
      child: Row(children: [
        Text("$label:"),
        const SizedBox(width: 5),
        Text(text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            )),
      ]),
    );
  }
}
