import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('should props match and stringify be true on OnSearchEvent', () {
    final event = OnSearchEvent();
    expect(event.props, []);
    expect(event.stringify, true);
  });
}