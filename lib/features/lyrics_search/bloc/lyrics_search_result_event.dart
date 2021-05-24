import 'package:equatable/equatable.dart';

abstract class LyricsSearchResultEvent extends Equatable {}


class InitEvent extends LyricsSearchResultEvent {
  InitEvent();
  @override
  List<Object?> get props => [];
  @override
  bool get stringify => true;
}