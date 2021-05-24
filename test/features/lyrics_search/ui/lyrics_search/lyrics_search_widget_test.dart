import 'package:clean_framework_task/features/lyrics_search/ui/lyrics_search/lyrics_search_presenter.dart';
import 'package:clean_framework_task/features/lyrics_search/ui/lyrics_search/lyrics_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('WIDGET TEST: Lyrics Search Widget loaded successfully!',
      (tester) async {
    final testWidget = MaterialApp(
      home: Scaffold(
        body: LyricsSearchWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);

    expect(find.byType(LyricsSearchPresenter), findsOneWidget);
  });
}
