import 'package:bloc/bloc.dart';
import 'package:ecommerce/blocs/them_bloc/theme_event.dart';
import 'package:ecommerce/blocs/them_bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightTheme()) {
    on<ToggleTheme>(toggleTheme);
  }


  void toggleTheme(ThemeEvent event, Emitter<ThemeState> emit){
    if(event is DarkTheme){
      emit (LightTheme());
    }
    else{
      emit(LightTheme());
    }


  }
}
