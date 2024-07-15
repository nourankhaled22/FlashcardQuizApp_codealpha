import 'package:flashcard/flashcard.dart';
import 'package:flutter/material.dart';
import 'flashcard_model.dart';
import 'glassmorphism_container.dart';

class ReviewFlashcardScreen extends StatelessWidget {
  final List<Flashcard> flashcards;

  ReviewFlashcardScreen({required this.flashcards});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Flashcards'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: flashcards.length,
        itemBuilder: (context, index) {
          return GlassmorphismContainer(
            child: ListTile(
              title: Text(flashcards[index].question, style: TextStyle(color: Colors.white)),
              subtitle: Text('Answer: ${flashcards[index].options[flashcards[index].correctOptionIndex]}', style: TextStyle(color: Colors.green)),
            ),
          );
        },
      ),
    );
  }
}
