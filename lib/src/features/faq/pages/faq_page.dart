import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fomet_app/src/features/faq/widgets/question_answer.dart';
import 'package:fomet_app/src/localization/localization.dart';
import 'package:fomet_app/src/utils/widgets/logo_separator.dart';

/// This page contains a series of questions and answers separated by a colored
/// divider line.
class FaqPage extends StatefulWidget {
  /// Creates a [FaqPage] widget.
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  late final questionsAndAnswers = [
    (question: context.l10n.question1, answer: context.l10n.answer1),
    (question: context.l10n.question2, answer: context.l10n.answer2),
    (question: context.l10n.question3, answer: context.l10n.answer3),
    (question: context.l10n.question4, answer: context.l10n.answer4),
    (question: context.l10n.question5, answer: context.l10n.answer5),
    (question: context.l10n.question6, answer: context.l10n.answer6),
    (question: context.l10n.question7, answer: context.l10n.answer7),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: questionsAndAnswers.length,
      itemBuilder: (_, index) {
        final item = questionsAndAnswers[index];

        return QuestionAnswer(
          question: item.question,
          answer: item.answer,
          topElement: index == 0,
          bottomElement: index == questionsAndAnswers.length - 1,
        );
      },
      separatorBuilder: (_, __) => const LogoSeparator(),
    );
  }
}
