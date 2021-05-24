import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_result_viewmodel.dart';
import 'package:flutter/material.dart';

class LyricsSearchResultScreen extends Screen {
  final LyricsSearchResultViewModel? viewModel;
  LyricsSearchResultScreen({
    this.viewModel,
  });
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: media.width * .1),
            Container(
              color: Colors.white.withOpacity(.8),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 12, 10, 0),
                child: Text(
                  "Artist: ${viewModel?.artist ?? ""}",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      color: Colors.lightGreen),
                  key: Key('titleText'),
                ),
              ),
            ),
            Container(
              color: Colors.white.withOpacity(.8),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                child: Text("Title: ${viewModel?.title ?? ""}",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                    key: Key('artistText')),
              ),
            ),
            SizedBox(height: media.width * .03),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Lyrics:",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                key: Key('artistText'),
              ),
            ),
            SizedBox(height: media.width * .01),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  Text(
                    viewModel?.lyrics ?? "",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    key: Key('lyricsText'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
