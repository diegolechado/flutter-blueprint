part of 'pulls_bloc.dart';

abstract class PullsState {
  const PullsState();
}

class InitialStatePulls extends PullsState { }

class LoadingStatePulls extends PullsState { }

class FailureStatePulls extends PullsState {
  final String message;

  const FailureStatePulls({required this.message});
}

class SuccessStatePulls extends PullsState {
  final List<PullsModel> listPullsModel;

  const SuccessStatePulls({required this.listPullsModel});
}