import 'package:ecommerce/blocs/home_bloc/home_event.dart';
import 'package:ecommerce/blocs/home_bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeInitial()) {
    on<LoadItems>(loadItem);
  }

  void loadItem(LoadItems event, Emitter<HomeState> emit) async{
   if(event is LoadItems){
     emit(HomeLoading());
     try{
       await Future.delayed(Duration(seconds: 1));
       List items = [
         {
           "image": "images/111.jpg",
           "title": "apple watch",
           "subTitle": "decription",
           "price": "\$350"
         },
         {
           "image": "images/222.webp",
           "title": "apple watch",
           "subTitle": "decription",
           "price": "\$350"
         }
       ];
       emit(HomeLoaded(items:items));
    }
     catch (e){
       emit(HomeError(error: "no internet connection"));
     }

   }

  }

}
