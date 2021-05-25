import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_bloc.dart';
import 'package:clean_framework_task/features/lyrics_search/ui/lyrics_search_result/lyrics_search_result_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// void main() {
//   late MaterialApp testWidget;
//   setUp(() {
//     testWidget = MaterialApp(
//       home: BlocProvider<LyricsSearchBloc>(
//         create: (_) => LyricsSearchBloc(),
//         child: LyricsSearchResultPresenter(),
//       ),
//     );
//   });
//
//
//     testWidgets('should show the presenter', (tester) async {
//       await tester.pumpWidget(testWidget);
//       await tester.pump(Duration(milliseconds: 500));
//       final widgetType = find.byType(LyricsSearchResultPresenter);
//       expect(widgetType, findsOneWidget);
//     });
//
// }