import 'package:poc_clean/domain/entities/product.dart';
import 'package:poc_clean/domain/repositories/backend_repository.dart';

class GetProducts {
  final BackendRepositoryInterface repository;

  GetProducts(this.repository);

  Stream<List<Product>> call() {
    return repository.getProducts();
  }
}
