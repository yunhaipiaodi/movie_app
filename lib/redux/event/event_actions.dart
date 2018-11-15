import 'package:meta/meta.dart';
import 'package:movie_app/model/event.dart';

class RefreshEventsAction {
  RefreshEventsAction(this.type);
  final EventListType type;
}

class RequestingEventsAction {
  RequestingEventsAction(this.type);
  final EventListType type;
}

class ReceivedInTheatersEventsAction {
  ReceivedInTheatersEventsAction(this.events);
  final List<Event> events;
}

class ReceivedComingSoonEventsAction {
  ReceivedComingSoonEventsAction(this.events);
  final List<Event> events;
}

class ErrorLoadingEventsAction {
  ErrorLoadingEventsAction(this.type);
  final EventListType type;
}
