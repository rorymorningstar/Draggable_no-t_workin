import 'package:flutter/material.dart';
import 'main.dart';
import 'instructions.dart';

class Startpage extends StatelessWidget {
  const Startpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startpage'),
        backgroundColor: LernApp.GreenColor,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Instructions'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Instructions()),
            );
          },
        ),
      ),
    );
  }
}
