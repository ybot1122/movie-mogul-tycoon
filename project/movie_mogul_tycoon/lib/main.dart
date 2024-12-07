import 'package:flutter/material.dart';
import 'package:movie_mogul_tycoon/game_screen.dart';
import 'package:movie_mogul_tycoon/start_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: _ScreenManager()),
    );
  }
}

class _ScreenManager extends StatefulWidget {
  const _ScreenManager();

  @override
  State<_ScreenManager> createState() {
    return _ScreenManagerState();
  }
}

class _ScreenManagerState extends State<_ScreenManager> {
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen =
          activeScreen == 'start-screen' ? 'game-screen' : 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : GameScreen(exitGame: switchScreen);

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 176, 230, 245),
                Color.fromARGB(255, 184, 150, 242)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: screenWidget,
            ))),
      ),
    );
  }
}
