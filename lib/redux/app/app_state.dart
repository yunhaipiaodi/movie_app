import 'package:meta/meta.dart';
import 'package:movie_app/model/actor.dart';
import 'package:movie_app/redux/event/event_state.dart';
import 'package:movie_app/redux/show/show_state.dart';
import 'package:movie_app/redux/theater/theater_state.dart';

class AppState {
  AppState({
    @required this.searchQuery,
    @required this.actorsByName,
    @required this.theaterState,
    @required this.showState,
    @required this.eventState,
  });

  final String searchQuery;
  final Map<String,Actor> actorsByName;
  final TheaterState theaterState;
  final ShowState showState;
  final EventState eventState;

  factory AppState.init(){
    return AppState(
      searchQuery: null,
      actorsByName: <String,Actor>{},
      theaterState: TheaterState.initial(),
      showState: ShowState.initial(),
      eventState: EventState.initial(),
    );
  }

  AppState copyWith({
    searchQuery,
    actorsByName,
    theaterState,
    showState,
    eventState,
  }){
    return AppState(
      searchQuery: searchQuery??this.searchQuery,
      actorsByName: actorsByName??this.actorsByName,
      theaterState: theaterState??this.theaterState,
      showState: showState??this.showState,
      eventState: eventState??this.eventState
    );
  }

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is AppState &&
        runtimeType == other.runtimeType &&
        searchQuery == other.searchQuery &&
        actorsByName == other.actorsByName &&
        theaterState == other.theaterState &&
        showState == other.showState &&
        eventState == other.eventState;

  @override
  int get hashCode =>
      searchQuery.hashCode ^
      actorsByName.hashCode ^
      theaterState.hashCode ^
      showState.hashCode ^
      eventState.hashCode;
}