import 'package:flutter/material.dart';
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

  minhaFuncao() async {
    var meuRepo = await repository.getDetails(widget.id).first;
    setState(() {
      meuProduto = meuRepo;
    });
  }

  @override
  void initState() {
    minhaFuncao();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((meuProduto != null) ? meuProduto!.name : "Consegui!!!"),
        //actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Image.network((meuProduto != null) ? meuProduto!.image : 'erro'),
            Text((meuProduto != null) ? meuProduto!.description : 'erro'),
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
                    child:
                        Text((meuProduto != null) ? meuProduto!.valor : 'erro'),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
}
