import 'package:flutter/material.dart';
import 'splash.dart';

void main() {
  runApp(FlashcardApp());
}

class FlashcardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashcard Quiz',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Flashcard {
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  Flashcard({required this.question, required this.options, required this.correctOptionIndex});
}
