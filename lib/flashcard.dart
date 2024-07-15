class Flashcard {
  final String question;
  final List<String> options; // Renamed from 'choices'
  final int correctOptionIndex; // Renamed from 'correctAnswerIndex'

  Flashcard({required this.question, required this.options, required this.correctOptionIndex});
}
