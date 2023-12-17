part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final List<String> recipesList;
  SuccessHomeState(this.recipesList);
}

class FailedHomeState extends HomeState {
  final String message;
  FailedHomeState(this.message);
}
