import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_clean/bloc/details/details_state.dart';
import 'package:poc_clean/bloc/details/detais_event.dart';
import 'package:poc_clean/features/repositories/mock_backend_repository.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitialState()) {
    on<DetailLoadedEvent>((event, emitter) {
      print(event);
      getDetail(emitter, event.id);
    });
  }
}

Future<void> getDetail(Emitter<DetailState> emit, int id) async {
  emit(DetailLoadingState());
  final detailProduct = MockBackendRepository().getDetails(id);
  emit(DetailLoadedState(detailProduct));
}
