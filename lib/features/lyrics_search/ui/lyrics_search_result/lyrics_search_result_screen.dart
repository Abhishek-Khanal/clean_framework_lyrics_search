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
    return Container(color: Colors.red,);
  }

}
