import 'package:movie_app/redux/event/event_actions.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/model/event.dart';
import 'package:movie_app/model/loading_status.dart';
import 'package:movie_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class EventPageViewModel{

  EventPageViewModel({
    @required this.loadingStatus,
    @required this.events,
    @required this.refreshEvents,
});

  final LoadingStatus loadingStatus;
  final List<Event> events;
  final Function refreshEvents;

  static EventPageViewModel fromStore(
      Store<AppState> store,
      EventListType type,
      ){
      return EventPageViewModel(
        loadingStatus: type == EventListType.nowInTheaters
            ? store.state.eventState.nowInTheatersStatus
            : store.state.eventState.comingSoonStatus,
        events: type == EventListType.nowInTheaters
          ?store.state.eventState.nowInTheatersEvents
            :store.state.eventState.comingSoonEvents,
        refreshEvents:()=>store.dispatch(RefreshEventsAction(type)),
      );
  }
}