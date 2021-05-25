

import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_bloc.dart';
import 'package:clean_framework_task/features/lyrics_search/ui/lyrics_search/lyrics_search_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  MaterialApp? testWidget;
  setUp(() {
    testWidget = MaterialApp(
      home: BlocProvider<LyricsSearchBloc>(
        create: (_) => LyricsSearchBloc(),
        child: LyricsSearchPresenter(),
      ),
    );
  });


    testWidgets('should show the presenter', (tester) async {
      await tester.pumpWidget(testWidget!);
      await tester.pumpAndSettle();
      final widgetType = find.byType(LyricsSearchPresenter);
      expect(widgetType, findsOneWidget);
    });

}