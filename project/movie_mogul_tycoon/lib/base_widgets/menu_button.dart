import 'package:flutter/material.dart';

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
        foregroundColor: Colors.black,
      ),
      icon: Icon(icon),
      label: Text(text),
    );
  }
}
