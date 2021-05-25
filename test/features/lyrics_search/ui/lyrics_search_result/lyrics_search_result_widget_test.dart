import 'package:clean_framework_task/features/lyrics_search/ui/lyrics_search_result/lyrics_search_result_presenter.dart';
import 'package:clean_framework_task/features/lyrics_search/ui/lyrics_search_result/lyrics_search_result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('WIDGET TEST: Lyrics Search Result Widget loaded successfully!',
          (tester) async {
        final testWidget = MaterialApp(
          home: Scaffold(
            body: LyricsSearchResultWidget(),
          ),
        );

        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        expect(find.byType(LyricsSearchResultPresenter), findsOneWidget);
      });
}