import 'package:flutter/material.dart';
import 'package:fomet_ui/fomet_ui.dart';

class QuestionAnswer extends StatelessWidget {
  final String question;
  final String answer;
  final bool topElement;
  final bool bottomElement;
  const QuestionAnswer({
    required this.question,
    required this.answer,
    this.topElement = false,
    this.bottomElement = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topElement ? 16 : 0,
        bottom: bottomElement ? 16 : 0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: FometTypography.bold.copyWith(
              fontSize: 18,
              color: FometColors.secondaryText,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            answer,
            style: FometTypography.regular.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
