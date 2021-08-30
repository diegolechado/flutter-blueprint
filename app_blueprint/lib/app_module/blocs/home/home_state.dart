part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();
}

class LoadingStateHome extends HomeState { }

class FailureStateHome extends HomeState {
  final String message;

  const FailureStateHome({required this.message});
}

class SuccessStateHome extends HomeState {
  final List<ReposModel> list;

  const SuccessStateHome({required this.list});
}