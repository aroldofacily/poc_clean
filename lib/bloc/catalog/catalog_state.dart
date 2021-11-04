import 'package:poc_clean/domain/entities/product.dart';

abstract class CatalogState {}

class CatalogInitialState extends CatalogState {}

class CatalogLoadingState extends CatalogState {}

class CatalogErrorState extends CatalogState {}

class CatalogLoadedState extends CatalogState {
  final List<Product> products;

  CatalogLoadedState(this.products);
}
