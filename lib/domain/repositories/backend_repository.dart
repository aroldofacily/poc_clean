import 'package:poc_clean/domain/entities/product.dart';

abstract class BackendRepositoryInterface {
  Stream<List<Product>> getProducts();
  Stream<Product> getDetails(int id);
}
