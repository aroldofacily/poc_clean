import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_clean/bloc/catalog/catalog_event.dart';
import 'package:poc_clean/bloc/catalog/catalog_state.dart';

import 'package:poc_clean/features/repositories/mock_backend_repository.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogInitialState()) {
    on<CatalogLoadEvent>((event, emitter) {
      getCatalog(emitter);
    });
  }

  Future<void> getCatalog(Emitter<CatalogState> emitter) async {
    emitter(CatalogLoadingState());
    final list = MockBackendRepository().getProducts();
    emitter(CatalogLoadedState(list));
  }
} 














// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:poc_clean/bloc/catalog_event.dart';
// import 'package:poc_clean/bloc/catalog_state.dart';
// import 'package:poc_clean/features/repositories/mock_backend_repository.dart';

// MockBackendRepository _mockBackendRepository = MockBackendRepository();
// var list = _mockBackendRepository.getProducts();

// class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
//   CatalogBloc() : super(CatalogInitialState()) {
//     on<CatalogLoadEvent>(getCatalog);
//   }

//   Future<void> getCatalog(
//       CatalogLoadEvent event, Emitter<CatalogState> emit) async {
//     final MockBackendRepository _mockBackendRepository;
//     emit(CatalogLoadingState());
//     try {
//       emit(CatalogLoadedState(list));
//     } catch (e) {
//       emit(CatalogErrorState());
//     }
//   }
// }
