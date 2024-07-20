import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final userAnswer = data['user_answer'] as String;
            final correctAnswer = data['correct_answer'] as String;
            final isAnswerCorrect = userAnswer == correctAnswer;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ((data['question_index'] as int) + 1).toString(),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      data['question'] as String,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  userAnswer,
                  style: TextStyle(
                    color: isAnswerCorrect ? Colors.green : Colors.red,
                  ),
                ),
                Text(
                  correctAnswer,
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
