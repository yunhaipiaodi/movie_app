import 'package:movie_app/model/event.dart';
import 'package:movie_app/model/loading_status.dart';
import 'package:movie_app/redux/event/event_state.dart';
import 'package:movie_app/redux/event/event_actions.dart';
import 'package:movie_app/redux/_common/common_actions.dart';

EventState eventReducer(EventState state,dynamic action){
  if(action is RequestingEventsAction){
    return _requestingEvents(state, action.type);
  }else if(action is ReceivedInTheatersEventsAction){
    return state.copyWith(
      nowInTheatersStatus: LoadingStatus.success,
      nowInTheatersEvents: action.events,
    );
  }else if(action is ReceivedComingSoonEventsAction){
    return state.copyWith(
      comingSoonStatus: LoadingStatus.success,
      comingSoonEvents: action.events,
    );
  }else if(action is ErrorLoadingEventsAction){
    return _errorLoadingEvents(state, action.type);
  }else if(action is UpdateActorsForEventAction){
    return _updateActorsForEvent(state, action);
  }
}

EventState _requestingEvents(EventState state,EventListType listType){
  final status = LoadingStatus.loading;

  if(listType == EventListType.nowInTheaters){
    return state.copyWith(nowInTheatersStatus: status);
  }

  return state.copyWith(comingSoonStatus: status);
}

EventState _errorLoadingEvents(EventState state,EventListType listType){
  final status = LoadingStatus.error;
  if(listType == EventListType.nowInTheaters){
    return state.copyWith(nowInTheatersStatus: status);
  }
  return state.copyWith(comingSoonStatus: status);
}

EventState _updateActorsForEvent(EventState state,UpdateActorsForEventAction action){
  final event = action.event;
  event.actors = action.actors;

  return state.copyWith(
    nowInTheatersEvents:
        _addActorImagesToEvent(state.nowInTheatersEvents, event),
    comingSoonEvents: _addActorImagesToEvent(state.comingSoonEvents, event),
  );
}

List<Event> _addActorImagesToEvent(List<Event> originalEvents,Event replacement){
  final newEvents = <Event>[]..addAll(originalEvents);
  final positionToReplace = originalEvents.indexWhere((candidate){
        return candidate.id == replacement.id;
  });
  if(positionToReplace > -1){
    newEvents[positionToReplace] = replacement;
  }
  return newEvents;
}