
import 'package:ecommerce/clean/presentation/manager/home_bloc/home_event.dart';
import 'package:ecommerce/clean/presentation/manager/home_bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/get_items.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetItems getItems;

  HomeBloc(GetItems items)
      : getItems = items,
        super(HomeInitial()) {
    on<LoadItems>(_loadItem);
  }

  void _loadItem(LoadItems event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      List items = await getItems.call() ;

      emit(HomeLoaded(items: items));
    } catch (e) {
      emit(HomeError(error: "no internet connection"));
    }
    }
}
