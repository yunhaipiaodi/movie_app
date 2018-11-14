
import 'package:movie_app/redux/app/app_state.dart';
import 'package:movie_app/redux/action/movie_action.dart';

AppState appReducer(AppState appState,dynamic action){
  if(action == MovieAction.LOAD_URL){
    return new AppState(
      "http://img.duoziwang.com/2018/04/2411203527983.jpg",
    );
  }else{
    return appState;
  }
}