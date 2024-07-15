import 'package:flutter/material.dart';
import 'flashcard.dart';
import 'flashcard_model.dart';
import 'glassmorphism_container.dart';

class QuizScreen extends StatefulWidget {
  final List<Flashcard> flashcards;

  QuizScreen({required this.flashcards});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentFlashcardIndex = 0;
  int correctAnswerCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget.flashcards.isEmpty
            ? Center(
          child: Text(
            'No flashcards available. Please add some flashcards first.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.indigo),
          ),
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GlassmorphismContainer(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Question ${currentFlashcardIndex + 1} / ${widget.flashcards.length}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            GlassmorphismContainer(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.flashcards[currentFlashcardIndex].question,
                  style: TextStyle(fontSize: 25.0, color: Colors.indigo, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            ...buildOptionButtons(),
          ],
        ),
      ),
    );
  }

  List<Widget> buildOptionButtons() {
    List<Widget> optionButtons = [];
    List<String> options = widget.flashcards[currentFlashcardIndex].options;
    for (int i = 0; i < options.length; i++) {
      optionButtons.add(
        GlassmorphismContainer(
          child: ElevatedButton(
            onPressed: () {
              checkAnswer(i);
            },
            child: Text(options[i], style: TextStyle(color: Colors.indigo, fontSize: 25.0, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            ),
          ),
        ),
      );
      optionButtons.add(SizedBox(height: 16.0));
    }
    return optionButtons;
  }

  void checkAnswer(int selectedOptionIndex) {
    if (selectedOptionIndex == widget.flashcards[currentFlashcardIndex].correctOptionIndex) {
      setState(() {
        correctAnswerCount++;
      });
    }
    if (currentFlashcardIndex < widget.flashcards.length - 1) {
      setState(() {
        currentFlashcardIndex++;
      });
    } else {
      showResultDialog(context);
    }
  }

  void showResultDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quiz Result'),
        content: Text('You scored $correctAnswerCount out of ${widget.flashcards.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
