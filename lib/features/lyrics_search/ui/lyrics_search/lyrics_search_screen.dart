import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_viewmodel.dart';
import 'package:clean_framework_task/features/lyrics_search/ui/lyrics_search/lyrics_search_actions.dart';
import 'package:flutter/material.dart';

class LyricsSearchScreen extends Screen {
  final LyricsSearchViewModel? viewModel;
  final LyricsSearchActions actions;

  LyricsSearchScreen({
    required this.viewModel,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: Form(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: media.width * .1),
            Container(
              color: Colors.white.withOpacity(.8),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 12, 10, 0),
                child: Text(
                  'Search Lyrics',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      color: Colors.lightGreen),
                  key: Key('searchLyricsText'),
                ),
              ),
            ),
            Container(
              color: Colors.white.withOpacity(.8),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                child: Text(
                  'Simple api to retrieve the lyrics of the song',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(height: media.width * .03),
            Text(
              'Note:Got null passing from request model as param. Used static value.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[400],
              ),
            ),
            _textFormField(Key('artist_key'), 'Artist', actions.onChangeArtist,
                TextInputType.emailAddress, Icons.person_outline),
            SizedBox(height: media.width * .01),
            _textFormField(Key('title_key'), 'Title', actions.onChangeTitle,
                TextInputType.visiblePassword, Icons.music_note_outlined),
            SizedBox(height: media.width * .02),
            ElevatedButton(
              key: Key('search_button_key'),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightGreen,
              ),
              onPressed: actions.onTapSearch,
              child: Text('Search', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFormField(Key key, String hintText, Function? onChangeTextField,
      TextInputType textInputType, IconData iconData) {
    return TextFormField(
      key: key,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(iconData),
        filled: true,
        hintText: hintText,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreen, width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2.0)),
      ),
      onChanged: (value) {
        onChangeTextField!(value);
      },
    );
  }
}
