import 'package:flutter/material.dart';
import 'game_screen.dart';
import 'package:async/async.dart';

void main() {
  runApp(PurrdleApp());
}

/// A reusable custom text widget for the Purrdle app.
/// 261
/// This widget ensures consistent styling across the app by applying
/// Courier font family, Bold pink text, Centered alignment,
/// A configurable font size (default: 24.0).
///
/// This will give the app a constant feel.
class PurrdleText extends StatelessWidget {
  final String text;
  final double size;

  PurrdleText(this.text, {super.key, this.size = 24.0});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Courier',
        color: Colors.pink,
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }
}

// entry point that configures app-wide settings and decides the initial screen, 261.
class PurrdleApp extends StatelessWidget {
  PurrdleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomeScreen(),
    );
  }
}

// The landing screen showing the title, game blurb, and a button to start the game, 261.
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              'Purrdle',
              style: TextStyle(
                fontFamily: 'Courier',
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                fontSize: 48.0,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/title.png',
              width: 200,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: PurrdleText(
                'Guess the hidden five-letter word in just six Meows (tries)! After each guess, tiles will light up, green means the letter is IN the right spot, yellow means the letter IS in the word but in the wrong spot, and grey means the letter IS not in the word at all.',
                size: 14.0,
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text(
                'Play Game',
                style: TextStyle(
                  fontFamily: 'Courier',
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameScreen()),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
