import 'package:clean_framework_task/features/lyrics_search/ui/lyrics_search_result/lyrics_search_result_widget.dart';
import 'package:flutter/material.dart';

import 'features/lyrics_search/ui/lyrics_search/lyrics_search_widget.dart';

abstract class LyricsFinderRouter {
  static const String initialRoute = '/';
  static const String lyricsSearchResult = '/lyricsSearchResult';


  static Widget generate(String name) {
    switch (name) {
      case initialRoute:
        return LyricsSearchWidget();

      case lyricsSearchResult:
        return LyricsSearchResultWidget();

      default:
        return const PageNotFound();
    }
  }
}

class PageNotFound extends StatelessWidget {
  const PageNotFound();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('404, Page Not Found!')));
  }
}
