import 'package:meta/meta.dart';

@immutable
class AppState {
  AppState(this.url);
  final String url;
}