import 'package:poc_clean/domain/entities/product.dart';
import 'package:poc_clean/domain/repositories/backend_repository.dart';

class GetDetails {
  final BackendRepositoryInterface repository;
  final int id;

  GetDetails(this.repository, this.id);

  Product call() {
    return repository.getDetails(id);
  }
}
