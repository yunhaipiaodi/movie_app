
import 'package:movie_app/model/actor.dart';
import 'package:movie_app/model/event.dart';
import 'package:movie_app/model/theater.dart';

class InitAction {}

class InitCompleteAction {
  InitCompleteAction(
    this.theaters,
    this.selectedTheater,
  );

  final List<Theater> theaters;
  final Theater selectedTheater;
}

class FetchComingSoonEventsIfNotLoadedAction {}

class ChangeCurrentTheaterAction {
  ChangeCurrentTheaterAction(this.selectedTheater);
  final Theater selectedTheater;
}

class UpdateActorsForEventAction {
  UpdateActorsForEventAction(this.event, this.actors);

  final Event event;
  final List<Actor> actors;
}
