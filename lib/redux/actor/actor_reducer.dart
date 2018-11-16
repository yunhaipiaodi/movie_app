import 'package:movie_app/model/actor.dart';
import 'package:movie_app/redux/actor/actor_action.dart';

Map<String,Actor> actorReducer(Map<String,Actor> state,dynamic action){
    if(action is ActorsUpdatedAction){
      return _updateActors(state, action);
    }else if( action is ReceivedActorAvatarAction){
      return _updateActorAvatars(state, action);
    }

    return state;
}

Map<String,Actor> _updateActors(Map<String,Actor> state,dynamic action){
    final actors = <String,Actor>{}..addAll(state);
    action.actors.forEach((Actor actor){
      actors.putIfAbsent(actor.name,() => Actor(name: actor.name));
    });
    return actors;
}

Map<String,Actor> _updateActorAvatars(Map<String,Actor> state,dynamic action){
  final actorsWithAvatars = <String,Actor>{}..addAll(state);
  action.actors.forEach((Actor actor){
    actorsWithAvatars[actor.name] = Actor(
      name:actor.name,
      avatarUrl: actor.avatarUrl,
    );
  });
}


