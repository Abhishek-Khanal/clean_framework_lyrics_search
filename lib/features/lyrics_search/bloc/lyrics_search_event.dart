import 'package:equatable/equatable.dart';

abstract class LyricsSearchEvent extends Equatable {}

class OnSearchEvent extends LyricsSearchEvent{
  OnSearchEvent();
  @override
  List<Object?> get props => [];
  @override
  bool get stringify => true;
}