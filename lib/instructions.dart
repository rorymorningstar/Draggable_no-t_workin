import 'package:flutter/material.dart';
import 'main.dart';
import 'chooseColor.dart';


class Instructions extends StatelessWidget {
  const Instructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructions'),
        backgroundColor: LernApp.GreenColor,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChooseColor()),
            );
          },
          child: const Text('Color'),
        ),
      ),
    );
  }
}