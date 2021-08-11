part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();
}

class InitialStateHome extends HomeState { }

class LoadingStateHome extends HomeState { }

class FailureStateHome extends HomeState {
  final String message;

  const FailureStateHome({required this.message});
}

class SuccessStateHome extends HomeState {
  final ReposModel result;

  const SuccessStateHome({required this.result});
}