import 'package:flutter/material.dart';
import 'add_flashcard_screen.dart';
import 'flashcard.dart';
import 'quiz.dart';
import 'review.dart';
import 'flashcard_model.dart';
import 'glassmorphism_container.dart';

class FlashcardScreen extends StatefulWidget {
  @override
  _FlashcardScreenState createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  List<Flashcard> flashcards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcards'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Column(
        children: [
          Expanded(child: buildFlashcardList()),
          buildFooterButtons(context),
        ],
      ),
    );
  }

  Widget buildFlashcardList() {
    return ListView.builder(
      itemCount: flashcards.length,
      itemBuilder: (context, index) {
        return GlassmorphismContainer(
          child: ListTile(
            title: Text(
              flashcards[index].question,
              style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 20),
            ),
          ),
        );
      },
    );
  }

  Widget buildFooterButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildButton('Add', () => navigateToAddFlashcard(context)),
          buildButton('Quiz', () => navigateToQuiz(context)),
          buildButton('Review', () => navigateToReview(context)),
        ],
      ),
    );
  }

  Widget buildButton(String label, VoidCallback onPressed) {
    return GlassmorphismContainer(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label, style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        ),
      ),
    );
  }

  void navigateToAddFlashcard(BuildContext context) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddFlashcardScreen()));
    if (result != null && result is Flashcard) {
      setState(() {
        flashcards.add(result);
      });
    }
  }

  void navigateToQuiz(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen(flashcards: flashcards)));
  }

  void navigateToReview(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewFlashcardScreen(flashcards: flashcards)));
  }
}
