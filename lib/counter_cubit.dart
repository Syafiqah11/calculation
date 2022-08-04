import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }

  void reset() {
    emit(0);
  }

  void multiple(newState) {
    newState = state * 2;
    emit(newState);
  }

  void divide(newState) {
    newState = state ~/ 2;
    emit(newState);
  }
}
