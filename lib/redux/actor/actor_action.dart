
import 'package:movie_app/model/actor.dart';

class ActorsUpdatedAction{
  ActorsUpdatedAction(this.actors);
  final List<Actor> actors;
}

class ReceivedActorAvatarAction{
  ReceivedActorAvatarAction(this.actors);
  final List<Actor> actors;
}