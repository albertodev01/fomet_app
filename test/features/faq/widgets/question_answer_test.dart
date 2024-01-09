import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fomet_app/src/features/faq/widgets/question_answer.dart';

import '../../../mock_wrapper.dart';

void main() {
  group('QuestionAnswer', () {
    group('Widget tests', () {
      testWidgets('Smoke test', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: QuestionAnswer(
              question: 'question',
              answer: 'answer',
            ),
          ),
        );

        expect(find.byType(QuestionAnswer), findsOneWidget);
        expect(find.byType(Text), findsNWidgets(2));
      });
    });

    group('Golden tests', () {
      testWidgets('QuestionAnswer', (tester) async {
        await tester.pumpWidget(
          const MockWrapper(
            child: Column(
              children: [
                QuestionAnswer(
                  question: 'question',
                  answer: 'answer',
                ),
                QuestionAnswer(
                  question: 'question',
                  answer: 'bottom element',
                  bottomElement: true,
                ),
                QuestionAnswer(
                  question: 'question',
                  answer: 'top element',
                  topElement: true,
                ),
                QuestionAnswer(
                  question: 'question',
                  answer: 'top and bottom element',
                  topElement: true,
                  bottomElement: true,
                ),
              ],
            ),
          ),
        );

        await expectLater(
          find.byType(MockWrapper),
          matchesGoldenFile('goldens/question_answer.png'),
        );
      });
    });
  });
}
