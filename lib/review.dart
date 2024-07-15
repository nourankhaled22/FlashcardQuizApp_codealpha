import 'package:flutter/material.dart';
import 'package:flashcard/flashcard.dart';
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
        backgroundColor: Colors.deepPurpleAccent, // Unique background color
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: flashcards.length,
        itemBuilder: (context, index) {
          return GlassmorphismContainer( // Unique styling with GlassmorphismContainer
            child: ListTile(
              title: Text(
                flashcards[index].question,
                style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold), // Adjusted text style
              ),
              subtitle: Text(
                'Correct Answer: ${flashcards[index].options[flashcards[index].correctOptionIndex]}', // Improved subtitle
                style: TextStyle(color: Colors.lightGreenAccent),
              ),
              trailing: Icon(Icons.check_circle, color: Colors.lightGreenAccent), // Unique trailing icon
              onTap: () => showAnswerDialog(context, flashcards[index]), // Added onTap functionality
            ),
          );
        },
      ),
    );
  }

  void showAnswerDialog(BuildContext context, Flashcard flashcard) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Answer'),
        content: Text(flashcard.options[flashcard.correctOptionIndex]),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}
