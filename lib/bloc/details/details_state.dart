import 'package:poc_clean/domain/entities/product.dart';

abstract class DetailState {}

class DetailInitialState extends DetailState {}

class DetailLoadingState extends DetailState {}

class DetailLoadedState extends DetailState {
  final Product product;

  DetailLoadedState(this.product);
}

class DetailErrorState extends DetailState {}
