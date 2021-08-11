part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class StartEventHome extends HomeEvent {
  final String text;

  const StartEventHome({required this.text});
}