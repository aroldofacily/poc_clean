import 'package:poc_clean/domain/entities/product.dart';
import 'package:poc_clean/domain/repositories/backend_repository.dart';

class MockBackendRepository implements BackendRepositoryInterface {
  @override
  List<Product> getProducts() {
    return [
      Product(
          id: 0,
          name: 'Produto A',
          description: 'Descricao A',
          image:
              'https://www.idealmarketing.com.br/blog/wp-content/uploads/2018/09/marketing-de-produto-03.jpg',
          valor: '20'),
      Product(
          id: 1,
          name: 'Produto B',
          description: 'Descricao B',
          image:
              'http://blog.vhsys.com.br/wp-content/uploads/2019/09/Produto-VHSYS1.png',
          valor: '50'),
      Product(
          id: 5,
          name: 'Produto C',
          description: 'Descricao C',
          image:
              'http://blog.vhsys.com.br/wp-content/uploads/2019/09/Produto-VHSYS1.png',
          valor: '100')
    ];
  }

  @override
  Product getDetails(int id) {
    // var list = getProducts()
    //     .map((event) => event.where((element) => element.id == id).first);
    var list = getProducts().where((element) => element.id == id).first;
    return list;
  }
}


// var list = getProducts()
//         .where((event) => event.where((element) => element.id == id).isNotEmpty)
//         .map((event) => event.first)
//         .first;