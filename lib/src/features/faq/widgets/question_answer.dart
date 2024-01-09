import 'package:flutter/material.dart';
import 'package:fomet_app/src/features/faq/pages/faq_page.dart';
import 'package:fomet_ui/fomet_ui.dart';

/// Used by the [FaqPage] widget to show questions and answers.
class QuestionAnswer extends StatelessWidget {
  /// The question at the top.
  final String question;

  /// The answer below [question].
  final String answer;

  /// Whether this widget is at the top of the list or not.
  ///
  /// By default, this is set to `false`.
  final bool topElement;

  /// Whether this widget is at the bottom of the list or not.
  ///
  /// By default, this is set to `false`.
  final bool bottomElement;

  /// Creates a [QuestionAnswer] widget.
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
