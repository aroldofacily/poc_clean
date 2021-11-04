import 'package:poc_clean/domain/entities/product.dart';

abstract class BackendRepositoryInterface {
  List<Product> getProducts();
  Product getDetails(int id);
}
