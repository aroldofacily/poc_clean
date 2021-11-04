import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_clean/bloc/catalog/catalog_state.dart';
import '../bloc/catalog/catalog_bloc.dart';

import 'package:poc_clean/components/app_scaffold.dart';
import 'package:poc_clean/views/catalog_card.dart';
import 'package:poc_clean/views/catalog_details.dart';

class CatalogViewState extends StatelessWidget {
  const CatalogViewState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        print(state);
        if (state is CatalogInitialState) {
          return const AppScaffold(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CatalogLoadedState) {
          return AppScaffold(
            child: Center(
              child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CatalogCard(
                      name: state.products[index].name,
                      image: state.products[index].image,
                      valor: state.products[index].valor,
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CatalogDetails(id: state.products[index].id)),
                        );
                      },
                    );
                  }),
            ),
          );
        }
        return AppScaffold(
            child: Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ));
      },
    );
  }
}
