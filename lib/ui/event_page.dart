import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_app/model/event.dart';
import 'package:movie_app/redux/app/app_state.dart';
import 'package:movie_app/viewmodels/event_page_view_model.dart';
import 'package:movie_app/redux/_common/common_actions.dart';

class EventPage extends StatelessWidget{
  EventPage(this.type);
  final EventListType type;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreConnector<AppState,EventPageViewModel>(
      distinct: true,
      onInit: (store) => store.dispatch(FetchComingSoonEventsIfNotLoadedAction()),
      converter: (store) => EventPageViewModel.fromStore(store,type),
      builder: (_,viewModel)=>EventPageContent(viewModel,type),
    );
  }

}

class EventPageContent extends StatelessWidget{
  EventPageContent(this.eventPageViewModel,this.listType);
  final EventPageViewModel eventPageViewModel;
  final EventListType listType;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}