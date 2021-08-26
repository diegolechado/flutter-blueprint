part of 'pulls_bloc.dart';

abstract class PullsEvent {
  const PullsEvent();
}

class StartEventPulls extends PullsEvent {
  final String url;

  const StartEventPulls({required this.url});
}