import 'package:flutter/material.dart';
import 'package:lernapp/game.dart';
import 'main.dart';

class ChooseColor extends StatelessWidget{
  const ChooseColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color'),
        backgroundColor: LernApp.GreenColor,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Game()),
            );
          },
          child: const Text('Game'),
        ),
      ),
    );
  }
}