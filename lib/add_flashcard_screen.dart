import 'package:flutter/material.dart';
import 'flashcard.dart';
import 'flashcard_model.dart';
import 'glassmorphism_container.dart';

class AddFlashcardScreen extends StatelessWidget {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController optionsController = TextEditingController();
  final TextEditingController correctOptionIndexController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Flashcard'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField(controller: questionController, label: 'Question'),
            SizedBox(height: 20.0),
            buildTextField(controller: optionsController, label: 'Options (comma separated)'),
            SizedBox(height: 20.0),
            buildTextField(controller: correctOptionIndexController, label: 'Correct Option Index'),
            SizedBox(height: 20.0),
            buildSaveButton(context),
            SizedBox(height: 20.0), // Optional SizedBox for additional spacing
          ],
        ),
      ),
    );
  }

  Widget buildTextField({required TextEditingController controller, required String label}) {
    return GlassmorphismContainer(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
          labelStyle: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget buildSaveButton(BuildContext context) {
    return GlassmorphismContainer(
      child: ElevatedButton(
        onPressed: () => saveFlashcard(context),
        child: Text('Save', style: TextStyle(color: Colors.white, fontSize: 18.0,fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        ),
      ),
    );
  }

  void saveFlashcard(BuildContext context) {
    final question = questionController.text;
    final options = optionsController.text.split(',').map((c) => c.trim()).toList();
    final correctOptionIndex = int.tryParse(correctOptionIndexController.text) ?? 0;

    if (question.isNotEmpty && options.isNotEmpty && correctOptionIndex >= 0 && correctOptionIndex < options.length) {
      Navigator.pop(context, Flashcard(question: question, options: options, correctOptionIndex: correctOptionIndex));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text('Please ensure all fields are filled out correctly.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
