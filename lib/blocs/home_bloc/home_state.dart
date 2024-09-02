abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List items;

  HomeLoaded({required this.items});
}
class HomeError extends HomeState {
  final String error;

  HomeError({required this.error});
}
