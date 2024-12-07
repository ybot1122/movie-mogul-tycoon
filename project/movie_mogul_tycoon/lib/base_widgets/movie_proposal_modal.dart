import 'package:flutter/material.dart';
import 'package:movie_mogul_tycoon/model/movie_proposal.dart';

class MovieProposalModal extends StatelessWidget {
  const MovieProposalModal({super.key, required this.movieProposal});

  final MovieProposal movieProposal;

  @override
  Widget build(BuildContext context) {
    var title = movieProposal.title;

    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('MOVIE PROPOSAL for $title'),
          ],
        ),
      ),
    );
  }
}
