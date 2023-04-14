import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

enum BottomNavigationEvent { home, friends, profile }

class NavBlocBloc extends Bloc<BottomNavigationEvent, int> {

  NavBlocBloc() : super(0) {
    on<BottomNavigationEvent>(_choseBottom);
  }

  void _choseBottom(BottomNavigationEvent event, Emitter<int> emit) {
    switch (event) {
      case BottomNavigationEvent.home:
        emit(0);
        break;
      case BottomNavigationEvent.friends:
        emit(1);
        break;
      case BottomNavigationEvent.profile:
        emit(2);
        break;
    }
  }
}
