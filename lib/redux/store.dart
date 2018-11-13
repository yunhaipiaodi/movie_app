
import 'package:movie_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';
import 'package:movie_app/redux/app/app_reducer.dart';

Store<AppState> createStore(){
  return Store(
    appReducer,
    initialState: new AppState(null),
    distinct: true,
  );
}