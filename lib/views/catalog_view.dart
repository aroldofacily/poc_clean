import 'package:flutter/material.dart';
import 'package:poc_clean/components/app_scaffold.dart';
import 'package:poc_clean/domain/entities/product.dart';
import 'package:poc_clean/domain/uses_cases/get_products.dart';
import 'package:poc_clean/features/repositories/mock_backend_repository.dart';
import 'package:poc_clean/views/catalog_card.dart';
import 'package:poc_clean/views/catalog_details.dart';

class CatalogViewState extends StatefulWidget {
  const CatalogViewState({Key? key}) : super(key: key);

  @override
  _CatalogViewStateState createState() => _CatalogViewStateState();
}

class _CatalogViewStateState extends State<CatalogViewState> {
  List<Product> _produtos = [];

  void getProducts() async {
    final getProducts = GetProducts(MockBackendRepository());
    final products = await getProducts().where((list) => list.isNotEmpty).first;
    setState(() {
      _produtos = products;
    });
  }

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Center(
        child: ListView.builder(
            itemCount: _produtos.length,
            itemBuilder: (BuildContext context, int index) {
              return CatalogCard(
                name: _produtos[index].name,
                image: _produtos[index].image,
                valor: _produtos[index].valor,
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CatalogDetails(id: _produtos[index].id)),
                  );
                },
              );
            }),
      ),
    );
  }
}
