import 'package:flutter/material.dart';
import 'startpage.dart';
import 'instructions.dart';
import 'chooseColor.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Wiegons APPfalleimer', // Titel der App
    home: Startpage(), // Die Startseite beim Starten der App
  ));
}

// Klasse, die die komplette App repräsentiert
class LernApp extends StatelessWidget {
  const LernApp({super.key});
  static const GreenColor = Color(0xFF4EBF44);

  // Diese Methode gibt das Grundgerüst der App zurück.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wiegons APPfalleimer',
      initialRoute: '/',
      routes:{
        '/':(context)=>const Startpage(),
        '/chooseColor':(context)=>const ChooseColor(),
        '/instructions':(context)=>const Instructions()
      }
    );
  }
}

