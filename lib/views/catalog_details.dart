import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_clean/bloc/details/details_bloc.dart';
import 'package:poc_clean/bloc/details/details_state.dart';
import 'package:poc_clean/bloc/details/detais_event.dart';
import 'package:poc_clean/domain/entities/product.dart';

import 'package:poc_clean/features/repositories/mock_backend_repository.dart';

class CatalogDetails extends StatefulWidget {
  final int id;

  const CatalogDetails({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<CatalogDetails> createState() => _CatalogDetailsState();
}

class _CatalogDetailsState extends State<CatalogDetails> {
  final repository = MockBackendRepository();
  Product? meuProduto;

  // minhaFuncao() async {
  //   var meuRepo = await repository.getDetails(widget.id);
  //   setState(() {
  //     meuProduto = meuRepo;
  //   });
  // }

  @override
  void initState() {
    context.read<DetailBloc>().add(DetailLoadedEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        if (state is DetailInitialState) {
          return const CircularProgressIndicator();
        } else if (state is DetailLoadedState) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.product.id.toString()),
            ),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Image.network((state.product.image)),
                  Text(state.product.name),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(30),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(state.product.valor),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
