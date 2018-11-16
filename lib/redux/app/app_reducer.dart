import 'package:movie_app/redux/app/app_state.dart';
import 'package:movie_app/redux/action/movie_action.dart';
import 'package:movie_app/redux/_common/search.dart';
import 'package:movie_app/redux/actor/actor_reducer.dart';
import 'package:movie_app/redux/theater/theater_reducer.dart';
import 'package:movie_app/redux/show/show_reducer.dart';
import 'package:movie_app/redux/event/event_reducer.dart';

AppState appReducer(AppState appState,dynamic action){
  if(action == MovieAction.LOAD_URL){
    return new AppState(
      searchQuery:searchQueryReducer(appState.searchQuery,action),
      actorsByName:actorReducer(appState.actorsByName, action),
      theaterState: theaterReducer(appState.theaterState, action),
      showState:showReducer(appState.showState, action),
      eventState:eventReducer(appState.eventState, action),
    );
  }else{
    return appState;
  }
}