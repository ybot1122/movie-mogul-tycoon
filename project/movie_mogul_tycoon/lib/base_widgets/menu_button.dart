import 'package:flutter/material.dart';
import 'package:movie_mogul_tycoon/constants/game_colors.dart';

/// The Button Used for Game Menu Interfaces
/// (i.e. start screen, pause screen, settings screen)

class MenuButton extends StatelessWidget {
  const MenuButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.icon});

  final void Function() onPressed;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: GAME_COLORS_BLACK,
      ),
      icon: Icon(icon),
      label: Text(text),
    );
  }
}
